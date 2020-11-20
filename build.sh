clear && \
docker run -it --rm \
-v /home/me/Code/moviendo.me:/blog \
-v /home/me/Code/moviendo.me/build:/blog/build \
me \
bundle exec middleman build --clean
