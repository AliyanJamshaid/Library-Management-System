import {
    GET_ALL_BOOKS_REQUEST,
    GET_ALL_BOOKS_SUCCESS,
    GET_ALL_BOOKS_FAILURE,
    GET_CONNECTED_BOOKS_REQUEST,
    GET_CONNECTED_BOOKS_SUCCESS,
    GET_CONNECTED_BOOKS_FAILURE
  } from '../Constants/booksConstant.jsx';

  
 
  
 export const booksReducer = (state = {books:[], loading: false, error: null }, action) => {
    switch (action.type) {
      case GET_ALL_BOOKS_REQUEST:
        return {
          ...state,
          loading: true,
          error: null
        };
  
      case GET_ALL_BOOKS_SUCCESS:
        return {
          ...state,
          loading: false,
          books: action.payload.books,
          error: null
        };
  
      case GET_ALL_BOOKS_FAILURE:
        return {
          ...state,
          loading: false,
          error: action.payload
        };
  
      default:
        return state;
    }
  };
  

  export const connectedBooksReducer = (state = {records:[], loading: false, error: null }, action) => {
    switch (action.type) {
      case GET_CONNECTED_BOOKS_REQUEST:
        return {
          ...state,
          loading: true,
          error: null
        };
  
      case GET_CONNECTED_BOOKS_SUCCESS:
        return {
          ...state,
          loading: false,
          records: action.payload.records,
          error: null
        };
  
      case GET_CONNECTED_BOOKS_FAILURE:
        return {
          ...state,
          loading: false,
          error: action.payload
        };
  
      default:
        return state;
    }
  };
  