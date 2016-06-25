# Sample Application to use Spotify web API

Hosted at
[*Spotify Test App*](https://shrouded-scrubland-42887.herokuapp.com/)
by [Harsh Singh](https://twitter.com/harshs08).

## Basic Functionalities:

1. Authenticate a user via Spotify Web API.
2. Once authenticated reads a users playlist and populate the Playlist database.
3. The population of Playlist database is done in Background via `Resque`.
4. User and Playlist have the relation of `has_many` `through`.
5. The app is hosted on heroku.

## Future work:
1. Store the songs in the user's playlist also in database and associate them to users via playlist.
