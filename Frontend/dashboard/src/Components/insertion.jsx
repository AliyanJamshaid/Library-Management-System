import { useState } from "react";
const Insertion = () => {
   const [selectedOption, setSelectedOption] = useState("");
  return <>
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
        </div>
        </>
  
};
export default Insertion;
