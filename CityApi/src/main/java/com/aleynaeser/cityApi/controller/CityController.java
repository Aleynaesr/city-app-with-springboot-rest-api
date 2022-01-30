package com.aleynaeser.cityApi.controller;

import com.aleynaeser.cityApi.model.City;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

import static org.springframework.http.HttpStatus.OK;

@RestController
@RequestMapping("/cities")
public class CityController {

   private static final List<City> cities = new ArrayList<>();

        public CityController(){
            //constructors of top 15 city
            City city1 =new City("01","Adana");
            City city2 =new City("02","Adıyaman");
            City city3 =new City("03","Afyonkarahisar");
            City city4 =new City("04","Ağrı");
            City city5 =new City("05","Amasya");
            City city6 =new City("06","Ankara");
            City city7 =new City("07","Antalya");
            City city8 =new City("08","Artvin");
            City city9 =new City("09","Aydın");
            City city10 =new City("10","Balıkesir");
            City city11 =new City("11","Bilecik");
            City city12 =new City("12","Bingöl");
            City city13 =new City("13","Bitlis");
            City city14 =new City("14","Bolu");
            City city15 =new City("15","Burdur");

           //adding the cities
            cities.add(city1);
            cities.add(city2);
            cities.add(city3);
            cities.add(city4);
            cities.add(city5);
            cities.add(city6);
            cities.add(city7);
            cities.add(city8);
            cities.add(city9);
            cities.add(city10);
            cities.add(city11);
            cities.add(city12);
            cities.add(city13);
            cities.add(city14);
            cities.add(city15);

        }

        @GetMapping
        public ResponseEntity<List<City>> getCities(){
            return new ResponseEntity<>(cities, OK);
        }

        //filter by id
        @GetMapping("/{id}")
        public ResponseEntity<City> getCity(@PathVariable String id) {
           City result = cities.stream()
                                .filter(city -> city.getId().equals(id))
                                .findFirst()
                                .orElseThrow(()-> new RuntimeException("City is not found!Make sure you enter the correct city code."));
           return new ResponseEntity<>(result, OK);
        }

        //add other cities with post
        @PostMapping
        public ResponseEntity<City> createCity(@RequestBody City newCity){
            cities.add(newCity);
            return new ResponseEntity<>(newCity, HttpStatus.CREATED);
        }

}
