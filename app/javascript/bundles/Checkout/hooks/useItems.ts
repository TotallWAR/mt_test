import { useCallback, useContext, useEffect } from "react";
import { debounce } from "../../common/utils/debounce";
import { ItemsContext } from "../context/items.context";

export const useItems = ({ code }) => {
    const { items, updateItems, err, setErr, loading, updateLoading } =
        useContext(ItemsContext);

    const loadItem = useCallback(
        debounce(c => {
            (async () => {
                if (typeof c !== "undefined" && c !== "") {
                    updateLoading(true);
                    const res = await fetch(`/items/${c}`);
                    if (res.ok) {
                        if (err) {
                            setErr(null);
                        }
                        const result = await res.json();
                        const curItem = items.find(
                            item => item.id === result.id
                        );
                        if (!curItem) {
                            const newItems = [...items];
                            newItems.push(result);
                            updateItems(newItems);
                        }
                    } else {
                        setErr(res.statusText);
                    }
                    updateLoading(false);
                }
            })();
        }, 200),
        [err, items]
    );
    // @ts-ignore
    useEffect(() => loadItem(code), [code]);

    return { items, err, loading };
};
