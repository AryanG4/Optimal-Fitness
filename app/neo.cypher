Database Description
Given a Graph Database with four kinds of nodes -- Person, Restaurant, Cuisine and City:

Nodes:
Person Node: each Person has their unique id (person_id), name (person_name) and birth year (birth_year).
Restaurant Node: each Restaurant has a unique id (restaurant_id), name (restaurant_name), year established (established_year) and ratings(ratings).
Cuisine Node: each Cuisine has a unique id (cuisine_id) and name (cuisine_name).
City Node: each City has a unique id (city_id) and name (city_name).

Relationships:
The Person and Restaurant nodes have (:Person)-[:LIKED]->(:Restaurant) type of relationship. A Person may like many restaurants.
A Person may also have a friend relationship with another Person: (:Person)-[:FRIENDS_WITH]->(:Person). A person may have many friends.
The Restaurant and Cuisine nodes have (:Restaurant)-[:SERVES]->(:Cuisine) type of relationship. A Restaurant may serve more than one cuisine.
The Restaurant and City nodes have (:Restaurant)-[:LOCATED_IN]->(:City) type of relationship. A Restaurant may be located in more than one city.
The Person and City nodes have (:Person)-[:LIVES_IN]->(:City) type of relationship. A person may live in more that one city.
Question Description
Write a single query that returns for each city, the city name, the distinct list of names of people who were born after 2000 and lived in that city, and the distinct list of restaurant names of resturants with rating above 3 that are located in that city. Return this information only for Seattle, Chicago, or Champaign cities. Order the result by city_name in ascending order.

Sample Output
city_name | person_names | restaurant_names
Chicago | ["John", "Mary"] | ["Restaurant 1", "Restaurant 2"]
Seattle | ["John", "Mary"] | ["Restaurant 1", "Restaurant 2"]
Champaign | ["John", "Mary"] | ["Restaurant 1", "Restaurant 2"]

Solution
MATCH (c:City)-[:LIVES_IN]->(p:Person)-[:LIKED]->(r:Restaurant)
WHERE c.city_name IN ["Seattle", "Chicago", "Champaign"] AND p.birth_year > 2000 AND r.ratings > 3
RETURN c.city_name AS city_name, COLLECT(DISTINCT p.person_name) AS person_names, COLLECT(DISTINCT r.restaurant_name) AS restaurant_names