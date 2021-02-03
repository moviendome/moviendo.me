---

title: ES6 for React Developers
date: 2021-02-02 00:01 UTC
tags: development, javascript, es6, react, react native

---

When I started my travel with [React Native](/create-cross-platform-apps-with-react-native-and-expo.html) I noticed that my skills in **Javascript** were totally obsoleted. As **Full-Stack Ruby on Rails developer**, the **Javascript** that I've been doing for years was very basic and focused in the use of *jQuery* mainly for the Frontend and some *CoffeeScript*. So understanding the modern JS was crucial to can be proficient writing and understanding [React](https://reactjs.org/).

First, looking at **ES6** I could see that it's a big change with respect to the *"old JS"* bringing a lot of new features that make **JavaScript** an amazing language much more expressive and readable.

These are the **ES6** features that every [React](https://reactjs.org/) developer must know:

## Better variable declaration

No more `var` to declare variables avoiding issues with global scopes.

Use:

* `const` when you are not going to update its value.

* `let` when you want to update its value.

Also, `const` and `let` only can be declared once in the same scope and they are block scoped.

To fast check, go to JS Console and try to update a variable declared with `const`:

~~~javascript
const something = 'cool';
something = 'Nop';

=> Uncaught TypeError: Assignment to constant variable.
~~~


## String literals

Present in other languages it allows us interpolation in strings:

~~~javascript
// Old
const language = 'Javascript';
language + ' is great';

// New
`${language} is great`;
~~~

Other advantages:

- Avoid escape when special characters
- New lines are preserved

~~~javascript
const multiline = `
This is a multiline message

Thanks to the new feature String Literals

Happy coding,
${language}
`;
~~~


## Arrow functions

Very similar to *CoffeeScript* this new syntax brings several benefits:

- More consise, no more `function` keyword
- Implicit `return`
- Automatic binding to context, so no more `this`

~~~javascript

const multiply = function(a, b) {
  return a * b
}

// same
const multiply = (a, b) => a * b;
~~~


## Deconstructing

It allows us to extract variables from arrays and objects with a simpler syntax:

~~~javascript
const languages = ['Javascript', 'Ruby', 'Golang'];
const [one, two, three] = languages;

const user = {
  name: 'John',
  lastName: 'Doe',
  contact: {
    email: 'john@doe.com'
  }
}

const { name, lastName, contact: { email } } = user;
~~~

You will see this case a lot at the top of React Components to extract values from `props`:

~~~javascript
const { title, subtitle } = props;
~~~


## Rest & Spead operator

It allows us to expand elements:

~~~javascript
const languages = ['Javascript', 'Ruby', 'Golang'];
const newArr = ['Rust', ...languages];
~~~


Also, commonly used to modify a Redux store:

~~~javascript
state.items.map(expense =>
  expense.id === payload.id
    ? {
      ...expense,
      title: payload.title,
      amount: payload.amount,
      }
    : expense
)
~~~

## Shorthand syntax

It makes objects more concise.

~~~javascript
const user = (name, email) => {
  return {
    name: name,
    email: email,
    timestamp: Date.now()
  }
}

// same with shorthand
const user = (name, email) => {
  return {
    name,
    email,
    timestamp: Date.now()
  }
}
~~~

These are only a few of the new features included in ES6 but IMO the most relevant to work with React.
