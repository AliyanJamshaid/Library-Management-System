import { useState } from "react";

const Sidebar = ({ isSidebarOpen, onSelectItem }) => {
  const sidebarClasses = `fixed top-20 left-5 z-40 w-64 h-screen sidebar ${
    isSidebarOpen ? 'sidebar-open' : 'sidebar-closed'
  }`;

  const [selectedItem, setSelectedItem] = useState('Dashboard');

  const handleItemClick = (itemText) => {
   setSelectedItem(itemText);
    onSelectItem(itemText);
 }; 

  return (
    <>
      <aside
        id="sidebar-multi-level-sidebar"
        className={sidebarClasses}
        aria-label="Sidebar"
      >
        <div className="menu_bar h-full px-3 py-4 overflow-y-auto  rounded-3xl">
          <div className="grey_bg border-2 border-gray-900 border-solid mb-20 rounded-lg ">
            <h1 className="text-2xl font-bold relative text-center transition ease-in-out p-1 bg-gray-50 rounded-lg">
              {selectedItem}
            </h1>
          </div>
          <ul className="space-y-2 font-medium">
            <li>
              <a
                href="#"
                className="flex items-center p-2 rounded-lg hover:bg-gray-100"
                onClick={() => handleItemClick("Dashboard")}
              >
                <svg
                  className="w-5 h-5 text-gray-800 dark:text-white"
                  aria-hidden="true"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="currentColor"
                  viewBox="0 0 20 14"
                >
                  <path d="M18 0H2a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2ZM9 6v2H2V6h7Zm2 0h7v2h-7V6Zm-9 4h7v2H2v-2Zm9 2v-2h7v2h-7Z" />
                </svg>
                <span className="ml-3">Dashboard</span>
              </a>
            </li>
            <li>
              <button
                type="button"
                className="flex items-center w-full p-2 text-bas transition duration-75 rounded-lg group hover:bg-gray-100"
                aria-controls="dropdown-example"
                data-collapse-toggle="dropdown-example"
                onClick={() => handleItemClick("Books")}
              >
                <svg
                  className="w-5 h-5 text-gray-800 dark:text-white"
                  aria-hidden="true"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="currentColor"
                  viewBox="0 0 16 20"
                >
                  <path d="M16 14V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v15a3 3 0 0 0 3 3h12a1 1 0 0 0 0-2h-1v-2a2 2 0 0 0 2-2ZM4 2h2v12H4V2Zm8 16H3a1 1 0 0 1 0-2h9v2Z" />
                </svg>

                <span className="flex-1 ml-3 text-left whitespace-nowrap">
                  Books
                </span>
              </button>
            </li>
            <li>
              <a
                href="#"
                className="flex items-center p-2 rounded-lg hover:bg-gray-100  group"
                onClick={() => handleItemClick("Members")}
              >
                <svg
                  className="w-5 h-5 text-gray-800 dark:text-white"
                  aria-hidden="true"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="currentColor"
                  viewBox="0 0 20 19"
                >
                  <path d="M14.5 0A3.987 3.987 0 0 0 11 2.1a4.977 4.977 0 0 1 3.9 5.858A3.989 3.989 0 0 0 14.5 0ZM9 13h2a4 4 0 0 1 4 4v2H5v-2a4 4 0 0 1 4-4Z" />
                  <path d="M5 19h10v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2ZM5 7a5.008 5.008 0 0 1 4-4.9 3.988 3.988 0 1 0-3.9 5.859A4.974 4.974 0 0 1 5 7Zm5 3a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm5-1h-.424a5.016 5.016 0 0 1-1.942 2.232A6.007 6.007 0 0 1 17 17h2a1 1 0 0 0 1-1v-2a5.006 5.006 0 0 0-5-5ZM5.424 9H5a5.006 5.006 0 0 0-5 5v2a1 1 0 0 0 1 1h2a6.007 6.007 0 0 1 4.366-5.768A5.016 5.016 0 0 1 5.424 9Z" />
                </svg>
                <span className="flex-1 ml-3 whitespace-nowrap">Members</span>
              </a>
            </li>
            <li>
              <a
                href="#"
                className="flex items-center p-2 rounded-lg hover:bg-gray-100  group"
                onClick={() => handleItemClick("Insertion")}
              >
                <svg
                  className="w-5 h-5 text-gray-800 dark:text-white"
                  aria-hidden="true"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                >
                  <path d="M9.546.5a9.5 9.5 0 1 0 9.5 9.5 9.51 9.51 0 0 0-9.5-9.5ZM13.788 11h-3.242v3.242a1 1 0 1 1-2 0V11H5.304a1 1 0 0 1 0-2h3.242V5.758a1 1 0 0 1 2 0V9h3.242a1 1 0 1 1 0 2Z" />
                </svg>

                <span className="flex-1 ml-3 whitespace-nowrap">Insertion</span>
              </a>
            </li>
            <li>
              <a
                href="#"
                className="flex items-center p-2 rounded-lg hover:bg-gray-100 group"
              >
                <svg
                  className="w-5 h-5 text-gray-800 dark:text-white"
                  aria-hidden="true"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="currentColor"
                  viewBox="0 0 20 16"
                >
                  <path d="M18 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2ZM6.5 3a2.5 2.5 0 1 1 0 5 2.5 2.5 0 0 1 0-5ZM3.014 13.021l.157-.625A3.427 3.427 0 0 1 6.5 9.571a3.426 3.426 0 0 1 3.322 2.805l.159.622-6.967.023ZM16 12h-3a1 1 0 0 1 0-2h3a1 1 0 0 1 0 2Zm0-3h-3a1 1 0 1 1 0-2h3a1 1 0 1 1 0 2Zm0-3h-3a1 1 0 1 1 0-2h3a1 1 0 1 1 0 2Z" />
                </svg>
                <span className="flex-1 ml-3 whitespace-nowrap">Users</span>
              </a>
            </li>
            <li>
              <a
                href="#"
                className="flex items-center p-2  rounded-lg hover:bg-gray-100  group"
              >
                <svg
                  className="w-5 h-5 text-gray-800 dark:text-white"
                  aria-hidden="true"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                >
                  <path d="m17.418 3.623-.018-.008a6.713 6.713 0 0 0-2.4-.569V2h1a1 1 0 1 0 0-2h-2a1 1 0 0 0-1 1v2H9.89A6.977 6.977 0 0 1 12 8v5h-2V8A5 5 0 1 0 0 8v6a1 1 0 0 0 1 1h8v4a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1v-4h6a1 1 0 0 0 1-1V8a5 5 0 0 0-2.582-4.377ZM6 12H4a1 1 0 0 1 0-2h2a1 1 0 0 1 0 2Z" />
                </svg>
                <span className="flex-1 ml-3 whitespace-nowrap">Orders</span>
              </a>
            </li>
          </ul>
        </div>
      </aside>
    </>
  );
};
export default Sidebar;
