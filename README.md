# Football Player Project
## Project Background
The project's initial objective was to provide Inter Milan with an overview of current player, club, and national team statistics, focusing on metrics such as the average player age per club/nationality and total player value per club/nationality. Following this analysis, the scouting team requested a dashboard to visually represent the data, emphasising transfer details, league insights (primarily Italy), and player skill metrics.

This highlights Inter Milan's challenge of failing to modernise their scouting system with data visualisation, a factor contributing to their decline in performance standards since their last trophy win in the 2010/2011 season. This report centers on the analysis conducted for the scouting team and provides targeted recommendations for player acquisitions in the upcoming transfer window, specifically addressing their interest in defensive midfielders, central midfielders, and strikers.

| **Criteria**           | **Midfielder Specifications**            | **Striker Specifications**             |
|------------------------|------------------------------------------|----------------------------------------|
| **Skill Selection**     | Interception ≥ 75                       | Potential ≥ 80                         |
| **Age Range**           | 18 - 30                                  | 16 - 20                                |
| **Positions**           | CDM, CM, LCM, LDM, RCM, RDM             | LF, LS, RS, RF, ST                    |
| **Release Clause**      | ≤ €40,000,000                            | ≤ €25,000,000                          |
| **Weekly Wage**         | ≤ €100,000                               | ≤ €25,000                              |
| **Exclusions**          | Inter Milan players and players on loan  | Inter Milan players and players on loan|

## Analytical Approach
#### SQL Analytical Approach
After importing the provided players_gamedetails and players_personal datasets, I ensured no duplicates or invalid data ranges existed and highlighted NULL values. For players with missing game details, no position or no height, I made the decision to remove them. Furthermore, I replaced NULL values in loaned_from and club with placeholders. NULL values in joined, contract_valid_until, release_clause, and wage were handled later once the datasets were merged.

I merged the two datasets together using a JOIN on player ID after ensuring that both datasets only included the same player ID’s. The currency string in value, release_clause, and wage were then converted to integers, factoring differences in values that were in thousands (e.g. €150K) and in millions (e.g. €15M). 

To address NULL values in joined, contract_valid_until, release_clause, and wage, checks revealed that they were valid for players on loan or without a club, so they were retained. Rows with NULL value for players with a club were removed, ensuring a cleaner and more accurate dataset. After the initial analysis was done, the merged dataset was exported as players_combined.csv.

#### Python Analytical Approach
The combined dataset was uploaded into Python to address missing values for players without a club. Predictive modelling was used to estimate these players' potential market value, providing the scouting team with an added metric to evaluate free agents as potential transfer targets. To predict the value, the feature columns used were age, overall, potential, and position. Three models were tested: gradient boosting, a random forest model, and a random forest model without outliers. 

The random forest model without outliers outperformed the others, achieving the lowest mean absolute error and root mean squared error, along with the highest R², explaining 99.86% of the variance. Once the dataset was updated with these predictions, the file was downloaded and then loaded into Power BI. It should be noted that the models are not highly robust, so the predicted values should be interpreted with caution.

#### Power BI Analytical Approach
In Power BI, the dataset's headers were promoted, text values trimmed, and column names adjusted for better readability. Data types were updated for accuracy, such as converting financial metrics to currency. Missing values in some columns were replaced (e.g. ‘N/A’ for blanks), and targeted substitutions enhanced clarity, such as abbreviating names.

An additional club dataset was integrated, including 'Club,' 'League,' and 'Continent' columns. In the club dataset, ‘League’ refers to the country of the club rather than a specific competition. A many-to-one relationship was established between the two datasets using the ‘Club’ columns. This integration enabled insights into domestic club football and continental club football statistics.

## Dashboard 
The Power BI dashboard has two standard pages (Overview and Player Information), a drillthrough page (League Information), and a tooltip (Player Tooltip).

![Dashboard-Overview](https://github.com/user-attachments/assets/921ece3d-62d8-47a2-a29f-b8d1b733d946)

The Overview page features three cards: total value, average value, and average age, displayed in light blue, dark blue, and orange, respectively. These colours correspond to the same metrics used for the three ‘line and column charts’ to maintain consistency and provide clarify. The bars are changed between total value and average value using a slicer. A fourth graph (line chart) has two y-axes for average release clause and total release clause, with contact expiration date as the x-axis to provide information for future transfers. The page also has a page navigation button that directs you to the Player Information page.

![Dashboard-Player Information](https://github.com/user-attachments/assets/c7234341-6ab6-40ee-913d-84036d2c0bbe)

The Player Information page has a button to navigate back to the Overview page. It also includes four cards with the average age card maintaining the orange colour found on the Overview page. On the Player Information page, the Midfielder Filter and Striker Filter provide insights into the specific criteria of the scouting team, and the Rest Filter reverts to the whole dataset. The page includes four graphs. The x-axis of the clustered column chart and scatter chart is changeable from the Skill Selection slicer. A bar chart shows the top players by overall and a table shows the top players by potential growth, a created column of potential minus overall.

![Dashboard-League Information](https://github.com/user-attachments/assets/9a498d10-2c08-4ce5-90b4-74377a48b80b)

The League Information drillthrough page is reached by pressing on a bar from the Top Leagues graph on the Overview page, activating a drill through button. Additionally, clicking a bar on the Continent Overview graph filters the Top Leagues graph, providing the option to drill through to more leagues. On the League Information page, the format for the total value, average value, and average age cards is consistent with those on the Overview page. The line chart and 'line and column chart' follow the format of those on the Overview page, while the column chart and bar chart align with the format of those on the Player Information page.

![Dashboard-Tooltip](https://github.com/user-attachments/assets/c8864b0f-977b-4139-bde7-1561c7653114)

The Player Tooltip provides information when hovering over one of the players on the Top Players by Overall graphs on both the Player Information and League Information pages. Finally, several dynamic titles, parameters, calculated measures, and calculated columns were created to enhance the dashboard.

## Insights and Recommendations 
![Dashboard-Transfer Overview](https://github.com/user-attachments/assets/58910120-3666-404e-b1eb-b6236c7f66b4)

On the Overview page, the Future Transfer Overview graph shows 2021 with the most contracts ending (4358) and the highest total release clause value (€21.04 billion). Meanwhile, 2026 has the highest average release clause value (€54.35 million) with only two contracts ending.

![Dashboard-Top Leagues Average](https://github.com/user-attachments/assets/dc380533-4b17-4b23-9d59-a7ab4ab55ef3) 
![Dashboard-Top Leagues Total](https://github.com/user-attachments/assets/fb0b8847-7b1e-412f-87ea-539c17bb2757)

Among top leagues, Spain leads in average player value (€5.35 million) and ranks second in total value (€6.68 billion), behind England (€7.81 billion), which has the sixth highest average value (€3.04 million). Italy follows with the second highest average value (€4.73 million) and third highest total value (€5.10 billion). It is important to note that the Top Leagues graph is filtered to display only the top ten leagues by total value, so the rankings by average value are based solely on leagues included within this filter.

![Dashboard-League Information](https://github.com/user-attachments/assets/468e788f-1643-4335-b49f-c64d22b16718)

In Italy, the league averages are 69.66 overall, 74.44 potential, and 25.51 age. Juventus dominates with the highest average value (€28.18 million) and total value (€704.48 million), significantly ahead of Napoli, despite the same squad sizes. Furthermore, the top three players by overall, C. Ronaldo, G. Chiellini, and P. Dybala, all play for Juventus. Inter Milan ranks third for average value (€19.44 million) and total value (€466.49 million), with an average overall of 79.75 and potential of 81.75.

![Dashboard-Midfielders](https://github.com/user-attachments/assets/53cd4d2e-6c1a-4c2c-bb0c-d65f9bf15a2b)

Focusing on the specifications provided by the scouting team, there are 199 potential players that fit the midfielder criteria. Javi Martinez is the top player not only by interception (87) but also by overall (83). It is important to note that Martinez has a high wage (€94,000) and plays for Bayern München, one of the world’s top clubs, which could make it challenging to attract a transfer to Inter Milan. It is necessary to evaluate whether he receives sufficient game time at Bayern München. With a significantly lower wage (€18,000), L. Fejsa could be a potential signing. Attracting him from SL Benfica to Inter Milan would be easier, and he has an overall of 82.

Contrastingly, the scouting team could target a younger player with substantial potential growth, such as N. Barella. At just 21 years old, Barella already has an overall of 77 and a potential of 89. As an Italian player already familiar with the country's football culture, Barella’s move from Cagliari to Inter Milan would represent a significant step up in his career progression. Several other young players could also be considered. T. Adams, for instance, has less potential than Barella but would cost €21.40 million less. However, since he currently plays in the United States league, he has yet to prove himself in a top ten league. Therefore, D. Rice could be a stronger second option, as he has a slightly higher overall rating and the same potential as Adams while already playing in a top league (England).

![Dashboard-Strikers](https://github.com/user-attachments/assets/17c7364a-4179-487b-be3e-8f16f9624f7c)

Several promising strikers aged 16–18, who have the potential to reach an overall of 80 or higher, with release clauses below €5 million have been identified. However, five of these players have yet to achieve an overall of at least 60, posing a risk that they may not develop to meet first-team standards despite their high potential. Among those already at or above an overall of 60, I recommend P. Pellegri or W. Geubbels. Both are AS Monaco players, competing in a top five league (France). However, Pellegri, stands out with a slightly higher overall and potential. Furthermore, his Italian nationality could facilitate a smoother transition to Inter Milan, given his familiarity with the language and cultural aspects.

Alternatively, young players who meet the specifications and have already proven themselves at a good standard include C. Kouame, M. Maolida, Rafael Leao, F. Chalov, I. Sacko, and K. Dolberg. These players, aged 19-20, already have an overall above 70, which is close to Inter Milan’s average overall (79.75). Furthermore, only Chalov and Dolberg do not play in a top five league. However, Dolberg plays for Ajax, who are known to develop quality players, and he has the highest overall (76) and joined second highest potential (85) out of the players mentioned. It should be noted that he does have the highest release clause (€19.20 million), whereas Sacko has release clause below €10 million and like already mentioned, plays in a top five league (France). Kouame plays in the Italian league, potentially making a transition to Inter Milan easier, and has a release clause of €11.60 million. 

This report has presented some suggestions for potential signings in the next transfer window that meet the specifications provided by the scouting team. However, some key data points are missing from the dataset, which should be taken into consideration. For example, the dataset does not provide insight into how many goals and assists players had last season or so far this season. While this may be less critical for defensive and central midfielders, it is crucial for identifying ideal strikers. Furthermore, incorporating individual game ratings from recent matches, such as the last five or ten games, would provide valuable insights into a player’s current form, which the overall rating alone cannot fully capture. This is particularly important for assessing whether players receive regular game time or not.
