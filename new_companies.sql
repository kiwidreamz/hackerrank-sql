SELECT DISTINCT employee.company_code, company.founder, COUNT(DISTINCT lead_manager.lead_manager_code), COUNT(DISTINCT senior_manager.senior_manager_code), COUNT(DISTINCT manager.manager_code), COUNT(DISTINCT employee.employee_code)
FROM employee
JOIN company
ON employee.company_code = company.company_code
JOIN manager
ON employee.company_code = manager.company_code
JOIN senior_manager
ON employee.company_code = senior_manager.company_code
JOIN lead_manager
ON employee.company_code = lead_manager.company_code
GROUP BY employee.company_code, company.founder
ORDER BY company_code;