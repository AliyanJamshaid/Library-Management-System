import { useEffect } from "react";
import {useNavigate} from 'react-router-dom';
const ProtectedRoutes = (props) => {
    const {Component} = props
    const navigation = useNavigate();
    useEffect(()=>{
        let login = localStorage.getItem('token');
        if(!login){
            navigation('/login')
        }
    },[])
  return <Component/>;
};
export default ProtectedRoutes;
