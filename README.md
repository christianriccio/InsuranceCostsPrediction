# InsuranceCostsPrediction - iOS App 
This is an example app built on top of #SwiftUI and #CoreML. 
The app allows the user to estimated amount of $ to pay for the insurance costs based on some feature, such as: 
- sex (either male or female)
- age 
- child: number of child 
- smoke: yes or no
- bmi (body mass index): to calculate it you only need to provide weight (in Kg) and height (in cm). The the body mass index is calculated.


At the core of the predictions runs a simple model built with CreateML which has been trained on the data repository available at the following link: 
https://www.kaggle.com/datasets/mirichoi0218/insurance.
By the end, the model reached very good performances (root mean square error of about 0.0097), this is pretty good considering that the model weights approximately 3 MB.
The main idea of this simple app is to show how bring a **ML model** into an app with CoreML and make predictions on the device. 
Also, **SwithUI** for the UI is used to try some cool stuff :) !


<img src="https://github.com/christianriccio/InsuranceCostsPrediction/blob/main/IMG_0076.PNG" width="200" height="350"> <img src="https://github.com/christianriccio/InsuranceCostsPrediction/blob/main/IMG_0077.PNG" width="200" height="350">  <img src="https://github.com/christianriccio/InsuranceCostsPrediction/blob/main/IMG_0078.PNG" width="200" height="350"> 


<p align="center">

<a href="#" alt="Swift Version">
        <img src="https://img.shields.io/static/v1?label=Technology&message=ML&color=brightgreen&logo=swift" alt="Swift Version 5.5"></a>

<a href="#" alt="Swift Version">
        <img src="https://img.shields.io/static/v1?label=BDesigned for %20Version&message=IPhone&color=brightgreen&logo=swift" alt="Swift Version 5.5"></a>
        
<a href="#" alt="Swift Version">
        <img src="https://img.shields.io/static/v1?label=Built for %20Version&message=iOS15&color=brightgreen&logo=swift" alt="Swift Version 5.5"></a>

<a href="#" alt="Swift Version">
        <img src="https://img.shields.io/static/v1?label=Swift%20Version&message=5.5&color=brightgreen&logo=swift" alt="Swift Version 5.5"></a>
        
<a href="#" alt="Swift Version">
        <img src="https://img.shields.io/static/v1?label=Xcode%20Version&message=13.0+&color=brightgreen&logo=swift" alt="Swift Version 5.5"></a>
        
<a href="#" alt="Swift Version">
        <img src="https://img.shields.io/static/v1?label=Framework%20Version&message=CreateML&color=brightgreen&logo=swift" alt="Swift Version 5.5"></a>

<a href="#" alt="Swift Version">
        <img src="https://img.shields.io/static/v1?label=Framework%20Version&message=CoreML&color=brightgreen&logo=swift" alt="Swift Version 5.5"></a>
        
<a href="#" alt="Swift Version">
        <img src="https://img.shields.io/static/v1?label=Framework%20Version&message=SwiftUI&color=brightgreen&logo=swift" alt="Swift Version 5.5"></a>
        
     
</p> 

# Technology

- Machine Learning
- Create ML, Core ML
- SwiftUI
- iOS App Development 

# Notes
This app, especcially in the UI, can be widley improved because of the main purpose was to integrate a ML into a working app. 
For the future, for sure, some adjustement of the UI can be conducted and also an app Icon can be designed. 
I think that the idea of trying to predict cost insurance is something of interesting, someone might fint it usefull (who knows !). 
The model's prediciton power can be enriched by working with a different and bigger dataset.
# Usage
Feel free to use the app and take insipiration from this project (but please cite me somehow :) ). For any suggestion or curiosity or technical stuff feel free to reach me by: 

- e-mail: christian.riccio@unina.it
- LinkedIn: https://www.linkedin.com/in/christian-riccio-830864169/

To use the app download the whole project, open it with Xcode (v.13.0 +) and made the build on the iphone :D.

You will have a very lightweight and powerful ML model into your pocket ready to calculate the insurance costs you have to face due to some factors.
