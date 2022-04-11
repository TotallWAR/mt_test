import * as React from "react";
import { useState } from "react";

export const ItemsContext = React.createContext(null);

export const ItemsProvider = ({ children }) => {
    const [items, updateItems] = useState([]);
    const [err, setErr] = useState(null);
    const [loading, updateLoading] = useState(false);

    return (
        <ItemsContext.Provider
            value={{ items, updateItems, err, setErr, loading, updateLoading }}
        >
            {children}
        </ItemsContext.Provider>
    );
};
