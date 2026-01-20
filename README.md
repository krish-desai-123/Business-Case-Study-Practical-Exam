# 📉 Turning Losses into Loyalty: Customer Churn Analysis

![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white) ![Data Analysis](https://img.shields.io/badge/Data%20Analysis-Project-orange?style=for-the-badge) ![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)

> **"It is 5-25x more expensive to acquire a new customer than to retain an existing one."**

## 📖 Project Overview
This project analyzes a dataset of **customers** from a subscription-based service (e.g., Gym/Fitness, SaaS) to identify why customers are leaving (Churn). Using **MySQL**, I performed diagnostic and descriptive analysis to calculate churn rates, identify at-risk demographics, and formulate data-driven strategies to improve customer retention.

---

## 🎯 Objectives
* **Quantify Churn:** Calculate the overall churn rate and breakdown by subscription type.
* **Identify Patterns:** Find correlations between `FeedbackScore`, `TotalSessions`, and `Age`.
* **Detect Risks:** Query specific customers who are "at-risk" (low engagement) or "dormant" (no login for 60+ days).
* **Strategize:** Propose actionable business solutions based on SQL findings.

---

## 🗄️ Database Schema
The analysis is based on the `customersub` table within the `rnw` database.

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

* **Red Flag Detection:** I implemented filtering logic to isolate a specific segment of "High Risk" customers—defined as those with fewer than 5 total sessions and feedback scores below 5. This allows the marketing team to intervene before these users churn.
* **Churn Rate Calculation:** By grouping data by `SubscriptionType` and using aggregate functions, I calculated the exact percentage of churn for Monthly, Quarterly, and Yearly plans to determine which model is most volatile.
* **Dormancy Analysis:** I used date arithmetic functions to compare `LastLoginDate` against the current date, effectively identifying users who have been inactive for over 60 days. This list is used for re-engagement campaigns.
* **Demographic Segmentation:** I utilized `CASE` statements to categorize users into age buckets (18-25, 26-35, etc.) to analyze which generations are most likely to cancel their subscriptions.

---

## 📊 Key Findings & Insights
Based on the descriptive and diagnostic analysis:

* **Overall Churn Rate:** **29.88%** of the customer base has churned.
* **The "Monthly" Risk:** Customers on **Monthly** plans churn significantly more often than those on Yearly plans.
* **The Feedback Loop:** There is a strong correlation between a low `FeedbackScore` and churn status. Average feedback for the database is **5.4**.
* **Age Demographics:** Younger age groups are more volatile and likely to churn compared to older demographics.

---

## 💡 Strategic Recommendations
To turn these losses into loyalty, the following strategies are proposed based on the data:

1.  **Retention Discounts:** Offer targeted discounts specifically to **Monthly** subscribers to incentivize them to stay or upgrade.
2.  **Engagement Targets:** Gamify the experience by setting "Attendance Targets" (e.g., hit 10 sessions in a month) to unlock rewards, tackling the low `TotalSessions` issue.
3.  **Referral Program:** Implement a "Buddy Pass" system where high-session users get discounts for bringing friends, leveraging their loyalty.

---

## 👨‍💻 Author
**Krish Desai**
* College Student & Aspiring Data Analyst
* Passionate about Python, SQL, and Software Engineering.

---


