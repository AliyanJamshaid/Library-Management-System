import React from 'react';

const Topbar = ({toggleSidebar, isSidebarOpen}) => {
  return (
    <>
      <nav className="bg-white">
        <div className="pr-6 flex justify-between ml-10 pb-6 pt-2">
          <a className="flex mt-2 items-center">
            <span className=" text-2xl font-bold text-black">
              Library Management System
            </span>
          </a>
          <div className="login-with ">
            <div className="button-log" onClick={toggleSidebar}>
              {isSidebarOpen ? (
                <div className="btn active">
                  <menu_l></menu_l>
                  <menu_l></menu_l>
                  <menu_l></menu_l>
                </div>
              ) : (
                <div className="btn not-active">
                  <menu_l></menu_l>
                  <menu_l></menu_l>
                  <menu_l></menu_l>
                </div>
              )}
            </div>
            <div className="button-log">
              <svg
                className="w-4 h-4 text-gray-800 dark:text-white"
                aria-hidden="true"
                xmlns="http://www.w3.org/2000/svg"
                fill="currentColor"
                viewBox="0 0 14 18"
              >
                <path d="M7 9a4.5 4.5 0 1 0 0-9 4.5 4.5 0 0 0 0 9Zm2 1H5a5.006 5.006 0 0 0-5 5v2a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2a5.006 5.006 0 0 0-5-5Z" />
              </svg>
            </div>
            <div className="button-log">
              <svg
                className="w-4 h-4 text-gray-800 dark:text-white"
                aria-hidden="true"
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 18 15"
              >
                <path
                  stroke="currentColor"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth="2"
                  d="M1 7.5h11m0 0L8 3.786M12 7.5l-4 3.714M12 1h3c.53 0 1.04.196 1.414.544.375.348.586.82.586 1.313v9.286c0 .492-.21.965-.586 1.313A2.081 2.081 0 0 1 15 14h-3"
                />
              </svg>
            </div>
          </div>
        </div>
      </nav>
    </>
  );
};

export default Topbar;


