---

title: Derivation Path and Multiple Accounts from same Seed - Building a Solana Open Source Cross-Platform Wallet App
date: 2021-09-21 00:01 UTC
tags: development, react native, expo, web3, solana
cover: solana-wallet-derivation-path-and-multiple-accounts/accounts-20bc7101.png

---

<div class="content-image" markdown="1">
  ![](solana-wallet-derivation-path-and-multiple-accounts/accounts.png)
</div>

These days I've been reading and learning about how other Wallet Apps generate the accounts.

I noticed that there is something called <strong>Derivation Path</strong>.


## What is Derivation Path

Derivation Paths are used in Wallets where you have a single, human readable, seed phrase that manages different accounts.


This allows to generate addresses by taking the seed and combining it with a derivation path and making possible to generate random accounts that depends of the same seed/phrase.

## How Derivation Path Works

This is how a Derivation Path looks like:

~~~bash
m/purpose/coin_type/account/change/address_index
~~~

### 44' (purpose)

The current HD key system.

### 501' (coin type)

Each blockchain has a number to represent it. Bitcoin is `0`, Ethereum is `60` and Solana is `501`.

More: [https://github.com/satoshilabs/slips/blob/master/slip-0044.md](https://github.com/satoshilabs/slips/blob/master/slip-0044.md)

### 0' (account)

This could be used to have, for example: personal, business...

Starts at 0 and increases.

### 0' (change)

It seems that it was created for Bitcoin so, I'm not using.

### 0' (address_index)

The index of the address.


## How this works with examples

Given this, we can separate personal holdings from company ones. For example:

~~~bash
# company
m/44'/501'/0'/0'

# personal
m/44'/501'/1'/0'
~~~

In the same way, we could separate personal holdings in different addresses:

~~~bash
# savings
m/44'/501'/1'/0'

# paychecks
m/44'/501'/1'/1'

# donations
m/44'/501'/1'/2'
~~~

## How I implemented Derivations Paths in my Wallet App to manage different accounts

First, I've made some changes in the `Store` because after studying this it didn't make sense to save some fields.

So, `Store` now looks like this:

~~~bash
export interface Wallet {
  passcode: number;
  mnemonic: string[];
  seed: string;
}
~~~

~~~bash
export interface Account {
  index: number;
  title: string;
  derivationPath: string;
}
~~~

It seems that I don't need to save more details because I can generate always the same Keypair for the given account:

~~~javascript
const accountFromSeed = (
  seed: string,
  walletIndex: number,
  derivationPath: string,
  accountIndex: 0
) => {
  const derivedSeed = deriveSeed(
    seed,
    walletIndex,
    derivationPath,
    accountIndex
  );
  const keyPair = nacl.sign.keyPair.fromSeed(derivedSeed);
  return new solanaWeb3.Account(keyPair.secretKey);
};
~~~

Last, this is how the Seed is derived:

~~~javascript
const deriveSeed = (
  seed: string,
  walletIndex: number,
  derivationPath: string,
  accountIndex: number
): Buffer | undefined => {
  const path44Change = `m/44'/501'/${walletIndex}'/0'`;
  return ed25519.derivePath(path44Change, Buffer.from(seed, "hex")).key;
};
~~~

Derivation Path is hardcoded ATM while thinking what to do but functions are ready. I saw that other Wallets support older Derivations Paths. [BIP-44](https://github.com/bitcoin/bips/blob/master/bip-0044.mediawiki) seems to be the last.

Before there was other like: [BIP-39](https://github.com/bitcoin/bips/blob/master/bip-0039.mediawiki) or [BIP-32](https://github.com/bitcoin/bips/blob/master/bip-0032.mediawiki).


### ed25519-hd-key package and the issues to have it working in React Native

The package to derivate the paths is [ed25519-hd-key](https://www.npmjs.com/package/ed25519-hd-key).

Implementation for Web was very straightforward as I showed in the code before but again, and because some dependencies not included in React Native, I've had to find a way to have it working in Native.

First, it couldn't find `stream`. I don't know if it's the best solution but I found that adding a new resolver in `metro.config.js` to `readable-stream` package works cross-platform.

~~~javascript
module.exports = {
  resolver: {
    sourceExts: ["jsx", "js", "ts", "tsx", "cjs"],
    extraNodeModules: {
      stream: require.resolve("readable-stream"),
    },
  },
};
~~~

Later, it couldn't find `buffer`. I found [this in Stackoverflow](https://stackoverflow.com/a/49591831) to inject Node globals into React Native. Again, I don't know if there is a better way to do it but it works in both: Web & Native.

So, I created a `global.js` empty, for web. And a `global.native.js` with this:

~~~javascript
// Inject node globals into React Native global scope.

global.Buffer = require("buffer").Buffer;
global.Buffer.TYPED_ARRAY_SUPPORT = false;

global.process = require("process");
global.process.env.NODE_ENV = __DEV__ ? "development" : "production";

// Needed so that 'stream-http' chooses the right default protocol.
global.location = {
  protocol: "file:",
};
~~~

Doing 2 separate files, I don't have to worry when I import it in the main file of the App and inyection only happens in React Native., `App.tsx`:

~~~javascript
...
import "./global"
...
~~~

And that's all! Prototype is working. Now, after set a pin code, the App creates two different accounts: default & donations and it's possible to change between them pressing directly on the title of the account in every screen.

Improve design is pending and also give the option to the user to create more accounts, delete...

[Full code](https://github.com/jferrer/expo-solana-wallet) is on Github and this is the [specific commit](https://github.com/jferrer/expo-solana-wallet/commit/bca3ee7e226324775eb5b2b5e070f11531669235).
