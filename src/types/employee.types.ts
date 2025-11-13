export interface EmployeeProfilePersonal {
  employee_id: string;            // not editable once created
  employee_name: string;
  age?: number;
  gender?: string;                // e.g., "Male" | "Female" | "Other"
  role?: string;                  // e.g., "Employee"
  company?: string;
  location?: string;
  contact_email?: string;
  contact_phone?: string;
}
