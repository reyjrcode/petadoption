// To parse this JSON data, do
//
//     final restaurant = restaurantFromJson(jsonString);

import 'dart:convert';

Restaurant restaurantFromJson(String str) => Restaurant.fromJson(json.decode(str));

String restaurantToJson(Restaurant data) => json.encode(data.toJson());

class Restaurant {
    Restaurant({
        this.id,
        this.name,
        this.phoneNumber,
        this.address,
        this.type,
        this.description,
        this.localHours,
        this.cuisines,
        this.foodPhotos,
        this.logoPhotos,
        this.storePhotos,
        this.dollarSigns,
        this.pickupEnabled,
        this.deliveryEnabled,
        this.isOpen,
        this.offersFirstPartyDelivery,
        this.offersThirdPartyDelivery,
        this.miles,
        this.weightedRatingValue,
        this.aggregatedRatingCount,
        this.supportsUpcCodes,
    });

    String? id;
    String? name;
    int? phoneNumber;
    Address? address;
    String? type;
    String? description;
    LocalHours? localHours;
    List<String>? cuisines;
    List<String>? foodPhotos;
    List<String>? logoPhotos;
    List<dynamic>? storePhotos;
    int? dollarSigns;
    bool? pickupEnabled;
    bool? deliveryEnabled;
    bool? isOpen;
    bool? offersFirstPartyDelivery;
    bool? offersThirdPartyDelivery;
    double? miles;
    double? weightedRatingValue;
    int? aggregatedRatingCount;
    bool? supportsUpcCodes;

    Restaurant copyWith({
        String? id,
        String? name,
        int? phoneNumber,
        Address? address,
        String? type,
        String? description,
        LocalHours? localHours,
        List<String>? cuisines,
        List<String>? foodPhotos,
        List<String>? logoPhotos,
        List<dynamic>? storePhotos,
        int? dollarSigns,
        bool? pickupEnabled,
        bool? deliveryEnabled,
        bool? isOpen,
        bool? offersFirstPartyDelivery,
        bool? offersThirdPartyDelivery,
        double? miles,
        double? weightedRatingValue,
        int? aggregatedRatingCount,
        bool? supportsUpcCodes,
    }) => 
        Restaurant(
            id: id ?? this.id,
            name: name ?? this.name,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            address: address ?? this.address,
            type: type ?? this.type,
            description: description ?? this.description,
            localHours: localHours ?? this.localHours,
            cuisines: cuisines ?? this.cuisines,
            foodPhotos: foodPhotos ?? this.foodPhotos,
            logoPhotos: logoPhotos ?? this.logoPhotos,
            storePhotos: storePhotos ?? this.storePhotos,
            dollarSigns: dollarSigns ?? this.dollarSigns,
            pickupEnabled: pickupEnabled ?? this.pickupEnabled,
            deliveryEnabled: deliveryEnabled ?? this.deliveryEnabled,
            isOpen: isOpen ?? this.isOpen,
            offersFirstPartyDelivery: offersFirstPartyDelivery ?? this.offersFirstPartyDelivery,
            offersThirdPartyDelivery: offersThirdPartyDelivery ?? this.offersThirdPartyDelivery,
            miles: miles ?? this.miles,
            weightedRatingValue: weightedRatingValue ?? this.weightedRatingValue,
            aggregatedRatingCount: aggregatedRatingCount ?? this.aggregatedRatingCount,
            supportsUpcCodes: supportsUpcCodes ?? this.supportsUpcCodes,
        );

    factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["_id"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        type: json["type"],
        description: json["description"],
        localHours: json["local_hours"] == null ? null : LocalHours.fromJson(json["local_hours"]),
        cuisines: json["cuisines"] == null ? [] : List<String>.from(json["cuisines"]!.map((x) => x)),
        foodPhotos: json["food_photos"] == null ? [] : List<String>.from(json["food_photos"]!.map((x) => x)),
        logoPhotos: json["logo_photos"] == null ? [] : List<String>.from(json["logo_photos"]!.map((x) => x)),
        storePhotos: json["store_photos"] == null ? [] : List<dynamic>.from(json["store_photos"]!.map((x) => x)),
        dollarSigns: json["dollar_signs"],
        pickupEnabled: json["pickup_enabled"],
        deliveryEnabled: json["delivery_enabled"],
        isOpen: json["is_open"],
        offersFirstPartyDelivery: json["offers_first_party_delivery"],
        offersThirdPartyDelivery: json["offers_third_party_delivery"],
        miles: json["miles"]?.toDouble(),
        weightedRatingValue: json["weighted_rating_value"]?.toDouble(),
        aggregatedRatingCount: json["aggregated_rating_count"],
        supportsUpcCodes: json["supports_upc_codes"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "phone_number": phoneNumber,
        "address": address?.toJson(),
        "type": type,
        "description": description,
        "local_hours": localHours?.toJson(),
        "cuisines": cuisines == null ? [] : List<dynamic>.from(cuisines!.map((x) => x)),
        "food_photos": foodPhotos == null ? [] : List<dynamic>.from(foodPhotos!.map((x) => x)),
        "logo_photos": logoPhotos == null ? [] : List<dynamic>.from(logoPhotos!.map((x) => x)),
        "store_photos": storePhotos == null ? [] : List<dynamic>.from(storePhotos!.map((x) => x)),
        "dollar_signs": dollarSigns,
        "pickup_enabled": pickupEnabled,
        "delivery_enabled": deliveryEnabled,
        "is_open": isOpen,
        "offers_first_party_delivery": offersFirstPartyDelivery,
        "offers_third_party_delivery": offersThirdPartyDelivery,
        "miles": miles,
        "weighted_rating_value": weightedRatingValue,
        "aggregated_rating_count": aggregatedRatingCount,
        "supports_upc_codes": supportsUpcCodes,
    };
}

class Address {
    Address({
        this.streetAddr,
        this.city,
        this.state,
        this.zipcode,
        this.country,
        this.lat,
        this.lon,
        this.streetAddr2,
        this.latitude,
        this.longitude,
    });

    String? streetAddr;
    String? city;
    String? state;
    String? zipcode;
    String? country;
    double? lat;
    double? lon;
    String? streetAddr2;
    double? latitude;
    double? longitude;

    Address copyWith({
        String? streetAddr,
        String? city,
        String? state,
        String? zipcode,
        String? country,
        double? lat,
        double? lon,
        String? streetAddr2,
        double? latitude,
        double? longitude,
    }) => 
        Address(
            streetAddr: streetAddr ?? this.streetAddr,
            city: city ?? this.city,
            state: state ?? this.state,
            zipcode: zipcode ?? this.zipcode,
            country: country ?? this.country,
            lat: lat ?? this.lat,
            lon: lon ?? this.lon,
            streetAddr2: streetAddr2 ?? this.streetAddr2,
            latitude: latitude ?? this.latitude,
            longitude: longitude ?? this.longitude,
        );

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        streetAddr: json["street_addr"],
        city: json["city"],
        state: json["state"],
        zipcode: json["zipcode"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        streetAddr2: json["street_addr_2"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "street_addr": streetAddr,
        "city": city,
        "state": state,
        "zipcode": zipcode,
        "country": country,
        "lat": lat,
        "lon": lon,
        "street_addr_2": streetAddr2,
        "latitude": latitude,
        "longitude": longitude,
    };
}

class LocalHours {
    LocalHours({
        this.operational,
        this.delivery,
        this.pickup,
        this.dineIn,
    });

    Delivery? operational;
    Delivery? delivery;
    Delivery? pickup;
    Delivery? dineIn;

    LocalHours copyWith({
        Delivery? operational,
        Delivery? delivery,
        Delivery? pickup,
        Delivery? dineIn,
    }) => 
        LocalHours(
            operational: operational ?? this.operational,
            delivery: delivery ?? this.delivery,
            pickup: pickup ?? this.pickup,
            dineIn: dineIn ?? this.dineIn,
        );

    factory LocalHours.fromJson(Map<String, dynamic> json) => LocalHours(
        operational: json["operational"] == null ? null : Delivery.fromJson(json["operational"]),
        delivery: json["delivery"] == null ? null : Delivery.fromJson(json["delivery"]),
        pickup: json["pickup"] == null ? null : Delivery.fromJson(json["pickup"]),
        dineIn: json["dine_in"] == null ? null : Delivery.fromJson(json["dine_in"]),
    );

    Map<String, dynamic> toJson() => {
        "operational": operational?.toJson(),
        "delivery": delivery?.toJson(),
        "pickup": pickup?.toJson(),
        "dine_in": dineIn?.toJson(),
    };
}

class Delivery {
    Delivery({
        this.monday,
        this.tuesday,
        this.wednesday,
        this.thursday,
        this.friday,
        this.saturday,
        this.sunday,
    });

    String? monday;
    String? tuesday;
    String? wednesday;
    String? thursday;
    String? friday;
    String? saturday;
    String? sunday;

    Delivery copyWith({
        String? monday,
        String? tuesday,
        String? wednesday,
        String? thursday,
        String? friday,
        String? saturday,
        String? sunday,
    }) => 
        Delivery(
            monday: monday ?? this.monday,
            tuesday: tuesday ?? this.tuesday,
            wednesday: wednesday ?? this.wednesday,
            thursday: thursday ?? this.thursday,
            friday: friday ?? this.friday,
            saturday: saturday ?? this.saturday,
            sunday: sunday ?? this.sunday,
        );

    factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
        monday: json["Monday"],
        tuesday: json["Tuesday"],
        wednesday: json["Wednesday"],
        thursday: json["Thursday"],
        friday: json["Friday"],
        saturday: json["Saturday"],
        sunday: json["Sunday"],
    );

    Map<String, dynamic> toJson() => {
        "Monday": monday,
        "Tuesday": tuesday,
        "Wednesday": wednesday,
        "Thursday": thursday,
        "Friday": friday,
        "Saturday": saturday,
        "Sunday": sunday,
    };
}
