#!/usr/bin/env bash
curl -d '{
   "CHAS":{
      "0":0
   },
   "RM":{
      "0":6.575
   },
   "TAX":{
      "0":296.0
   },
   "PTRATIO":{
      "0":15.3
   },
   "B":{
      "0":396.9
   },
   "LSTAT":{
      "0":4.98
   }
}' -H "Content-Type: application/json" -X POST http://ec2-18-237-206-23.us-west-2.compute.amazonaws.com:5000/predict
