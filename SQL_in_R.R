# SQL in R
query <- sqldf("SELECT * 
               FROM mtcars 
               WHERE hp < 100 AND am = 0
               LIMIT 10")
query

query2 <- sqldf("SELECT * 
               FROM mtcars 
               WHERE hp < 100
               ORDER BY hp DESC")
query2

query3 <- sqldf("SELECT mpg, wt, hp, am 
               FROM mtcars 
               WHERE hp < 100
               ORDER BY hp DESC")
query3

# simple stats value
query4 <- sqldf("SELECT 
                  avg(hp), 
                  sum(hp), 
                  min(hp), 
                  max(hp), 
                  count(hp)
               FROM mtcars")
query4

query5 <- sqldf("SELECT 
                  avg(hp) AS avg_hp, 
                  sum(hp) AS sum_hp, 
                  min(hp) AS min_hp, 
                  max(hp) AS max_hp, 
                  count(hp) n
               FROM mtcars")
query5

# GROUP BY
query5 <- sqldf("SELECT 
                  avg(hp) AS avg_hp, 
                  sum(hp) AS sum_hp, 
                  min(hp) AS min_hp, 
                  max(hp) AS max_hp, 
                  count(hp) n,
                  am
               FROM mtcars
               GROUP BY am")
query5

# filter by result sets by HAVING
query6 <- sqldf("SELECT 
                  avg(hp) AS avg_hp, 
                  sum(hp) AS sum_hp, 
                  min(hp) AS min_hp, 
                  max(hp) AS max_hp, 
                  count(hp) n,
                  am
               FROM mtcars
               GROUP BY am
               HAVING sum(hp) > 2000")
query6
