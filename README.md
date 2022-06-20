# Analytics engineering with dbt
<!-- 
## Week 1 Project 

### Question #1 - How many users do we have?
130 unique users

![Alt text](/images/Screenshot_1.png)

### Question #2 - On average, how many orders do we receive per hour? 
7.52 orders per hour 

![Alt text](/images/Screenshot_2.png)

### Question #3 - On average, how long does an order take from being placed to being delivered?
Approximately 336,252 seconds or 5,604 minutes or about 4 days rounded up

![Alt text](/images/Screenshot_3.png)


### Question #4 - How many users have only made one purchase? Two purchases? Three+ purchases?
- One order - 25 
- Two orders - 28
- Three+ orders - 71 

![Alt text](/images/Screenshot_7.png) 
![Alt text](/images/Screenshot_8.png)

![Alt text](/images/Screenshot_9.png) 

### Question #5 On average, how many unique sessions do we have per hour?
16.32 unique sessions per hour 

![Alt text](/images/Screenshot_10.png)  -->

## Week 2 Project 

# Question 1 - What is our user repeat rate?
Approximately 79.84%.

![Alt text](/images/Week2_Q1.png) 

# Question 2 - What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again?

Categorize repeat customers and non-repeat customers.

![Alt text](/images/view_repeat_customer.png) 

Join view and tables together for promos & repeat status.

![Alt text](/images/discount_repeat_customer.png)

Count number of repeat/non-repeat customers which received a discount.

![Alt text](/images/count_repeat_customer_by_discount.png)

- There are 39 repeat customers which used a discount and only 1 non-repeat customer which used a discount, meaning that discounts increase the likelihood of respeat customers.

- Additionally, I did some analysis on whether cost of orders, shipping service, delivery time, & state. However, I wasn't able to make anything meaningful of the analysis. In general, I found very minute differences between repeat & non-repeat customers of less than 10%, so I figured it was not worth noting. I found discounts to be the most impactful when it comes to repeat customers. 

# Question 4 - If you had more data, what features would you want to look into to answer this question?
I would want more data on user demographics. Such as race/ethnicity, identifying gender, age, work industry, marital status, & user satistfaction.

# Question 5 - Explain the marts models you added. Why did you organize the models in the way you did?
 - core/dim_users -  Main identifying user information. Dimensions are mainly focused on noun information and descriptions.
 - core/fact_orders - Some identifying information for future joins such as order_id, user_id, address_id in addition to general order information. 

 - marketing/intermediate/int_user_order_info - Order information in addition to user information and promotional information. Figured that marketing would likely be interested in identifying user information in addition to how it relates to order information.  
 - marketing/fact_user_orders - Identifying user information in addition to order information pulled from int_user_order_info. Pulled from intermediate model after transformations and ready to be used for analyzing order information. 

 - product/intermediate/int_product - All event information from staging in addition to order information and some user information. Pulled so that we can analyze order information on top of page url events. 
 - product/fact_page_views - Strictly event information pulled from int_product. 

# DAG 

![Alt text](/images/DAG.png) 

# Part 2 Tests

# Question 6 - What assumptions are you making about each model? (i.e. why are you adding each test?)
Generally speaking, we're assuming that a lot of this data is not null such as user_id, event_id, order_id, etc. We're also assuming that this data should be unique to their respective staging tables. 

As far as integer items, it wouldn't hurt to apply our positive_values macro we created for superheroes. This would be useful for positive value integer columns such as discount, order_total, etc. 

As far as categorical columns, we want to make sure they retain their respective values. Such as with status & shipping_service. 

If I had more time on my hands, I would also add tests for the utc date type, as well as regex for data such as phone numbers and email addresses.

# Question 7 - Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?
I was not able to find any bad data within these models. I don't foresee this becoming a problem, unless there's a change in the UI which would prompt bad data to get through or a need to be more cautious with our data.

Testing took me a bit longer than I had originally anticipated since I added general tests to most of my columns. However, there were times when I would add tests such as unique, only to remember that this table has duplicate values. 

I also did find that I had originally missed some categorical data when making my accepted values tests, which was corrected easily thanks to --store_failures.

# Question 8 - Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.
I think the best thing to do in order to make sure that these tests pass regularly would be to set up freshness and run tests regularly everyday at the begginning and end of day to see how we can better incorporate tests and deal with data via transformation. 

If I had full control of this entire project, after a test failed, I would implement a change within the models to transform the data or work with engineering to make sure that this data is not able to be stored in the first place. To ease steakholders, we could host a post-mortem on how we intend to deal with the data in the future and how it impacted the data if so. 