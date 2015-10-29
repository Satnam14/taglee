# Taglee

[Click here to visit](https://taglee.herokuapp.com)

Taglee is an application which allows Instagram users to search for pictures and videos based on a tag, a start date and an end date. Users can store their search results in an Album and view them at a later time. Taglee uses [Instagram API](https://instagram.com/developer/) to search for recent pictures and user authentication.

## Technology Stack
* MVC Framework - Ruby on Rails
* Database - PostgreSQL
* Host - Heroku
* JavaScript libraries - Backbone.js, jQuery and Underscore.js

## API<sup> * </sup>
New Album can be created with making a POST request to the following address. Name, tag, start date and end date should be provided as parameters. The created ALbum will be returned as a response

`https://taglee.herokuapp.com/api/albums`

Example Parameters -

`"name"=>"Code With Ruby", "tag"=>"ruby", "start"=>"2015-10-05", "finish"=>"2015-10-31`

Pictures and Videos from an album can be retrieved by making a GET request to the following address

`https://taglee.herokuapp.com/api/albums/:id`

* Requires the user to be logged in

## Development

#### Authentication

* Taglee was built in a API first manner. Which meant authentication first because users need access token from Instagram in order to be able to make API calls.
* I tried using the omniauth-instagram gem to implement authentication but it didn't work out for me. [I posted a question on StackOverflow which is still awaiting it's first reply :(](http://stackoverflow.com/questions/33386076/omniauth-instagram-wont-include-my-client-id-as-part-of-the-authorization-url)
* But I was able to get the authentication to work by simply directing the users to authentication URL and obtained an access token for them by making an API call using the official instagram gem from Facebook

#### Database Schema and API
* There are 2 tables in the database other than the users table. One for albums and another for media (Pictures or Videos). The album records hold foreign keys to refer to the user that they belong to. Similarly, the media records hold foreign keys to refer to the album that they belong to.

##### albums
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
user_id     | integer   | not null, foreign key (references users)
name        | string    | not null
tag         | string    | not null
start       | string    | not null
finish      | string    | not null

##### media
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
album_id        | integer   | not null, foreign key (references posts)
url             | string    |
caption         | string    |
tag_time        | string    | not null
poster          | string    |
poster_profile  | string    |
link            | string    | not null

##### Albums construction

Based on the tag name, start date and end date provided by the user. I make the API call to instagram which returns all the recently submitted media. I filter out the ones that do not fall under the specified time period.

```
results = Instagram.tag_recent_media(album.tag)
start_time = DateTime.parse(album.start)
finish_time = DateTime.parse(album.finish)
results.each do |medium|
  tag_time = DateTime.strptime(medium.created_time, '%s')
  if tag_time.between?(start_time, finish_time)
    # construct medium_params from medium
    Medium.create!(medium_params)
  end
end
```

#### Frontend and UI
I used Backbone because the architecture of the application (Albums, media, media belongs to an album) seemed perfect for a typical easy Backbone implementation. It currently has a single router with 3 routes. Currently, there are 3 Views -

    - Profile (User Profile, shows all the created Albums)
    - AlbumForm (Used to create a new Album - can also be used to edit albums)
    - AlbumShow (Shows media from an album)


## Future Plans

#### Features
- [ ] Allow users to search through Instagram using a tag, a start date and an end time, view the results and then have the choice to save the album or not.
- [ ] Allow users to insert individual pictures or videos to an album.
- [ ] Allow users to edit existing albums.
- [ ] Allow users to like and comment pictures and videos
- [ ] Allow users to search for other users, visit profiles of other users and see their pictures.

#### User Interface and Frontend
- [ ] Represent Albums using thumbnails of containing pictures.
- [ ] Make interface to view pictures as close as possible to Instagram.
- [ ] Make subview for each picture inside an album. It'll not only improve organisation but also allow to implement newer features with more ease.
- [ ] Allow users to play videos from within the interface.

#### API and Backend
- [ ] Warn users beforehand about lack of content returned by the chosen tag, start date and end date. Handle edge cases such as end date being before start date.
- [ ] Minimize INSERT operations when creating a new Album. INSERT all the pictures and videos in a single INSERT rather than separate one for each.
