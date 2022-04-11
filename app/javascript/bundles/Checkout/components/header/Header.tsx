import * as React from "react";
import { FunctionComponent } from "react";
// @ts-ignore
import style from "./Header.module.css";

interface IProps {}

const Header: FunctionComponent<IProps> = ({}: IProps) => {
    return <div className={style.header}>
        Moneytree test task
    </div>;
};

export default Header;
