# OpenAdmin - Angular
A collection of Angular 1.5 components married with Rails.

# Pre-requisites

- [angular.js](https://angularjs.org/)
- [node](https://nodejs.org)
- [bower](http://bower.io/)
- [rails](https://rubyonrails.org)

# Installation

1. Bundle up `you know this part`
2. Install node & npm `brew install node`
3. Install bower globally `npm install -g bower`
4. `cd client && bower install`
5. Migrate and run Rails

# Structure

1. All client side sources are inside `/client`
2. `/client/src/manifest.js` are linked inside `app/assets/javascript/app.js`
3. `/client/stylesheets/manifest.sass` are linked inside `app/assets/javascript/app.css`
4. `app.js` and `app.css` compiles everything.
5. If you want to add another manifest, add the path first inside `/config/assets.rbv

The structure was made possible because of `angular-rails-templates v0.1.3`

# Contributors

Feel free to add your names here.
If you have a component to share, place it inside client/src/components.

[@alvingarcia](https://github.com/alvingarcia)

[@normancapule](https://github.com/normancapule)
