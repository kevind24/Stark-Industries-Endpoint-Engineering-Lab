# Stark Industries Endpoint Engineering Lab

## Project Status

✅ **Completed**

## Project Overview

This home lab simulates a small enterprise Windows endpoint-management environment using Microsoft Intune, Microsoft Entra ID, Windows Autopilot, Windows 11, and PowerShell.

The project was designed to develop hands-on experience with the lifecycle of managed Windows endpoints:

**Provision → Configure → Secure → Deploy → Monitor → Troubleshoot → Validate**

A two-tier deployment model was used to separate pilot testing from production rollout.

## Environment

### Management Platform

- Microsoft Intune
- Microsoft Entra ID
- Windows Autopilot
- Windows Update for Business
- Microsoft Defender
- PowerShell

### Endpoints

**STARK-3725 — Pilot Endpoint**

Used to test configuration policies, compliance settings, application deployments, Windows update policies, and PowerShell scripts before broader deployment.

**STARK-8464 — Production Endpoint**

Used to validate production-targeted application deployment and the pilot-to-production rollout workflow.

Both endpoints were Windows 11 virtual machines hosted in Hyper-V.

## Endpoint Provisioning

Configured Windows Autopilot enrollment for Windows 11 endpoints.

Imported device hardware information into Windows Autopilot, assigned devices to endpoint groups, and applied an Autopilot deployment profile.

Validated Microsoft Entra ID join and Intune enrollment after Windows OOBE.

During production endpoint provisioning, diagnosed an Autopilot device that remained unassigned and traced the issue to group and deployment-profile scope. After correcting group membership and profile assignment, the device successfully completed enrollment.

## Endpoint Configuration and Security

Created and assigned Intune policies to establish baseline endpoint configuration and security settings.

Configuration and validation included:

- Windows endpoint configuration policies
- Microsoft Defender settings
- Compliance policy evaluation
- Secure Boot validation
- Endpoint policy synchronization
- Pilot and production device-group targeting

Policy behavior was validated from both the Intune admin center and the managed Windows endpoint.

## Win32 Application Deployment

Packaged 7-Zip as an Intune Win32 application using the Microsoft Win32 Content Prep Tool.

Configured:

- Silent installation and uninstall commands
- x64 architecture requirements
- Windows version requirements
- File-based application detection
- System-context installation
- Pilot and production assignments

7-Zip was initially deployed to the pilot endpoint and validated before being promoted to the production device group.

The application was successfully installed and launched on both STARK-3725 and STARK-8464 through Intune.

## Windows Update Management

Created separate Windows Update for Business deployment rings for pilot and production endpoints.

### Pilot Ring

- Quality update deferral: 0 days
- Feature update deferral: 0 days

### Production Ring

- Quality update deferral: 7 days
- Feature update deferral: 14 days

This configuration provides a staged update model in which updates can reach pilot endpoints before production endpoints.

## PowerShell Endpoint Management

Created and tested a PowerShell endpoint inventory script.

The script collects:

- Computer name
- Manufacturer
- Model
- Windows version
- OS build
- BIOS version
- Inventory timestamp

The script was tested locally before being uploaded to Intune and assigned to the pilot endpoint.

Intune executed the script in the system context on STARK-3725 and generated:

`C:\ProgramData\StarkIndustries\EndpointInventory.txt`

The resulting file was reviewed to validate successful remote script execution.

## Troubleshooting Scenarios

### Application Deployment / Reevaluation

7-Zip was removed from the pilot endpoint through an Intune uninstall assignment.

After the pilot group was returned to the Required assignment, the application initially remained reported as not installed while Intune reevaluated the deployment.

The endpoint and application assignment were reviewed without manually reinstalling the application. The Intune Management Extension subsequently processed the Required deployment and automatically reinstalled 7-Zip.

The installation was validated by confirming that the application was present and launched successfully.

### Compliance Policy Evaluation

The pilot endpoint reported errors for several compliance settings.

Per-setting results identified SyncML 404 errors associated with BitLocker, Secure Boot, and Code Integrity checks in the virtualized lab environment.

Local validation confirmed that Secure Boot was enabled and Microsoft Defender antivirus, antispyware, and real-time protection were active.

The compliance policy was adjusted to retain applicable requirements while removing checks that the lab VM could not reliably report. After synchronization and reevaluation, the device reported compliant.

### Autopilot Profile Assignment

The production endpoint was successfully imported into Windows Autopilot but initially remained in a Not assigned state.

Troubleshooting identified that the production device group was not initially within the required Autopilot profile scope and that the new device needed the appropriate production group membership.

After correcting group membership and deployment-profile targeting, the production device received the Autopilot profile and completed enrollment.

## Pilot-to-Production Validation

The project used separate endpoint groups for pilot and production deployment.

Changes were first validated against STARK-3725 before being targeted to the production group.

The production endpoint, STARK-8464, successfully received the production-targeted 7-Zip deployment and launched the application without manual installation.

Windows update rings also used separate pilot and production targeting, with production updates configured with longer deferral periods.

This demonstrated a simplified enterprise deployment workflow:

**Build → Pilot → Test → Validate → Production → Monitor → Troubleshoot → Document**

## Lessons Learned

- Intune policy and application reporting can lag behind actual endpoint state.
- Detection rules are critical to Win32 application deployment because they determine whether Intune considers an application installed.
- System-context application deployment allows software installation without requiring local administrator privileges from the signed-in user.
- Device-group membership and assignment scope directly affect Autopilot profiles, applications, policies, and update deployments.
- Pilot groups provide a controlled way to validate endpoint changes before broader rollout.
- Virtualized endpoints may not report every hardware-backed compliance setting in the same way as physical enterprise devices.
- Endpoint-side validation is valuable when Intune reporting has not yet updated.
- Testing PowerShell locally before deploying it through endpoint management reduces deployment troubleshooting.

## Repository Contents

This repository contains:

- Architecture documentation
- Selected configuration and deployment screenshots
- PowerShell endpoint-management script
- Troubleshooting documentation
- Testing and validation evidence
- Project lessons learned

## Disclaimer

This repository documents a personal home lab created for technical learning and professional development. It does not represent production infrastructure or professional experience administering Microsoft Intune, Windows Autopilot, or enterprise endpoint-management systems.
