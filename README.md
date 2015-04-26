# Shorty // A Url shortener

![Alt text](/app/assets/images/Front-page.png?raw=true "Front Page View")

## Description

Shorty is a url shortner built to take long urls and shorten them to allow users to share links easily. Shorty also displays the top 100 visited links. [View the app here!](https://shorty-app.herokuapp.com/)

## Features

- Enter a long URL into the shortener to receive a shorter URL
- Hit the copy button to copy the short URL onto the clipboard
- See the top 100 visited URLs from Shorty

## Development
Below is a short description on the technical side of Shorty.

#### Model/Data Design
- Shorty uses a Postgres database with a single table to persist the provided URLs, the shortened versions, and the view count.
- If the user does not include an http protocal, Shorty will add the http protocol to before validation. It uses the before_validation hook so that when the original url is validated for uniqueness, the validation will still work properly.
- Shorty uses Ruby's SecureRandom library to generate the short urls. It will generate 6 character urls with 64 different combinations so that there will be over 68 billion unique URLs.

#### Controller Design
- The Application Controller has a rescue for any errors with a simple 404 template.
- The Urls Controller has 3 actions: new, create, show.
  - New: the main page and root of the app. It allows users to create new urls by rendering the 'new' view.
  - Create: this post action will create new urls or find urls if they already exist in the database. It returns JavaScript and calls the newLink() and refreshTop100() functions with the proper arguments.
  - Show: this will take in the shortened URL as part of the params and increment the view count in the database. Additionally this will redirect the user to the correct external URL.
- There is a before_action hook that will set the Top 100 URLs before the new and create actions.

#### Views Design
- Shorty is a single view application.
- The main view calls two partials (form and top100) so that the HTML document is more legible.
- The copy button uses another library called ZeroClipboard.
- There is a create script so that the correct response is sent back to the browser.

#### Challenges
- The primary challenge was on how to generate the unqiue urls. I was about to build my own base 64 converter, but there was already a library that existed.
- Another challenge was figuring out a good user flow so that they didn't have to go to multiple pages to use the app.

## Future Improvements

- More specific errors depending on the request that raises the error.
- Add pagination to the top 100 section
- Consider using shorter URLs by determining how many characters can still be used by querying the database. For instance, if there are only 60 records that exist in the database, then a single character url can be provided. However, if there are 67 records, then a two character url must be returned. However, there are some performance issues to be considered.
- Add more validation for user input. Currently, there is no check for a valid url.

## License

Url Shortener is MIT Licensed. See LICENSE for details.
