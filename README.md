# Football Player Project
## Project Background
The project's initial objective was to provide Inter Milan with an overview of current player, club, and national team statistics, focusing on metrics such as the average player age per club/nationality and total player value per club/nationality. Following this analysis, the scouting team requested a dashboard to visually represent the data, emphasising transfer details, league insights (primarily Italy), and player skill metrics.

This highlights Inter Milan's challenge of failing to modernise their scouting system with data visualisation, a factor contributing to their decline in performance standards since their last trophy win in the 2010/2011 season. This report centers on the analysis conducted for the scouting team and provides targeted recommendations for player acquisitions in the upcoming transfer window, specifically addressing their interest in defensive midfielders, central midfielders, and strikers.

Midfielder Specifications:
•	Skill Selection: Interception (equal to or greater than 75).
•	Age Range: 18-30.
•	Positions: CDM, CM, LCM, LDM, RCM, and RDM.
•	Release Clause: Equal to or less than €40,000,000.
•	Weekly Wage: Equal to or less than €100,000.
•	Exclusions: Inter Milan players and players on loan.

Striker Specifications:
•	Skill Selection: Potential (equal or greater than 80).
•	Age Range: 16-20.
•	Positions: LF, LS, RS, RF, and ST.
•	Release Clause: Equal to or less than €25,000,000.
•	Weekly Wage: Equal to or less than €25,000.
•	Exclusions: Inter Milan players and players on loan.

## Analytical Approach
__SQL Analytical Approach__
After importing the provided players_gamedetails and players_personal datasets, I ensured no duplicates or invalid data ranges existed and highlighted NULL values. For players with missing game details, no position or no height, I made the decision to remove them. Furthermore, I replaced NULL values in loaned_from and club with placeholders. NULL values in joined, contract_valid_until, release_clause, and wage were handled later once the datasets were merged.

I merged the two datasets together using a JOIN on player ID after ensuring that both datasets only included the same player ID’s. The currency string in value, release_clause, and wage were then converted to integers, factoring differences in values that were in thousands (e.g. €150K) and in millions (e.g. €15M). 

To address NULL values in joined, contract_valid_until, release_clause, and wage, checks revealed that they were valid for players on loan or without a club, so they were retained. Rows with NULL value for players with a club were removed, ensuring a cleaner and more accurate dataset. After the initial analysis was done, the merged dataset was exported as players_combined.csv.

__Python Analytical Approach__
The combined dataset was uploaded into Python to address missing values for players without a club. Predictive modelling was used to estimate these players' potential market value, providing the scouting team with an added metric to evaluate free agents as potential transfer targets. To predict the value, the feature columns used were age, overall, potential, and position. Three models were tested: gradient boosting, a random forest model, and a random forest model without outliers. 

The random forest model without outliers outperformed the others, achieving the lowest mean absolute error and root mean squared error, along with the highest R², explaining 99.86% of the variance. Once the dataset was updated with these predictions, the file was downloaded and then loaded into Power BI. It should be noted that the models are not highly robust, so the predicted values should be interpreted with caution.

__Power BI Analytical Approach__
In Power BI, the dataset's headers were promoted, text values trimmed, and column names adjusted for better readability. Data types were updated for accuracy, such as converting financial metrics to currency. Missing values in some columns were replaced (e.g. ‘N/A’ for blanks), and targeted substitutions enhanced clarity, such as abbreviating names.

An additional club dataset was integrated, including 'Club,' 'League,' and 'Continent' columns. In the club dataset, ‘League’ refers to the country of the club rather than a specific competition. A many-to-one relationship was established between the two datasets using the ‘Club’ columns. This integration enabled insights into domestic club football and continental club football statistics.

## Dashboard 
The Power BI dashboard has two standard pages (Overview and Player Information), a drillthrough page (League Information), and a tooltip (Player Tooltip).

![Dashboard-Overview](https://github.com/user-attachments/assets/b42219ac-b4cc-4011-8f4d-280620b06b0a)

The Overview page features three cards: total value, average value, and average age, displayed in light blue, dark blue, and orange, respectively. These colours correspond to the same metrics used for the three ‘line and column charts’ to maintain consistency and provide clarify. The bars are changed between total value and average value using a slicer. A fourth graph (line chart) has two y-axes for average release clause and total release clause, with contact expiration date as the x-axis to provide information for future transfers. The page also has a page navigation button that directs you to the Player Information page.
