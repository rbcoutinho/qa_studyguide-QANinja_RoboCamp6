***Settings***

Library     SeleniumLibrary
Library     libs/db.py

Resource    kws.robot
Resource    hooks.robot
Resource    services.robot

Resource    components/Sidebar.robot
Resource    components/Toaster.robot
Resource    Pages/LoginPage.robot
Resource    Pages/CustomersPage.robot
Resource    Pages/EquiposPage.robot
Resource    Pages/ContractsPage.robot

***Variables***

${base_url}     http://zepalheta-web:3000/
${admin_user}   admin@zepalheta.com.br
${admin_pass}   pwd123

