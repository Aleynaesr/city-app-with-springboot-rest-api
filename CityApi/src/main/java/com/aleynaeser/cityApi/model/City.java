package com.aleynaeser.cityApi.model;

import lombok.*;
import org.springframework.data.annotation.Id;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class City {
    @Id
    private String id;
    @NonNull
    private String city;
}
