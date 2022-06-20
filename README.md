# Analytics engineering with dbt

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

![Alt text](/images/Screenshot_10.png) 

## Week 2 Project 

# Question 1 - What is our user repeat rate?
Approximately 79.84%

![Alt text](/images/Week2_Q1.png) 

# Question 2 - What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again?

Categorize repeat customers and non-repeat customers

![Alt text](/images/view_repeat_customer.png) 

Join view and tables together for promos & repeat status

![Alt text](/images/discount_repeat_customer.png)

Count number of repeat/non-repeat customers which received a discount

![Alt text](/images/count_repeat_customer_by_discount.png)

- There are 39 repeat customers which user a discount and only one non-repeat customer which used a discount, meaning that discounts increase the likelihood of respeat customers

- Generally speaking, having a slightly faster delivery date encourages repeat customers


# Question 4 - If you had more data, what features would you want to look into to answer this question?
I would want more data on user demographics. Such as race/ethnicity, identifying gender, age, & work industry. 


# Direction 5 - Within each marts folder, create intermediate models and dimension/fact models?
- 5A - For example, some “core” datasets could include fact_orders, dim_products, and dim_users
    - fact_orders
        - order_id
        - user_id
        - address_id
        - created_at
        - delivered_at
        - time_difference
        - order_cost
        - tracking_id
        - status
        - promo_id
        - discount
        - sum(quantity)

    - dim_users
        - user_id
        - "first_name last_name"
        - email
        - phone_number
        - current_full_address_id
        - address_id
        - created_at
        - updated_at
        - order_count

- 5B - The marketing mart could contain a model like user_order_facts which contains order information at the user level

    - fact_user_order
        - order_id
        - user_id
        - address_id
        - promo_id
        - order_created_at
        - order_cost
        - tracking_id
        - estimated_delivery_date
        - delivery_date
        - status
        - order_total_quantity
        - discount

    - int_order_sessions
        - session_id
        - user_id
        - event_type - add_to_cart
        - order_id
        - order_quantity
        - promo_id
        - discount
        - order_cost
        - order_created_at
        - order_delivered_at
        - order_estimated_delivery

- 5C - The product mart could contain a model like fact_page_views which contains all page view events from greenery’s events data

    - fact_page_views
        - event_id
        - session_id
        - user_id
        - created_at
        - event_type
        - order_id
        - product_id
        - promo_id
        - order_cost
        - delivered_at


# Question 6 - Explain the marts models you added. Why did you organize the models in the way you did?
 - core/dim_users -  Main identifying user information. Dimensions are mainly focused on noun information and descriptions.
 - core/fact_orders - Some identifying information for future joins such as order_id, user_id, address_id in addition to general order information. 

 - marketing/intermediate/int_user_order_info - Order information in addition to user information and promotional information. Figured that marketing would likely be interested in identifying user information in addition to how it relates to order information.  
 - marketing/fact_user_orders - Identifying user information in addition to order information pulled from int_user_order_info. Pulled from intermediate model after transformations and ready too be used for analyzing order information. 

 - product/intermediate/int_product - All event information from staging in addition to order information and some user information. Pulled so that we have analyze order information on top of page url events. 
 - product/fact_page_views - Strictly event information pulled from int_product. 

# DAG 

![Alt text](/images/DAG.png) 

# Part 2 Tests

# Question 7 - What assumptions are you making about each model? (i.e. why are you adding each test?)
Generally speaking, we're assuming that a lot of this data is not null such as user_id, event_id, order_id, etc. Additionally, we're also assuming that this data should be unique to their respective staging tables. 

As far as integer items, it wouldn't hurt to apply our positive_values macro we created for superheroes. This would be useful for positive value integer columns such as discount, order_total, etc. 

As far as categorical columns, we want to make sure they retain their respective values. Such as with status & shipping_service. 

If I had more time on my hands, I would also add tests for the utc date type, as well as regex for data such as phone numbers and email addresses.


# Question 8 - Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?
Generally speaking, I was not able to find any bad data within these models. I don't foresee this becoming a problem, unless there's a change in the UI which would prompt bad data to get through or a need to be more cautious with our data.

Testing took me a bit longer than I had originally anticipated since I added general tests to most of my columns. However, there were times when I would add tests such as unique, only to remember that this table will have duplicate values. 

I also did find that I had originally missed some categorical data when making my accepted values tests, which was corrected easily thanks to --store_failures.

# Question 9 - Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.
I think the best thing to do in order to make sure that these tests pass regularly would be to set up freshness and run tests regularly everyday at the begginning and end of day to see how we can better incorporate tests and deal with data via transformation. 

If I had full control of this entire project, after a test failed, I would implement a change within the models to transform the data or work with engineering to make sure that this data is not able to be stored in the first place. To ease steakholders, we could host a post-mortem on how we intend to deal with the data in the future and how it impacted the data if so. 