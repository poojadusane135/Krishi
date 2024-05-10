import 'package:flutter/material.dart';

class FertilizerScreen extends StatefulWidget {
  @override
  _FertilizerScreenState createState() => _FertilizerScreenState();
}

class _FertilizerScreenState extends State<FertilizerScreen> {
  String? selectedCrop; // Nullable selectedCrop
  String? selectedSoil; // Nullable selectedSoil
  String? selectedFertilizer; // Nullable selectedFertilizer

  Map<String, Map<String, String>> cropSoilToFertilizer = {
    'Maize': {
      'Sandy': 'Urea',
      'Loamy': '17-17-17',
      'Black': '14-35-14',
      'Red': '28-28',
      'Clayey': '17-17-17'
    },
    'Sugarcane': {
      'Sandy': 'DAP',
      'Loamy': '17-17-17',
      'Black': '17-17-17',
      'Red': '20-20',
      'Clayey': '14-35-14'
    },
    'Cotton': {
      'Sandy': '14-35-14',
      'Loamy': '14-35-14',
      'Black': 'Urea',
      'Red': '17-17-17',
      'Clayey': '14-35-14'
    },
    'Tobacco': {
      'Sandy': '28-28',
      'Loamy': '28-28',
      'Black': '28-28',
      'Red': '28-28',
      'Clayey': '28-28'
    },
    'Paddy': {
      'Sandy': 'Urea',
      'Loamy': '28-28',
      'Black': 'Urea',
      'Red': '20-20',
      'Clayey': 'Urea'
    },
    'Barley': {
      'Sandy': '17-17-17',
      'Loamy': '17-17-17',
      'Black': '14-35-14',
      'Red': '17-17-17',
      'Clayey': '20-20'
    },
    'Wheat': {
      'Sandy': 'Urea',
      'Loamy': 'Urea',
      'Black': 'Urea',
      'Red': 'Urea',
      'Clayey': 'Urea'
    },
    'Millets': {
      'Sandy': '28-28',
      'Loamy': '20-20',
      'Black': 'Urea',
      'Red': '28-28',
      'Clayey': 'Urea'
    },
    'Oil seeds': {
      'Sandy': '14-35-14',
      'Loamy': '14-35-14',
      'Black': 'Urea',
      'Red': '20-20',
      'Clayey': 'Urea'
    },
    'Pulses': {
      'Sandy': 'DAP',
      'Loamy': 'DAP',
      'Black': 'Urea',
      'Red': 'Urea',
      'Clayey': 'Urea'
    },
    'Ground Nuts': {
      'Sandy': 'DAP',
      'Loamy': 'DAP',
      'Black': 'Urea',
      'Red': '28-28',
      'Clayey': 'Urea'
    }
  };

  Map<String, String> fertilizerInfo = {
    'Urea': '''
    Urea fertilizer can be effectively used for maize cultivation in sandy soil. However, sandy soils are prone to leaching, which can lead to the loss of nitrogen from the soil. To mitigate nitrogen leaching, it's essential to manage urea application carefully.

    Best Practices for Urea Application in Sandy Soil:
    - Split applications of urea throughout the growing season are recommended to ensure optimal nitrogen availability for maize plants.
    - By dividing the total nitrogen requirement into smaller doses and applying them at different growth stages, you can minimize nitrogen loss through leaching and maximize nutrient uptake by the plants.
    - Incorporating urea into the soil or applying it just before rainfall or irrigation can help reduce the risk of nitrogen leaching.

    Considerations for Sandy Soil Management:
    - Sandy soils may require supplemental irrigation to maintain adequate soil moisture levels for maize growth, especially during dry periods.
    - Organic matter amendments such as compost or manure can help improve the water and nutrient-holding capacity of sandy soils over time.
    - Regular soil testing is crucial to monitor nutrient levels and adjust fertilizer application rates accordingly, ensuring optimal maize growth and yield.
  ''',
    '17-17-17': '''
    17-17-17 fertilizer is a balanced fertilizer containing equal parts of nitrogen, phosphorus, and potassium. It is suitable for maize cultivation in loamy soil, which provides good drainage while retaining moisture and nutrients.

    Best Practices for 17-17-17 Application in Loamy Soil:
    - Apply 17-17-17 fertilizer based on soil test results and crop nutrient requirements.
    - Incorporate the fertilizer into the soil before planting or apply it just before rainfall or irrigation to ensure proper nutrient uptake by maize plants.
    - Avoid overapplication of phosphorus and potassium to prevent nutrient imbalances and potential environmental pollution.
    
    Considerations for Loamy Soil Management:
    - Loamy soils are well-suited for maize cultivation due to their balanced drainage and nutrient retention capabilities.
    - Regular soil testing is essential to assess nutrient levels and adjust fertilizer application rates accordingly.
    - Mulching can help conserve soil moisture and regulate soil temperature, promoting optimal maize growth in loamy soil conditions.
  ''',
    '14-35-14': '''
    14-35-14 fertilizer is a high-phosphorus fertilizer suitable for promoting root and flower growth in black soil. Black soils, also known as regur soils or black cotton soils, are highly fertile and rich in nutrients like calcium, magnesium, and potassium.

    Best Practices for 14-35-14 Application in Black Soil:
    - Apply 14-35-14 fertilizer based on soil test results and maize nutrient requirements.
    - Incorporate the fertilizer into the soil before planting to ensure proper root development and nutrient uptake by maize plants.
    - Monitor soil moisture levels and adjust irrigation practices as needed to maintain optimal soil moisture for maize growth in black soil.
    
    Considerations for Black Soil Management:
    - Black soils have excellent moisture retention properties but may become waterlogged during heavy rainfall. Proper soil drainage is essential to prevent waterlogging and ensure optimal maize growth.
    - Organic matter additions such as compost or manure can help enhance soil fertility and structure in black soils, promoting healthy maize growth and yield.
    - Regular soil testing and nutrient management are necessary to maintain soil fertility and optimize maize production in black soil conditions.
  ''',
    '28-28': '''
    28-28 fertilizer is a balanced fertilizer with high levels of nitrogen and phosphorus, making it suitable for maize cultivation in red soil. Red soils are typically well-drained and moderately fertile, with a sandy texture and a reddish hue due to the presence of iron oxide.

    Best Practices for 28-28 Application in Red Soil:
    - Apply 28-28 fertilizer based on soil test results and maize nutrient requirements.
    - Incorporate the fertilizer into the soil before planting or apply it just before rainfall to ensure proper nutrient uptake by maize plants.
    - Monitor soil pH and organic matter content to optimize nutrient availability and uptake in red soil.
    
    Considerations for Red Soil Management:
    - Red soils may require supplemental irrigation during dry periods to maintain optimal soil moisture levels for maize growth.
    - Mulching can help conserve soil moisture and regulate soil temperature in red soil, promoting healthy maize growth.
    - Regular soil testing and nutrient management are essential for maximizing maize productivity and soil fertility in red soil conditions.
  ''',
    'DAP': '''
    DAP fertilizer, with its high phosphorus content, is beneficial for sugarcane cultivation, especially in sandy soils where phosphorus availability may be limited. Sandy soils are characterized by their low nutrient retention capacity and may require supplemental phosphorus to support sugarcane growth and yield.

    Application Guidelines:

    Timing of Application:

    DAP fertilizer should be applied before planting or during the early stages of sugarcane growth to promote robust root development and enhance phosphorus uptake by the plants.
    Incorporating DAP into the soil before planting ensures even distribution of phosphorus and facilitates root access to nutrients from the early stages of growth.
    Application Rate:

    The application rate of DAP fertilizer can vary depending on soil test results, phosphorus requirements of sugarcane, and expected yield goals.
    It is essential to conduct soil tests to determine the existing phosphorus levels and calculate the appropriate fertilizer rates accordingly.
    Generally, for sugarcane cultivation in sandy soil, the recommended phosphorus application rate ranges from 40 to 60 kg per hectare.
    Application Method:

    DAP fertilizer can be broadcasted uniformly across the soil surface or applied in bands alongside sugarcane rows, ensuring good soil contact for optimal nutrient uptake.
    Incorporating DAP into the soil before planting helps in better distribution of phosphorus and facilitates root access to nutrients.
    Environmental Considerations:

    When applying DAP fertilizer to sugarcane in sandy soil, environmental factors such as rainfall patterns and soil moisture levels should be considered to minimize nutrient losses through leaching or runoff.
    Proper irrigation management is crucial to ensure adequate soil moisture for optimal sugarcane growth and phosphorus uptake, especially in sandy soils with low water-holding capacity.
    Benefits of DAP Fertilizer:

    DAP provides readily available phosphorus, which is essential for promoting early root development, enhancing tillering, and improving overall plant vigor in sugarcane.
    Phosphorus from DAP fertilizer helps in the formation of sugar and starch molecules, contributing to increased sucrose content and higher sugar yields in sugarcane crops.
    Sandy soils often lack sufficient phosphorus, and DAP fertilizer can help overcome phosphorus deficiencies, leading to improved sugarcane growth, yield, and quality.
    In summary, DAP fertilizer plays a vital role in supporting sugarcane cultivation in sandy soil by providing essential phosphorus nutrients for optimal plant growth and yield. Proper application and management practices are essential to maximize the benefits of DAP fertilizer while minimizing environmental impacts.
  ''',
    '20-20': '''
         20-20 is a balanced fertilizer with equal parts of nitrogen and phosphorus. While it's not specifically tailored for maize cultivation in red soil, it can still be used effectively depending on the specific nutrient requirements and soil conditions.

    Best Practices for 20-20 Application in Red Soil:
    - Apply 20-20 fertilizer based on soil test results and maize nutrient requirements.
    - Incorporate the fertilizer into the soil before planting or apply it just before rainfall to ensure proper nutrient uptake by maize plants.
    - Monitor soil pH and organic matter content to optimize nutrient availability and uptake in red soil.

    Considerations for Red Soil Management:
    - Red soils may require supplemental irrigation during dry periods to maintain optimal soil moisture levels for maize growth.
    - Mulching can help conserve soil moisture and regulate soil temperature in red soil, promoting healthy maize growth.
    - Regular soil testing and nutrient management are essential for maximizing maize productivity and soil fertility in red soil conditions.
  ''',
    // Add specific information for cotton in black soil when urea is selected
    'UreaBlackCotton': '''
        For cotton crops grown in black soil, urea is indeed a commonly used fertilizer due to its high nitrogen content, which is crucial for cotton plant growth and development. Here are some specifics regarding the application of urea fertilizer for cotton crops in black soil:

  Timing of Application: Urea fertilizer is typically applied to cotton crops in black soil at specific growth stages. The initial application is often done at the time of planting or shortly after emergence to provide the young plants with the necessary nitrogen boost for early growth. Subsequent applications may be necessary during the growing season, depending on factors such as soil nitrogen levels, crop growth stage, and weather conditions.

  Application Rate: The application rate of urea fertilizer can vary depending on factors such as soil fertility, expected yield goals, and nutrient requirements of the cotton plants. It is essential to conduct soil tests to determine the existing nutrient levels and calculate the appropriate fertilizer rates accordingly. Generally, for cotton crops in black soil, the recommended nitrogen application rate ranges from 100 to 150 kg per hectare, divided into multiple applications throughout the growing season.

  Application Method: Urea fertilizer can be applied to cotton crops in black soil using various methods, including broadcasting, banding, or fertigation. Broadcasting involves spreading the fertilizer uniformly across the soil surface, while banding involves placing the fertilizer in bands alongside the crop rows. Fertigation, on the other hand, involves applying the fertilizer through irrigation water, which allows for efficient nutrient uptake by the cotton plants.

  Nitrogen Management: Proper nitrogen management is essential to maximize the effectiveness of urea fertilizer while minimizing potential environmental impacts such as nitrogen leaching or runoff. Splitting the total nitrogen application into multiple smaller doses throughout the growing season can help ensure that the nutrient is available to the cotton plants when needed most, thereby promoting optimal growth and yield.

  Environmental Considerations: When applying urea fertilizer to cotton crops in black soil, it is crucial to consider environmental factors such as rainfall patterns, soil moisture levels, and temperature conditions. Heavy rainfall shortly after fertilizer application can increase the risk of nitrogen loss through leaching or denitrification, while dry weather conditions may hinder nutrient uptake by the plants. Adjusting the timing and method of fertilizer application based on weather forecasts and soil moisture conditions can help minimize nutrient losses and maximize crop productivity.
  ''',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fertilizer',
          style: TextStyle(color: Colors.white), // Text color white
        ),
        backgroundColor: Color(0xFF285429), // Custom color #285429
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Crop Type', // Title for crop type
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField<String>(
                  value: selectedCrop,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0), // Changed border radius to 50px
                      borderSide: BorderSide(
                        color: selectedCrop != null ? Color(0xFFFAA625) : Colors.black, // Change border color when clicked
                        width: 1.0,
                      ),
                    ),
                    hintText: 'Select Crop',
                    contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCrop = newValue;
                      selectedFertilizer = null; // Reset selected fertilizer
                    });
                  },
                  items: cropSoilToFertilizer.keys
                      .map<DropdownMenuItem<String>>((String crop) {
                    return DropdownMenuItem<String>(
                      value: crop,
                      child: Text(crop),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Text(
                  'Soil Type', // Title for soil type
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField<String>(
                  value: selectedSoil,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0), // Changed border radius to 50px
                      borderSide: BorderSide(
                        color: selectedSoil != null ? Color(0xFFFAA625) : Colors.black, // Change border color when clicked
                        width: 1.0,
                      ),
                    ),
                    hintText: 'Select Soil',
                    contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedSoil = newValue;
                      selectedFertilizer = null; // Reset selected fertilizer
                    });
                  },
                  items: selectedCrop != null &&
                      cropSoilToFertilizer[selectedCrop!] != null
                      ? cropSoilToFertilizer[selectedCrop!]!
                      .keys
                      .map<DropdownMenuItem<String>>((String soil) {
                    return DropdownMenuItem<String>(
                      value: soil,
                      child: Text(soil),
                    );
                  }).toList()
                      : [],
                ),
                SizedBox(height: 20),
                selectedCrop != null &&
                    selectedSoil != null &&
                    cropSoilToFertilizer[selectedCrop!] != null
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Recommended fertilizer for $selectedCrop in $selectedSoil soil is: ${cropSoilToFertilizer[selectedCrop!]![selectedSoil!]}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      selectedCrop == 'Cotton' && selectedSoil == 'Black'
                          ? fertilizerInfo['UreaBlackCotton'] ?? ''
                          : fertilizerInfo[cropSoilToFertilizer[selectedCrop!]![selectedSoil!]] ?? '',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
