# 📉 Turning Losses into Loyalty: Customer Churn Analysis

![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white) ![Data Analysis](https://img.shields.io/badge/Data%20Analysis-Project-orange?style=for-the-badge) ![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)

> **"It is 5-25x more expensive to acquire a new customer than to retain an existing one."**

## 📖 Project Overview
[cite_start]This project analyzes a dataset of **customers** from a subscription-based service (e.g., Gym/Fitness, SaaS) to identify why customers are leaving (Churn)[cite: 22]. Using **MySQL**, I performed diagnostic and descriptive analysis to calculate churn rates, identify at-risk demographics, and formulate data-driven strategies to improve customer retention.

---

## 🎯 Objectives
* **Quantify Churn:** Calculate the overall churn rate and breakdown by subscription type.
* [cite_start]**Identify Patterns:** Find correlations between `FeedbackScore`, `TotalSessions`, and `Age`[cite: 10, 18].
* [cite_start]**Detect Risks:** Query specific customers who are "at-risk" (low engagement) or "dormant" (no login for 60+ days)[cite: 10, 12].
* [cite_start]**Strategize:** Propose actionable business solutions based on SQL findings[cite: 51].

---

## 🗄️ Database Schema
[cite_start]The analysis is based on the `customersub` table within the `rnw` database[cite: 3].

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `CustomerID` | VARCHAR | Unique ID for the customer |
| `Name` | VARCHAR | Name of the customer |
| `Age` | INT | Customer Age |
| `Gender` | VARCHAR | Gender of the customer |
| `SubscriptionType` | VARCHAR | Monthly, Quarterly, or Yearly |
| `TotalSessions` | INT | Measure of engagement |
| `FeedbackScore` | INT | Rating (1-10) given by customer |
| `IsChurned` | INT | 1 = Churned, 0 = Active |

---

## 🔧 Analytical Methodology
Instead of simple data extraction, I utilized complex SQL logic to derive the following insights:

* [cite_start]**Red Flag Detection:** I implemented filtering logic to isolate a specific segment of "High Risk" customers—defined as those with fewer than 5 total sessions and feedback scores below 5. This allows the marketing team to intervene before these users churn[cite: 10].
* [cite_start]**Churn Rate Calculation:** By grouping data by `SubscriptionType` and using aggregate functions, I calculated the exact percentage of churn for Monthly, Quarterly, and Yearly plans to determine which model is most volatile[cite: 14].
* **Dormancy Analysis:** I used date arithmetic functions to compare `LastLoginDate` against the current date, effectively identifying users who have been inactive for over 60 days. [cite_start]This list is used for re-engagement campaigns[cite: 12].
* [cite_start]**Demographic Segmentation:** I utilized `CASE` statements to categorize users into age buckets (18-25, 26-35, etc.) to analyze which generations are most likely to cancel their subscriptions[cite: 18].

---

## 📊 Key Findings & Insights
Based on the descriptive and diagnostic analysis:

* [cite_start]**Overall Churn Rate:** **29.88%** of the customer base has churned[cite: 35].
* [cite_start]**The "Monthly" Risk:** Customers on **Monthly** plans churn significantly more often than those on Yearly plans[cite: 46].
* **The Feedback Loop:** There is a strong correlation between a low `FeedbackScore` and churn status. [cite_start]Average feedback for the database is **5.4**[cite: 37, 44].
* [cite_start]**Age Demographics:** Younger age groups are more volatile and likely to churn compared to older demographics[cite: 50].

---

## 💡 Strategic Recommendations
To turn these losses into loyalty, the following strategies are proposed based on the data:

1.  [cite_start]**Retention Discounts:** Offer targeted discounts specifically to **Monthly** subscribers to incentivize them to stay or upgrade[cite: 60].
2.  [cite_start]**Engagement Targets:** Gamify the experience by setting "Attendance Targets" (e.g., hit 10 sessions in a month) to unlock rewards, tackling the low `TotalSessions` issue[cite: 62].
3.  [cite_start]**Referral Program:** Implement a "Buddy Pass" system where high-session users get discounts for bringing friends, leveraging their loyalty[cite: 57, 63].

---

## 👨‍💻 Author
**[Your Name]**
* College Student & Aspiring Data Analyst
* Passionate about Python, SQL, and Software Engineering.

---

*This project was developed for a college minor/major project to demonstrate data analysis and business logic application.*
