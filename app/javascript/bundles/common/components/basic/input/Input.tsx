import * as React from "react";
import { ChangeEvent, FunctionComponent } from "react";
//@ts-ignore
import style from "./Input.module.css";

interface IProps {
    id: string;
    label?: string;
    handleInput: (e: ChangeEvent<HTMLInputElement>) => void;
    autoFocus?: boolean;
    placeholder?: string;
}

const Input: FunctionComponent<IProps> = ({
    label,
    handleInput,
    id,
    autoFocus,
    placeholder = "",
}: IProps) => (
    <div className={style.input}>
        <label>{label}</label>
        <input
            id={id}
            onInput={handleInput}
            autoFocus={autoFocus}
            placeholder={placeholder}
        />
    </div>
);

export default Input;
