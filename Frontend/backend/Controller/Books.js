const pool = require("../db");

exports.getFilteredBooks = async (req, res) => {
  let query = `
    SELECT
   *
    FROM
      books 
    WHERE 1=1`;

  const { book_id, bookName, author, publisher, category, status } = req.query;

  if (book_id) {
    query += ` AND b.book_id = ${book_id}`;
  }
  if (bookName) {
    query += ` AND b.title ILIKE '%${bookName}%'`;
  }
  if (author) {
    query += ` AND a.author_name ILIKE '%${author}%'`;
  }
  if (publisher) {
    query += ` AND p.publisher_name ILIKE '%${publisher}%'`;
  }
  if (category) {
    query += ` AND c.category_name ILIKE '%${category}%'`;
  }
  if (status) {
    query += ` AND b.status ILIKE '%${status}%'`;
  }

  try {
    const result = await pool.query(query);
    const books = result.rows;
    res.status(200).json({
      success: true,
      books,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({
      success: false,
      error: "Internal Server Error",
    });
  }
};

exports.getOtherTables = async (req, res) => {
  const { table } = req.query;
  let query = "";

  try {
    switch (table) {
      case "books":
        query = "SELECT * FROM BOOKS";
        break;
      default:
        query = "SELECT * FROM BOOKS";
    }

    const result = await pool.query(query);
    const records = result.rows;

    res.status(200).json({
      success: true,
      records,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({
      success: false,
      error: "Error fetching data",
    });
  }
};
