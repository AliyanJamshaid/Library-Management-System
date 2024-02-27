import Books from "../books";
 import Insertion from "../insertion";

const Table = ({ isSidebarOpen, selectedSidebarItem }) => {
const marginLeftClass = isSidebarOpen ? 'ml-80' : 'ml-10';



  return (<>
    <div className={`mr-8 mt-4 w-200 box ${marginLeftClass}`}>

    
    {selectedSidebarItem === 'Books' && <Books />}
    {selectedSidebarItem === 'Insertion' && <Insertion />} 
    

    </div>
    </>
  );
};

export default Table;