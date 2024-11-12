# Database Migration Project

## Setup
1. Install Java 11 or higher
2. Configure database connection in `liquibase.properties` or environment variables

## Commands
- Create new changeset: `./gradlew createChangeset -Pname="description"`
- Update database: `./gradlew update`
- Generate docs: `./gradlew dbDoc`
- Validate changes: `./gradlew validateChangelog`

## Structure

src/main/resources/
└── db/
└── changelog/
├── changelog-master.xml
└── changes/
├── schema/
├── tables/
├── indexes/
├── constraints/
└── data/

## Best Practices
1. One change per changeset
2. Use descriptive names
3. Test changes in development first
4. Keep backups before major changes




