import axios from 'axios';

import {
    GET_ALL_BOOKS_REQUEST,
    GET_ALL_BOOKS_SUCCESS,
    GET_ALL_BOOKS_FAILURE,
    GET_CONNECTED_BOOKS_REQUEST,
    GET_CONNECTED_BOOKS_SUCCESS,
    GET_CONNECTED_BOOKS_FAILURE
  } from '../Constants/booksConstant.jsx';

  export const getAllBooks = (searchCriteria) => async (dispatch) => {
    try {
      
      dispatch({ type: GET_ALL_BOOKS_REQUEST });
      const {data} = await axios.get('http://localhost:5000/dashboard/books', {params:searchCriteria}); 

      dispatch({
        type: GET_ALL_BOOKS_SUCCESS,
        payload: data 
      });
    } catch (error) {
      dispatch({
        type: GET_ALL_BOOKS_FAILURE,
        payload: 'Error fetching books' 
      });
    }
  };


  export const getConnectedBooks = (searchCriteria) => async (dispatch) => {
    try {
      dispatch({ type: GET_CONNECTED_BOOKS_REQUEST });

      const {data} = await axios.get(`http://localhost:5000/dashboard/connectedbooks?table=${searchCriteria}`); 
      
      
      dispatch({
        type: GET_CONNECTED_BOOKS_SUCCESS,
        payload: data 
      });
    } catch (error) {
      dispatch({
        type: GET_CONNECTED_BOOKS_FAILURE,
        payload: 'Error fetching books' 
      });
    }
  };