def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, year
  FROM books
  INNER JOIN series
  ON books.series_id = series.id
  WHERE books.series_id = 1
  ORDER BY year"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT characters.name, MAX(characters.motto) 
  FROM characters
  WHERE characters.author_id = 1
  GROUP BY motto
  HAVING MAX(LENGTH(motto))
  LIMIT 1"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species)
  FROM characters
  GROUP BY species
  HAVING species = MAX(species)
  ORDER BY species DESC
  LIMIT 1"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
  FROM authors
  INNER JOIN series
  INNER JOIN subgenres
  ON authors.id = series.subgenre_id 
  AND series.subgenre_id = subgenres.id"
end

def select_series_title_with_most_human_characters
  "SELECT title
  FROM series
  INNER JOIN characters
  ON series.author_id = characters.author_id
  GROUP BY title
  HAVING species = MAX(species)
  ORDER BY title
  LIMIT 1"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(books.id)
  FROM characters
  INNER JOIN books
  INNER JOIN character_books
  ON books.id = character_books.book_id
  AND character_books.character_id = characters.id
  GROUP BY characters.name 
  ORDER BY COUNT(books.id) DESC, characters.name"
end
