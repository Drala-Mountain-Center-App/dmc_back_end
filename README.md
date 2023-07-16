<a name="readme-top"></a>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Issues][issues-shield]][issues-url]
[![Stars][stars-shield]][stars-url]

<!-- DMC Logo -->
<div align="center">
 <pre>
    <code>
      <img src="https://user-images.githubusercontent.com/112587650/253305295-f548caac-b273-4f40-b29e-f5284e94109a.jpeg" alt="DMC Logo" width="90%">
    </code>
  </pre>
  </br>
<!-- Main Image -->
 <pre>
    <code>
      <img src="https://user-images.githubusercontent.com/112587650/252702713-1b23d445-c905-4ad8-ad54-988a234917b8.jpeg" alt="Main Image" width="90%">
    </code>
  </pre>
</div>
<!-- Table of Contents -->

# Table of Contents
- [About](https://github.com/Drala-Mountain-Center-App/dmc_back_end/edit/27-create-backend-readme/README.md#about)
- [Built With](#built-with)
- [Contributors](#contributors)
 
  <details>
      <summary>Table of Contents</summary>
      <ol>
        <li><a href="##About">About</a></li>
        <li><a href="##Built-With">Built With</a></li>
        <li><a href="##GraphQL-Fields">GraphQL Fields</a></li>
        <li><a href="##MVP">MVP</a></li>
        <li><a href="##Possible-Extensions">Possible Extensions</a></li>
        <li><a href="##Wireframes">Wireframes</a></li>
        <li><a href="##Schema">Schema</a></li>
        <li><a href="##Contributors">Contributors</a></li>
      </ol>
  </details>

## About

The Drala Mountain Center App was made in association with [Drala Mountain Center](https://www.dralamountain.org/).
The App allows users to see scheduled programs, meditate with a meditation timer, view videos embeded in the app, view their meditation stats, view images of DMC, and donate to DMC via their website. <br>
The dmc_back_end application provides a single GraphQL endpoint with all app information. The team chose GraphQL for the simplicity of having a single endpoint with the capability to be flexible and efficient when handling queries from the front end application. 
</div>

### Built With:
[![ruby][ruby]][ruby-url]
[![rails][rails]][rails-url]
[![postgresql][postgresql]][postgresql-url]
[![javascript][javascript]][javascript-url]
[![react-native][react-native]][react-native-url]
[![heroku][heroku]][heroku-url]
[![graphql][graphql]][graphql-url]
[![expo][expo]][expo-url]




## GraphQL Fields: 
* GraphQL endpoint: https://drala-mountain-api-4812ef039e59.herokuapp.com/graphql

### Queries and Mutations:
* Example Query:
```
query{
 allUsers {
   id
   firstName
   lastName
   email
   member
 }
}
```

* Example Mutation:
```
mutation {
    createMeditationByEmail(input: {
        totalSittingTime: 10,
        userEmail: "bobdylan@gmail.com"
    }){
        id
        totalSittingTime
        createdAt
        completedBy {
            id
            firstName
        }
    }
}
```
#### List of queries

##### User Queries
* queries: allUsers, user(id: user_id), userByEmail(email: "user_email")
* fields: id, firstName, lastName, email, member, totalMeditations, totalMeditationTime, averageMeditationTime

##### Video Queries
* queries: allVideos, videoById(id: video_id)
* fields: id, title, description, speaker, topic, length, dateRecorded, videoUrl, thumbnailUrl, embedCode, vimeoId

##### Program Queries
* query: allPrograms
* fields: name, startDate, endDate, content, image, price, url, registrationUrl, categories, teachers

#### List of mutations

##### User mutations
* Not yet available for public production use

##### Meditation mutations
* mutations: createMeditationByEmail(input: { totalSittingTime: Integer, userEmail: "String"
* available fields: id, totalSittingTime, createdAt, completedBy { any_user_field }

## MVP 
* Recreate the feel of Drala-Mounatain-Center's web application as a phone application.
* Create a link to Drala Mountain Center donation site, Network for Good within our application.
* Create a meditation timer page that provides user with a soothing experience while meditating.
* Database of DMC video talks, searchable, possibly using Vimeo.
* Import program calendar from DMC website backend.
* Integrate GraphQL as a stretch technology to facilitate API calls to our backend
* Integrate React Native as a stretch technology to prepare application for IOS deployment.

## Possible Extensions

* Login for user, to allow for statistics collection.
* User data collection displayed: "Here's your meditation habits, you've watched these videos".
* Randomized daily quotes from highly regarded figures linked to DMC or lojong slogans.
* Stripe/Auth.net/square for payment integration (likely prefer Stripe or something that can take apple/google pay, Paypal, Venmo, etc.
* Hosting on Android and Apple Store.
* AWS/Docker integration.
* Like/Love buttons/discussion boards for videos.
* Specific Advanced Practice Trackers (Ngondro/Stroke Practice).
* Integrate Web-sockets to add live chat feature.
* Add collaborative meditation option (using google meetup, facetime or other video app, not sure what the options are)

## Wireframes

<pre>
    <code>
      <img src="https://user-images.githubusercontent.com/112587650/253416539-4fa40861-68f1-46b2-954d-ab346ce4b8c4.png" alt="Wireframe Homepage Image" width="50%">
    </code>
    <br>

    <code>
      <img src="https://user-images.githubusercontent.com/112587650/253416949-f88c04cb-e87e-4da8-85a4-a1349ce247c0.png" alt="Wireframe Calendar Image" width="50%">
    </code>
    <br>

    <code>
      <img src="https://user-images.githubusercontent.com/112587650/253417164-ce8532f2-d160-4cc2-9946-154db0b4fafc.png" alt="Wireframe Calendar Image" width="50%">
    </code>
    <br>
</pre>

## Schema

<pre>
    <code>
      <img src="https://github.com/Drala-Mountain-Center-App/dmc_back_end/assets/121198380/e634bdfe-e66a-473e-86c9-3691aa6f1748" alt="DMC Schema Image" width="90%">
    </code>
</pre>

## Contributors

* Reid Miller: [![Linkedin][linkedin]][reid-li-url] [![Github][Github]][reid-gh-url]
* Logan Cole: [![Linkedin][linkedin]][logan-li-url] [![Github][Github]][logan-gh-url]
* Alejandro Lopez: [![Linkedin][linkedin]][alejandro-li-url] [![Github][Github]][alejandro-gh-url]
* Sarah Moore: [![Linkedin][linkedin]][sarah-li-url] [![Github][Github]][sarah-gh-url]
* Sam McElhinney: [![Linkedin][linkedin]][sam-li-url] [![Github][Github]][sam-gh-url]
* Carol Bradsen: [![Linkedin][linkedin]][carol-li-url] [![Github][Github]][carol-gh-url]







<!-- MARKDOWN LINKS & IMAGES -->
<!--  -->
[contributors-shield]: https://img.shields.io/github/contributors/Drala-Mountain-Center-App/dmc_back_end.svg?style=for-the-badge
[contributors-url]: https://github.com/Drala-Mountain-Center-App/dmc_back_end/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Drala-Mountain-Center-App/dmc_back_end.svg?style=for-the-badge
[forks-url]: https://github.com/Drala-Mountain-Center-App/dmc_back_end/network/members
[stars-shield]: https://img.shields.io/github/stars/Drala-Mountain-Center-App/dmc_back_end.svg?style=for-the-badge
[stars-url]: https://github.com/Drala-Mountain-Center-App/dmc_back_end/stargazers
[issues-shield]: https://img.shields.io/github/issues/Drala-Mountain-Center-App/dmc_back_end.svg?style=for-the-badge
[issues-url]: https://github.com/Drala-Mountain-Center-App/dmc_back_end/issues
[linkedin]: https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white
[logan-li-url]: https://www.linkedin.com/in/logan-cole-exasper
[reid-li-url]: https://www.linkedin.com/in/reid-miller-427377a4/
[alejandro-li-url]: https://www.linkedin.com/in/alejandrolopez1992/
[sam-li-url]: https://www.linkedin.com/in/samantha-mcelhinney/
[carol-li-url]: https://www.linkedin.com/in/carol-bradsen/
[sarah-li-url]: https://www.linkedin.com/in/sarah-moore-a35196127/
[ruby]: https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[ruby-url]: https://www.ruby-lang.org/en/
[rails]: https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[rails-url]: https://rubyonrails.org/
[postgresql]: https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white/
[postgresql-url]: https://www.postgresql.org/docs/
[heroku]: https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white
[heroku-url]: https://devcenter.heroku.com/articles/getting-started-with-rails7
[javascript]: https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black
[javascript-url]: https://developer.mozilla.org/en-US/docs/Web/JavaScript
[react-native]: https://img.shields.io/badge/React_Native-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[react-native-url]: https://reactnative.dev/docs/getting-started
[graphql]: https://img.shields.io/badge/-GraphQL-E10098?style=for-the-badge&logo=graphql&logoColor=white
[graphql-url]: https://graphql.org/
[expo]: https://img.shields.io/badge/expo-1C1E24?style=for-the-badge&logo=expo&logoColor=#D04A37
[expo-url]: https://docs.expo.dev/
[github]: https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white
[project-FE-url]: https://github.com/Drala-Mountain-Center-App/dmc_front_end
[project-BE-url]: https://github.com/Drala-Mountain-Center-App/dmc_back_end
[logan-gh-url]: https://github.com/exasperlnc
[alejandro-gh-url]: https://github.com/AlejandroLopez1992
[reid-gh-url]: https://github.com/reidsmiller
[sam-gh-url]: https://github.com/SamanthaMcElhinney
[carol-gh-url]: https://github.com/CBradsen
[sarah-gh-url]: https://github.com/sarahcatherine311
