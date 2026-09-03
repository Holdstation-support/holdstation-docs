# 🛡️ AML Policy

## Holdstation Anti-Money Laundering (AML) & Counter-Terrorist Financing (CTF) Guideline

### 1. Policy Statement

Holdstation is committed to preventing money laundering (ML), terrorist financing (TF), proliferation financing, sanctions evasion, and all forms of illicit financial activity through its crypto-fiat services, wallet infrastructure, OTC desk, and payment rails.

Holdstation adheres to and supports international regulatory standards, including:

* Vietnam Anti-Money Laundering Law (2022)
* Decree 19/2023/NĐ-CP
* FATF Recommendation 16 (Travel Rule)

Holdstation operates a risk-based AML framework, requiring systematic due diligence, continuous monitoring, and regulatory reporting.

***

### 2. Scope of Application

This policy applies to:

* All Holdstation entities, affiliates, and business lines
* Crypto-fiat services and OTC desk
* Liquidity operations
* Payment Gateway
* On-ramp / Off-ramp services
* Employees
* Contractors
* Compliance vendors

***

### 3. Governance & Responsibilities

#### 3.1 Board of Directors

Responsibilities include:

* Approving the AML/CTF Program
* Reviewing the annual AML Compliance Report
* Ensuring sufficient compliance resources and system effectiveness

***

#### 3.2 Chief Compliance Officer (CCO)

The Chief Compliance Officer is responsible for implementing and maintaining the AML Program.

Key responsibilities include:

* Managing ongoing AML operations
* Approving onboarding escalations
* Filing Suspicious Transaction Reports (STR/SAR)
* Maintaining communication with regulators
* Leading AML risk assessments
* Managing AML audit cycles

***

#### 3.3 Compliance Team

The Compliance Team is responsible for:

* Performing Customer Due Diligence (CDD) and Enhanced Due Diligence (EDD)
* Conducting on-chain forensic screening
* Maintaining sanctions screening
* Monitoring transactions
* Performing AML investigations

***

#### 3.4 Employees

All employees are required to:

* Complete mandatory AML training
* Report any suspicious activity to the Compliance Team

***

### 4. Risk Assessment Framework

#### 4.1 Risk Categorization

| Risk Category    | Examples                                                                    |
| ---------------- | --------------------------------------------------------------------------- |
| Customer         | High-net-worth (HNW) traders, offshore entities, unverified wallet clusters |
| Transaction      | High-volume OTC flows, bridging activities, mixing routes                   |
| Product          | Stablecoins with fiat settlement, P2P services, large withdrawals           |
| Geographic       | Sanctioned jurisdictions                                                    |
| Delivery Channel | OTC desk, API merchants                                                     |

***

#### 4.2 Prohibited Risk

Holdstation strictly prohibits conducting business with:

* Sanctioned entities or jurisdictions
* Politically sanctioned regimes
* Anonymous or shell entities without transparent ownership
* Crypto mixers, tumblers, or malicious privacy-enhancing tools
* Known dark-web marketplaces
* Fraud-related entities
* Human trafficking networks
* Terrorism-related organizations

***

### 5. Customer Due Diligence (CDD)

#### 5.1 KYC Integration Framework

Holdstation Pay integrates directly with the Government Identification System of Vietnam to verify the identity of domestic users through a secure API connection.

This integration enables:

* Automated identity verification
* Real-time validation
* Secure data retrieval
* Fraud prevention
* Record retention

#### Required Information for Vietnam Users

| Field           | Vietnamese Label | Description                                           |
| --------------- | ---------------- | ----------------------------------------------------- |
| Document Type   | Loại giấy tờ     | Type of official identification (e.g. CCCD, Passport) |
| Document Number | Số giấy tờ       | Unique identification number                          |
| Expiration Date | Ngày hết hạn     | Date the document becomes invalid                     |
| Date of Issue   | Ngày cấp         | Date the document was issued                          |

> The integration validates the authenticity of identification documents against the Government database in real time and prevents duplicate or fraudulent identity usage.

#### 5.2 International Clients _(Not Applied Yet)_

For users outside Vietnam, Holdstation Pay enforces KYC through **Sumsub**, an industry-grade global identity verification provider.

Sumsub ensures adherence to FATF-compliant KYC standards, enabling verification of users across multiple jurisdictions with consistent risk scoring.

#### Required Information for International Clients

| Field                     | Description                                     |
| ------------------------- | ----------------------------------------------- |
| Issuing State             | Country or authority that issued the document   |
| First Name                | User's first name                               |
| Last Name                 | User's last name                                |
| Date of Birth             | User's date of birth                            |
| Gender                    | Gender as stated on the identification document |
| Nationality               | Country of citizenship                          |
| Residential Address       | Full residential address                        |
| Phone Number _(Optional)_ | Contact number if provided                      |
| Email _(Optional)_        | Contact email for verification notices          |

***

### 5.3 Corporate Verification (KYB)

Holdstation Pay applies **Know Your Business (KYB)** due diligence for legal entities, merchants, and institutional partners that access the Holdstation Pay API or operate on/off-ramp liquidity.

#### 5.3.1 KYB Requirements

All businesses must provide verified incorporation details and ownership structure to ensure transparency and prevent shell company abuse.

#### Required Documentation

| Category                            | Required Information                            | Description                                                                     |
| ----------------------------------- | ----------------------------------------------- | ------------------------------------------------------------------------------- |
| Legal Entity Registration           | Certificate of Incorporation / Business License | Valid proof of business existence                                               |
| Ultimate Beneficial Ownership (UBO) | UBO Declaration Form                            | Identification of individuals owning ≥25% or exercising control over the entity |
| Directors / Key Executives          | KYC of authorized representatives               | Verification of individuals controlling or signing on behalf of the company     |
| Business Operations                 | Nature of business, source of revenue           | Must align with declared business activities                                    |
| Registered Address                  | Proof of address                                | Utility bill, bank statement, or government-issued document                     |
| Bank Account Proof                  | Business account statement                      | Confirms operational account in the entity's name                               |
| Sanctions / Watchlist               | Automated screening                             | Continuous monitoring against global sanctions lists                            |

***

#### 5.3.2 KYB Process Flow

All KYB onboarding follows the process below:

1. **Document Collection**
   * Businesses submit all required documentation through Holdstation Pay's secure onboarding portal.
2. **Verification**
   * The Compliance Team reviews all submitted documents for validity, authenticity, and completeness.
3. **Approval or Rejection**
   * Applications are assessed based on Holdstation's internal risk scoring framework.
4. **Ongoing Monitoring**
   * Approved businesses are subject to periodic reviews every **12–24 months**, or immediately upon any material change in ownership, business activities, or risk profile.

***

#### 5.4 Ongoing Monitoring

Holdstation performs continuous monitoring throughout the customer relationship.

**Behavioral Analysis**

Continuous observation of user and merchant transaction behavior to identify abnormal or suspicious patterns.

**Periodic Review**

Re-KYC or Re-KYB is required when:

* Identification documents expire
* Material customer information changes
* Internal risk triggers are activated

**High-Risk Cases**

High-risk customers are escalated to the Compliance Committee for **Enhanced Due Diligence (EDD)** before services continue.

***

#### 5.5 Record Retention

All KYC and KYB documents are securely retained for a minimum of **five (5) years** after termination of the business relationship.

Access to these records is restricted to authorized Compliance personnel only.

***

## 6. Enhanced Due Diligence (EDD)

### 6.1 Overview

Enhanced Due Diligence (EDD) applies when a customer, transaction, or wallet activity presents a higher-than-normal risk of:

* Money laundering
* Terrorist financing
* Sanctions evasion

EDD requires Holdstation Pay to perform additional verification and risk assessment before initiating or continuing a business relationship.

EDD supplements the standard KYC/KYB process and must be documented in every applicable case.

***

### 6.2 EDD Triggers

| Category                           | Description                                                                                  | Typical Examples                                                                         |
| ---------------------------------- | -------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| High-Value Flows                   | Transactions exceeding internal or regulatory thresholds defined by the Compliance Committee | Cumulative on/off-ramp value exceeding **VND 500 million per day** (or equivalent)       |
| Flagged Crypto Addresses           | Wallets or smart contracts linked to illicit activities, hacks, or sanctions lists           | Addresses reported by Chainalysis, TRM, or SBV blacklists                                |
| Suspicious Flow Patterns           | Activity inconsistent with the user's profile or financial capacity                          | Rapid fiat-to-crypto conversions, circular transfers between connected accounts          |
| Politically Exposed Persons (PEPs) | Customers identified as PEPs or closely associated individuals                               | Government officials, executives of state-owned enterprises, or immediate family members |
| Sudden Volume Spikes               | Significant increase in transaction volume or frequency without reasonable explanation       | Newly created accounts conducting large-volume trading immediately after onboarding      |

## 7. Transaction Monitoring Framework

Holdstation Pay operates a centralized transaction management system that monitors every on/off-ramp transaction in real time.

The system integrates fiat settlement data, blockchain activity, and user risk profiles to provide a comprehensive view of transactional behavior.

***

### 7.1 System Overview

All transaction flows pass through Holdstation's internal transaction management system, where they are:

* Logged in real time
* Automatically scored by the risk engine
* Cross-checked against KYC information and historical user activity
* Synchronized with blockchain analytics for counterparty verification

This centralized monitoring framework enables early detection of suspicious activities while maintaining operational efficiency.

***

### 7.2 Alerting Mechanism

The Compliance and Operations teams receive real-time alerts through multiple monitoring channels.

#### Internal Dashboard

The internal dashboard provides:

* Live transaction analytics
* User risk summaries
* Automated compliance flags
* Case management information

#### Telegram Bot Notifications

A dedicated Telegram notification system delivers instant alerts for:

* High-value transactions
* Abnormal transaction behavior
* High-risk wallet interactions
* Compliance escalation events

Notifications are sent directly to Compliance Committee members and AML analysts to ensure immediate awareness and rapid response.

> The dual-channel alert system improves operational visibility and minimizes response time for critical compliance events.

***

### 7.3 Threshold Rules

Holdstation Pay maintains internal risk thresholds that are reviewed quarterly by the Compliance Committee.

#### Daily Transaction Value

Users whose cumulative transaction value exceeds **VND 5 billion** (approximately **USDT 170,000**) within a rolling 24-hour period are automatically subject to enhanced verification procedures, including:

* Additional KYC verification
* Supporting document review
* Source of Funds (SoF) confirmation

#### High-Risk Behavior

Transactions are automatically flagged when they:

* Are inconsistent with the user's historical behavior
* Exceed expected financial capacity
* Originate from high-risk or sanctioned jurisdictions
* Match predefined AML risk indicators

Flagged transactions require manual review by the Compliance Team before further processing.

***

### 7.4 Escalation Process

When suspicious activity is detected, Holdstation follows the escalation workflow below.

#### Step 1 — System Alert

The transaction monitoring engine automatically generates a risk score based on predefined AML rules and behavioral analysis.

#### Step 2 — Telegram Notification

An instant notification is delivered to the Compliance Team for immediate review.

#### Step 3 — Compliance Review

AML analysts review:

* Transaction details
* User profile
* Historical transaction activity
* Blockchain analytics
* Risk indicators

through the internal management dashboard.

#### Step 4 — Decision

Following the review, the Compliance Team may:

* Approve the transaction
* Continue monitoring the customer
* Escalate the case for Suspicious Transaction Report (STR) filing

All findings, decisions, and supporting evidence are recorded within the internal case management system.

***

## 8. Blockchain Analytics Integration

Holdstation integrates **Chainalysis** and **Chaintracer** into its AML compliance framework to strengthen on-chain monitoring and risk management.

All cryptocurrency transactions processed through the Holdstation Pay on/off-ramp infrastructure are screened before settlement.

Blockchain analytics provide:

* Automated wallet screening
* Transaction tracing
* Exposure scoring
* Risk classification

If a wallet or transaction is identified as high risk, the system automatically:

1. Generates an alert in the Compliance Dashboard.
2. Notifies the Compliance Committee.
3. Initiates a manual compliance review before settlement.

Holdstation Pay strictly prohibits transactions associated with known illicit sources, including:

* Wallets listed under international sanctions
* Addresses associated with criminal activity
* Wallets linked to hacks or stolen funds
* Scam-related addresses
* Privacy mixers and anonymization services designed to conceal transaction origins

***

## 9. Reporting and Escalation

Holdstation maintains a structured process for identifying, investigating, and reporting suspicious activities in accordance with FATF recommendations and Vietnam's Anti-Money Laundering regulations.

When suspicious activity is detected through the transaction monitoring system or blockchain analytics, the following workflow is applied.

### Detection → Review → Escalation

#### 1. Detection

Potential suspicious activity is identified through:

* Automated monitoring alerts
* Blockchain analytics
* Analyst observations
* Internal investigations

#### 2. Review

Compliance Analysts assess the case by:

* Verifying transaction data
* Reviewing customer information
* Cross-checking internal records
* Screening against sanctions and watchlists
* Assessing blockchain exposure

#### 3. Escalation

Confirmed high-risk cases are immediately escalated to the Compliance Committee for further action and regulatory decision-making.

Where required, a Suspicious Transaction Report (STR) is prepared and submitted to the appropriate authority.

> All investigations and reports are handled confidentially and independently from operational teams to preserve investigative integrity and protect customer privacy.

## 10. Recordkeeping and Data Security

Holdstation ensures complete traceability of all AML/CTF activities while maintaining the integrity, confidentiality, and security of customer data across both fiat and blockchain environments.

***

### 10.1 Record Retention

Holdstation securely retains all compliance-related records for a minimum of **five (5) years** following either:

* The termination of the business relationship; or
* The date of the customer's most recent transaction,

whichever is later.

Records retained include, but are not limited to:

* KYC and KYB documentation
* Enhanced Due Diligence (EDD) records
* Transaction logs
* Suspicious Transaction Reports (STRs)
* Internal investigation records
* Compliance communications
* Risk assessment documentation

***

### 10.2 Data Security

All compliance data is stored within encrypted environments protected by multiple layers of security controls.

Security measures include:

* Encryption of sensitive data
* Role-based access control
* Multi-factor authentication (MFA)
* Continuous audit logging
* Secure backup and disaster recovery mechanisms

These controls help ensure confidentiality, integrity, availability, and recoverability of compliance information.

***

### 10.3 Audit Trail

Every compliance-related action is automatically recorded to establish a complete and immutable audit trail.

The audit trail includes:

* Compliance decisions
* Document submissions
* File modifications
* Internal communications
* Investigation outcomes

This ensures transparency and provides reliable evidence for regulators, banking partners, and internal audits.

***

## 11. Continuous Improvement and Review

Holdstation Pay considers compliance to be a continuously evolving framework that adapts to changing regulations, emerging technologies, and evolving financial crime risks.

The Compliance Committee reviews the AML/CTF Program on a **semi-annual basis** to:

* Enhance risk assessment methodologies
* Improve transaction monitoring capabilities
* Strengthen automation and operational efficiency
* Incorporate new regulatory requirements
* Address emerging financial crime typologies

Through continuous improvement, data transparency, and proactive governance, Holdstation Pay aims to maintain a robust compliance framework while supporting innovation in digital asset services.

***

## Appendix A — Glossary of Terms

### AML (Anti-Money Laundering)

Measures, regulations, and procedures designed to prevent the concealment or use of illegally obtained funds.

***

### CTF (Counter-Terrorist Financing)

Policies and activities intended to prevent the financing of terrorist organizations and activities.

***

### KYC (Know Your Customer)

The process of verifying a customer's identity before providing financial services.

***

### KYB (Know Your Business)

Verification and risk assessment procedures applied to corporate entities, merchants, and institutional partners.

***

### EDD (Enhanced Due Diligence)

Additional verification procedures applied to customers or transactions presenting elevated AML or sanctions risks.

***

### PEP (Politically Exposed Person)

An individual entrusted with a prominent public function, including their immediate family members and close associates.

***

### SoF / SoW (Source of Funds / Source of Wealth)

Evidence demonstrating:

* **Source of Funds (SoF):** The origin of money used in a specific transaction.
* **Source of Wealth (SoW):** How a customer accumulated their overall wealth.

***

### STR (Suspicious Transaction Report)

A formal report submitted to the Financial Intelligence Unit (FIU) when suspicious activity is identified.

***

### FIU (Financial Intelligence Unit)

The authority responsible for receiving, analyzing, and investigating Suspicious Transaction Reports.

In Vietnam, this function is performed under the State Bank of Vietnam (SBV).

***

### VASP (Virtual Asset Service Provider)

A regulated entity that provides services involving virtual assets, including exchange, transfer, custody, or related financial services.

***

## Appendix D — KYC / EDD Checklist (Internal Use)

### Vietnam Users (Government ID Integration)

The following information must be verified during onboarding:

* Document Type (CCCD / CMND / Passport)
* Document Number
* Date of Issue
* Expiration Date
* Government API verification completed
* Face match / Liveness check
* Bank account name matches KYC information
* Risk score assigned

***

### International Users (Sumsub)

The following information must be verified:

* Issuing State
* Nationality
* Full Name
* Date of Birth
* Residential Address
* Identity document verification completed
* Sanctions screening completed

***

### Enhanced Due Diligence (EDD)

Additional verification is required for high-risk customers and transactions, including:

* Source of Funds (e.g., bank statements or proof of income)
* Source of Wealth verification
* Blockchain exposure analysis using Chainalysis
* Compliance Committee review and approval

***

