import React, { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { getAllBooks } from '../../Actions/booksAction';

const AllBooks = () => {
  const dispatch = useDispatch();
  const booksData = useSelector((state) => state.books);

  useEffect(() => {
    dispatch(getAllBooks());
  }, [dispatch]);
 

  
  const renderTable = () => {
    if (booksData.loading) {
      return <p>Loading...</p>;
    }

    if (booksData.error) {
      return <p>Error: {booksData.error}</p>;
    }

    if (!booksData.books || booksData.books.length === 0) {
      return <div className='bg-red w-100 h-100'>Not found</div>;
    }



    
    const tableHeaders = Object.keys(booksData.books[0]);

    return (
      <div className='m-4 tables'>
        <table className="min-w-full bg-white border border-gray-300">
          <thead>
            <tr>
              {tableHeaders.map((key) => (
                <th
                  key={key}
                  className="py-2 px-4 border-b text-left font-semibold bg-blue-700 text-white"
                >
                  {key.toUpperCase()}
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {booksData.books.map((book, index) => (
              <tr key={index}>
                {tableHeaders.map((key) => (
                  <td
                    key={key}
                    className="py-2 px-4 border-b border-gray-300"
                  >
                    {book[key]}
                  </td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    );
  };

  return <div className="container mx-auto">{renderTable()}</div>;
};

export default AllBooks;
