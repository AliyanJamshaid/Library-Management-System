import { createStore, applyMiddleware, combineReducers } from 'redux'; 
import thunk from 'redux-thunk';
import {booksReducer, connectedBooksReducer} from './Reducers/booksReducer';

const rootReducer = combineReducers({
  books: booksReducer,
  records: connectedBooksReducer,
});

const middleware = [thunk];
const store = createStore(
  rootReducer,
  applyMiddleware(...middleware)
);

export default store;
