import React, { useState } from 'react';
import { useDispatch } from 'react-redux';
import { getAllBooks } from '../Actions/booksAction';
import AllBooks from './bookstables/allbooks';
import ConnectedBooks from './bookstables/ConnectedBooks';


const Books = () => {
  
  const dispatch = useDispatch();
  const [book_id, setBook_id] = useState('');
  const [bookName, setBookName] = useState('');
  const [author, setAuthor] = useState('');
  const [publisher, setPublisher] = useState('');
  const [category, setCategory] = useState('');
  const [status, setStatus] = useState('');
  const [selectedOption, setSelectedOption] = useState('');

  
    const searchCriteria = {
      ...(book_id && { book_id }),
      ...(bookName && { bookName }),
      ...(author && { author }),
      ...(publisher && { publisher }),
      ...(category && { category }),
      ...(status && { status }),
    };
    dispatch(getAllBooks(searchCriteria));

  const renderInputsAndButton = () => {
    if (selectedOption === 'all' ) {
  return (<>
      <div className="flex flex-wrap">
        <div className="input_b"  style={{ display: selectedOption ? 'block' : 'none' }}>
          <input
            type="text"
            placeholder="Book ID"
            name="bookId"
            className="input_i"
            value={book_id}
            onChange={(e) => setBook_id(e.target.value)}
          />
        </div>

        <div className="input_b">
          <input
            type="text"
            placeholder="Book Name"
            name="bookName"
            className="input_i"
            value={bookName}
            onChange={(e) => setBookName(e.target.value)}
          />
        </div>

        <div className="input_b">
          <input
            type="text"
            placeholder="Author"
            name="author"
            className="input_i"
            value={author}
            onChange={(e) => setAuthor(e.target.value)}
          />
        </div>

        <div className="input_b">
          <input
            type="text"
            placeholder="Publisher"
            name="publisher"
            className="input_i"
            value={publisher}
            onChange={(e) => setPublisher(e.target.value)}
          />
        </div>

        <div className="input_b">
          <input
            type="text"
            placeholder="Category"
            name="category"
            className="input_i"
            value={category}
            onChange={(e) => setCategory(e.target.value)}
          />
        </div>

        <div className="input_b">
          <input
            type="text"
            placeholder="Status"
            name="status"
            className="input_i"
            value={status}
            onChange={(e) => setStatus(e.target.value)}
          />
        </div>
        </div>
        </>
        
      );
    }
    return null;
  };



  return (
    <>
      <div className="flex flex-wrap">
        <div className="input_b">
          <select
            value={selectedOption}
            onChange={(e) => setSelectedOption(e.target.value)}
            className="input_i"
          >
             <option value="book">Books</option>
            <option value="author">Author</option>
            <option value="publisher">Publisher</option>
            <option value="category">Category</option>
           
            <option value="all">All</option>
          </select>
        </div>

        {renderInputsAndButton()}
   
        {selectedOption === 'all' ? <AllBooks /> : 
         <ConnectedBooks selectedOption={selectedOption} />   
        }
        




      </div>
    </>
  );
};

export default Books;