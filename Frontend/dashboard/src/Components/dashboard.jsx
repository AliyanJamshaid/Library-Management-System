import { useState } from "react";
import Topbar from './Layouts/topbar'
import Sidebar from "./Layouts/sidebar";
import Table from "./Layouts/table";

function Dashboard() {
  const [isSidebarOpen, setIsSidebarOpen] = useState(true);
  const [selectedSidebarItem, setSelectedSidebarItem] = useState('Dashboard');

  const toggleSidebar = () => {
    setIsSidebarOpen(!isSidebarOpen);
  };

  const handleSidebarItemClick = (itemText) => {
    setSelectedSidebarItem(itemText);
  };

  return (
    <>
    <div>
      <Topbar toggleSidebar={toggleSidebar} isSidebarOpen={isSidebarOpen} />
      <Sidebar isSidebarOpen={isSidebarOpen} onSelectItem={handleSidebarItemClick} />
      <Table isSidebarOpen={isSidebarOpen} selectedSidebarItem={selectedSidebarItem} />
    </div>
    </>
  );
}

export default Dashboard;

