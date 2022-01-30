# Cities

An application built using Rest API with SpringBoot that shows the cities.

<table align="center">
   <thead>
      <tr>
         <th> Features </th>
      </tr>
   </thead>
   <tbody>  
      <tr>
         <td>
           You can add your favorite cities to your favourites.
         </td>
      </tr>
      <tr>
         <td>
           App Logo
         </td>
      </tr>
       <td><img src="https://user-images.githubusercontent.com/45822686/151681090-2a2f5a51-658b-4e29-90d0-27bfda78766a.png" style="max-width: 100%;"></td>
</table>

## This app has following screens:

<table>
   <thead>
      <tr>
         <th></th>
         <th></th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td><img src="https://user-images.githubusercontent.com/45822686/151697106-d7f9df33-ce06-4d82-a613-165db9a0b0f8.png" style="max-width: 100%;"></td>
         <td><img src="https://user-images.githubusercontent.com/45822686/151697114-4ad32f72-200c-4236-8c89-0ac7eeeb78d5.png" style="max-width: 100%;"></td>
      </tr>
         <tr>
         <td><img src="https://user-images.githubusercontent.com/45822686/151697112-8e51c402-d9d2-40bc-bb9d-619aa1d10568.png" style="max-width: 100%;"></td>
         <td><img src="https://user-images.githubusercontent.com/45822686/151697110-dd501293-1762-4e78-853a-cfd8cb159e21.png" style="max-width: 100%;"></td>
      </tr>
   </tbody>
</table>

## How it builded :

- First, the api was created with the SprinBoot Java framework.You can see codes in CityApi.

#### More Information --> <a href="http://aleynaeser.site/springboot-ile-rest-api-olusturmak/">Creating Rest API with SpringBoot</a>

- It was then converted to api json file format and downloaded.

#### More Information --> <a href="http://aleynaeser.site/postman-ile-json-file-indirmek/">Downloading Json file with Postman</a>

- Cities json file is sent inside the assets file in Flutter.
- City values are printed by reading the Json file on the homepage.

#### More Information --> <a href="http://aleynaeser.site/flutter-local-json-dosyasindan-veri-okumak-sehir-ornegi/">Reading Data from Flutter Local Json File</a>

- In addition, the cities printed on the screen were added to the favorite list and displayed on the second page.

## To use this app follow below instructions :

- To run the flutter application, clone this app using below syntax:

` git clone https://github.com/Aleynaesr/city-app-with-springboot-rest-api.git`

- After cloning, install packages using below syntax:

`flutter pub get`

- Above command will install all the necessary packages.

- Run the app on your mobile using below command:

`flutter run`

Thank you happy coding 🎈 👩🏻‍💻
