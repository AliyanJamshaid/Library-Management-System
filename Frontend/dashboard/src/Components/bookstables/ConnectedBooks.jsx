import React, { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { getConnectedBooks } from '../../Actions/booksAction';

const ConnectedBooks = ({selectedOption}) => {
  const dispatch = useDispatch();
  const Data = useSelector((state) => state.records);



  useEffect(() => {
    dispatch(getConnectedBooks(selectedOption));
  }, [dispatch, selectedOption]);



  const renderTable = () => {
    
    if (Data.loading) {
      return <p>Loading...</p>;
    }

    if (Data.error) {
      return <p>Error: {Data.error}</p>;
    }

    if (!Data.records || Data.records.length === 0) {
      return <p>No data available.</p>;
    }



    const tableHeaders = Object.keys(Data.records[0]);

    return (
      <div className='m-4 tables'>
        <table className="min-w-full bg-white border border-gray-300">

          <thead>
            <tr>
              {tableHeaders.map((key) => (
                <th
                  key={key}
                  className="py-2 px-4 border-b border-gray-300 text-left font-semibold bg-blue-700 text-white"
                >
                  {key.toUpperCase()}
                </th>
              ))}
            </tr>
          </thead>

          <tbody>
            {Data.records.map((book, index) => (
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

export default ConnectedBooks;
