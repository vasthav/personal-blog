---
title: "Udacity Data Science Nano Degree - Starbuck's Capstone Challenge"
date: 2020-07-27T09:57:25+05:30
tags: [Data Analysis, Udacity Data Science Nano Degree]
categories: [Article]
imgs: []
readingTime: true  # show reading time after article date
toc: true
comments: true
justify: true  # text-align: justify;
single: false  # display as a single page, hide navigation on bottom, like as about page.
license: ""  # CC License
draft: false
---

# Introduction

As part of the [Udacity - Data Science Nano Degree program](https://www.udacity.com/course/data-scientist-nanodegree--nd025) I recently completed a task where I had to use a given data set, analyse it and come up with heuristics based recommendations. This blog post will present the final conclusions and recommendations I came up with after the analysis.  

![Starbucks coffee - Photo by quan le on unsplash](/images/starbucks-quan-le-A_NBmfVh6ao-unsplash.jpg)
<span>Photo by <a href="https://unsplash.com/@quanle2819?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText">quan le</a> on <a href="https://unsplash.com/s/photos/starbucks?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText">Unsplash</a></span>

### A Note on the Dataset
The Starbucks Udacity Data Scientist Nano-degree Capstone challenge to simulate how different promotional offers impact user interaction and decisions. There are three types of offers as per the data set: buy-one-get-one (BOGO), discount, and informational - all of which are delivered over multiple channels. The main task is to identify different segments of users based on their identifiable feature (like age, income, transaction patterns etc) to offer better targeted promotional offers. Also finding other patterns and trends like the impact of each offers on the different segments of users etc.

The basic task is to use the data to identify which groups of people are most responsive to each type of offer, and how best to present each type of offer.
 
The data spread across three different files. See related more info below:

#### Data Dictionary

```text
- profile.json - Rewards program users (17000 users x 5 fields)
    - gender: (categorical) M, F, O, or null
    - age: (numeric) missing value encoded as 118
    - id: (string/hash)
    - became_member_on: (date) format YYYYMMDD
    - income: (numeric)

- portfolio.json - Offers sent during 30-day test period (10 offers x 6 fields)
    - reward: (numeric) money awarded for the amount spent
    - channels: (list) web, email, mobile, social
    - difficulty: (numeric) money required to be spent to receive reward
    - duration: (numeric) time for offer to be open, in days
    - offer_type: (string) bogo, discount, informational
    - id: (string/hash)

- transcript.json - Event log (306648 events x 4 fields)
    - person: (string/hash)
    - event: (string) offer received, offer viewed, transaction, offer completed
    - value: (dictionary) different values depending on event type
    - offer id: (string/hash) not associated with any "transaction"
    - amount: (numeric) money spent in "transaction"
    - reward: (numeric) money gained from "offer completed"
    - time: (numeric) hours after start of test
```
# Motivation 
The problem that I chose to solve was to build a set of heuristics to help decide what offers works best for certain age and gender demographics. I chose a simple approach where the users who converted (completed offer) were analysed based on gender, age, and income bracket. 

At the end we create two user list, one of top user's user id list and the second user id list of potential customers based on transaction behavior, which can be used in re-marketing different products. And given the marketing cost these lists are helpful to target other products to true fans (First list) and use more offers to capture more revenue from the potential users (second list).

# Analysis
The analysis process involved following the CRISP-DM methodology. After the cleaning of the data set exploratory data analysis was done on three data set files. Transcript file was a combination of Transaction event, offer received, offer viewed, offer completed data. I needed to separate this into 4 different data frames before proceeding for the sake of simplicity. 

The transaction event data separated from transcript file gave us age, gender, and income wise transaction events and revenue data. This was helpful to come up with the user lists to find the true fans and potential users for re-marketing. 

Joining offer received, viewed and completed data helped us figure the impact of each offer. And recommend the top three offers. We also found 2 offers which were not resulting in any conversion. 

See the different observations after the analysis mention in the next section. 

# Observations

Based on the analysis we observed that
```text 
- Average user transactions count is 8.38
- Average user age 62 years
- Average user income 57000 unit.
```

Top three two age brackets and gender groups that result in highest number of transactions and in turn revenue are:
```text 
1. 60+ Male, 60+ Female
2. 50-59 Male, 50-59 Female
3. 40-49 Male, 40-49 Female
```

There is not much difference in income gap between the users who transact based on their age, and gender groups.

Highest offer completion rate is for the offer: 
```text 
fafdcd668e3743c1bb461111dcafc2a4 (~82% conversion rate).
```

We should send this offer more.
Top Three offers -
```text 
1. fafdcd668e3743c1bb461111dcafc2a4
2. 2298d6c36e964ae4a3e7e9706d1fb8c2
3. f19421c1d4aa40978ebb69ca19b0e20d 
```
We should send these more in general.

The below mentioned offers didn't result in any conversion. We should stop sending these particular offer.
```text 
- 5a8bc65990b245e5a138643cd4eb9837
- 3f207df678b143eea3cee63160fa8bed
```

We were able to find the demographics which has the highest impact on the offer individually too. See the observations in the iPython Notebook available in the [github repository](https://github.com/vasthav/Udacity-DSND-Capstone_project-Starbucks).

# Conclusion
After analysing the Starbucks Udacity Data Scientist Nano-degree Capstone challenge data set, which is a simulation of customer behavior on the Starbucks rewards mobile application, I was able to find the top three offers which resulted in highest conversions. I also found couple of offers which didn't result in any conversions. Based on the heuristics recommendations were made to send more of the top performing offers and stop sending the offers which didn't perform well. Offerwise recommendations were also made (see iPython notebook for more info).

I have also created top converting user list (total Ids 3941). 
```text
- These users are like 1000 true fans. 
- They enjoy the product & we need not send offers to them.
```

I have also created least converting user list (total Ids 4037). 
```text
- These users have converted but has potential to convert more. 
- These user ids can be used for re-marketing by offering better offers so that they convert more.
```

_Next steps include building a simple machine learning model to predict the users who has high chance of conversion (completing the offers) based on offer viewed and completed data._

###### **Complete Data analysis is available in the [github repository](https://github.com/vasthav/Udacity-DSND-Capstone_project-Starbucks).**

