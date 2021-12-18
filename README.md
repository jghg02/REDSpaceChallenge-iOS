## Description 
This repo contains the proposed solution for the ios challenge. 

The app contains three main views showing a list of characters, episodes and locations associated with Rick and Morty. 

|  Characters 	|   Episodies	|  Locations 	| 
|---|---|---|	
|![X](https://user-images.githubusercontent.com/1470487/145329313-03ae2574-730a-490f-876f-c05b1504103a.png)|![x](https://user-images.githubusercontent.com/1470487/145329405-50d7579b-c52c-4047-95a8-1e3d30471129.png)|![t](https://user-images.githubusercontent.com/1470487/145329462-bdbda765-ea14-4f56-b537-7ec55d0ce784.png)|	

![Simulator Screen Recording - iPhone 8 - 2021-12-09 at 00 32 11](https://user-images.githubusercontent.com/1470487/145329644-8507b1da-add0-4778-b3b1-f1fdb1f2dff1.gif)



## Design patterns. 

For the solution we used MVVM together with the coordinator pattern. With this we manage everything related to navigation within the app in a simple way. 
At the moment of starting the app a Tab Bar is shown that contains all the screens that were implemented. 


For each screen interaction `MVVM` was used. 

Everything related to the networking part was implemented with a Swift Package Manager developed by me called `JNetworking` which is published on GitHub and is still under development. 

I leave the link [here](https://github.com/jghg02/JNetworking)

## Specifications
- Xcode 13.1
- Swift 5.0 
- iOS 15.0

