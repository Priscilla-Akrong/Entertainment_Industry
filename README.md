# 🎬🎵 Famous People in the Movie & Music Industry – Relational Database Project

This project involves designing and managing a **MySQL relational database** to capture detailed information about **famous individuals** in the **movie and music industry**, as well as their **roles, contributions, and achievements**. The database is enriched with real-world-like records and visualized through **Power BI dashboards**.

---

## 📁 Project Structure

### ✅ Database Design

The database consists of **5 relational tables**:

1. **FamousPeople** – General information about each individual.
2. **Movies** – Details of movies associated with the individuals.
3. **Songs** – Songs produced or performed.
4. **Awards** – Awards won across different categories.
5. **Roles** – Describes the roles (actor, singer, etc.) linking people to movies or songs.

These tables are connected using **foreign keys**, allowing complex queries and relationship-based analysis. The schema supports individuals who are **both actors and singers**.


---

## 🛠 Tools & Technologies

- **MySQL**
- **Data Modeling**

---

## 🚀 Getting Started

1. Clone or download this repository.
2. Open `create_tables.sql` in MySQL Workbench to create the schema.
3. Run `insert_data.sql` to populate the database.
4. Run queries from `complex_queries.sql` to explore insights.


---

## 📌 Notes

- Relationships were designed to account for **multi-talented individuals** (actors who are also singers).
- Realistic sample data with over **10 records per table** was used.
- Dashboard and queries provide **business-style insights** similar to those used in the entertainment industry.

