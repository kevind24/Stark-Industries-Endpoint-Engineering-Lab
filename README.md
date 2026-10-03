# Stark Industries Endpoint Engineering Lab

## Project Status

🚧 **In Progress**

This project is a home lab designed to develop and demonstrate hands-on skills in modern Windows endpoint engineering and management.

## Project Objective

The goal of this lab is to build a small enterprise-style endpoint management environment that demonstrates the lifecycle of a managed Windows endpoint:

**Provision → Configure → Secure → Deploy → Monitor → Troubleshoot → Validate**

The lab focuses on practical endpoint engineering workflows using Microsoft Intune, Microsoft Entra ID, Windows 11, Windows Autopilot, application deployment, update management, endpoint security, compliance policies, and PowerShell.

## Planned Technologies

- Microsoft Intune
- Microsoft Entra ID
- Windows 11
- Windows Autopilot
- Intune Win32 application deployment
- Windows Update for Business
- Microsoft Defender
- BitLocker
- PowerShell

## Planned Environment

The lab will use a minimal two-device deployment model:

- **STARK-PILOT-01** — Pilot endpoint used to test configurations and deployments
- **STARK-PROD-01** — Production endpoint used to validate controlled rollout

Endpoint changes will follow a simplified enterprise deployment lifecycle:

**Build → Pilot → Test → Validate → Deploy → Monitor → Troubleshoot → Document**

## Planned Lab Areas

- Windows Autopilot provisioning
- Intune configuration profiles
- Win32 application packaging and deployment
- Endpoint security and compliance
- Windows update rings
- PowerShell endpoint management
- Pilot-to-production deployments
- Deployment monitoring and validation
- Endpoint troubleshooting
- Technical documentation

## Documentation

As the lab progresses, this repository will contain:

- Architecture documentation
- Selected configuration and deployment evidence
- PowerShell scripts
- Troubleshooting scenarios
- Testing and validation results
- Lessons learned

## Disclaimer

This repository documents a personal home lab created for technical learning and professional development. It does not represent production infrastructure or professional experience administering Microsoft Intune, Windows Autopilot, or enterprise endpoint-management systems.
