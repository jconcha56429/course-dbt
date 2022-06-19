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


# Question 6 - ?
 



