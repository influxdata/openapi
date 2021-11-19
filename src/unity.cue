package contracts

import "github.com/influxdata/openapi/src/unity/unityschemas"

import "github.com/influxdata/openapi/src/unity/unitypaths"

import "github.com/influxdata/openapi/src/quartz/quartzschemas"

import "github.com/influxdata/openapi/src/common/commonschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

import "github.com/influxdata/openapi/src/common/commonparameters"

unity: {
	openapi: "3.0.0"
	info: {
		title:   "Unity API Service"
		version: "0.1.0"
	}
	servers: [{
		url: "/api/v2/quartz"
	}]
	paths: {
		"/me": unitypaths.me.#Ref
		"/account": unitypaths.account.#Ref
		"/accounts": unitypaths.accounts.#Ref
		"/accounts/default": unitypaths.accounts_default.#Ref
		"/billing": unitypaths.billing.#Ref
		"/marketplace": unitypaths.marketplace.#Ref
		"/billing/start_date": unitypaths.billing_start_date.#Ref
		"/usage/vectors": unitypaths.usage_vectors.#Ref
		"/usage/{vector_name}": unitypaths.usage_vector_name.#Ref
		"/usage/billing_stats": unitypaths.usage_billing_stats.#Ref
		"/usage/rate_limits": unitypaths.usage_rate_limits.#Ref
		"/settings/notifications": unitypaths.settings_notifications.#Ref
		"/billing/contact": unitypaths.billing_contact.#Ref
		"/payment_form/{form}": unitypaths.payment_form.#Ref
		"/billing/payment_method": unitypaths.billing_payment_method.#Ref
		"/billing/invoices": unitypaths.billing_invoices.#Ref
		"/billing/invoices/{invoiceId}": unitypaths.billing_invoices_invoiceId.#Ref
		"/orgs/{orgId}/invites": unitypaths.orgs_orgId_invites.#Ref
		"/orgs/{orgId}/invites/{inviteId}": unitypaths.orgs_orgId_invites_inviteId.#Ref
		"/orgs/{orgId}/invites/{inviteId}/resend": unitypaths.orgs_orgId_invites_inviteId_resend.#Ref
		"/orgs/{orgId}/users": unitypaths.orgs_orgId_users.#Ref
		"/orgs/{orgId}/users/{userId}": unitypaths.orgs_orgId_users_userId.#Ref
		"/orgs/{orgId}/limits": unitypaths.orgs_orgId_limits.#Ref
		"/checkout": unitypaths.checkout.#Ref
		"/cancel": unitypaths.cancel.#Ref
		"/operator/accounts": unitypaths.operator_accounts.#Ref
		"/operator/accounts/{accountId}": unitypaths.operator_accounts_accountId.#Ref
		"/operator/accounts/{accountId}/users/{userId}": unitypaths.operator_accounts_accountId_users_userId.#Ref
		"/operator/orgs": unitypaths.operator_orgs.#Ref
		"/operator/orgs/{orgId}": unitypaths.operator_orgs_orgId.#Ref
		"/operator/orgs/{orgId}/limits": unitypaths.operator_orgs_orgId_limits.#Ref
		"/auth/connection": unitypaths.sso.#Ref
	}
	components: {
		parameters: TraceSpan: commonparameters.TraceSpan.#Ref
		schemas: {
			Error: commonschemas.Error.#Ref
			Marketplace: unityschemas.Marketplace.#Ref
			OperatorAccount: unityschemas.OperatorAccount.#Ref
			OperatorAccounts: unityschemas.OperatorAccounts.#Ref
			MarketplaceSubscription: unityschemas.MarketplaceSubscription.#Ref
			User: unityschemas.User.#Ref
			Users: unityschemas.Users.#Ref
			MarketplaceType: unityschemas.MarketplaceType.#Ref
			TimeRange: unityschemas.TimeRange.#Ref
			VectorName: unityschemas.VectorName.#Ref
			Role: unityschemas.Role.#Ref
			PaymentFormType: unityschemas.PaymentFormType.#Ref
			AccountType: unityschemas.AccountType.#Ref
			BillingInfo: unityschemas.BillingInfo.#Ref
			Region: unityschemas.Region.#Ref
			BillingDate: unityschemas.BillingDate.#Ref
			BillingContact: unityschemas.BillingContact.#Ref
			BillingNotifySettings: unityschemas.BillingNotifySettings.#Ref
			CheckoutRequest: unityschemas.CheckoutRequest.#Ref
			Invite: unityschemas.Invite.#Ref
			Invites: unityschemas.Invites.#Ref
			PaymentMethodPut: unityschemas.PaymentMethodPut.#Ref
			CreditCardParams: unityschemas.CreditCardParams.#Ref
			PaymentMethod: unityschemas.PaymentMethod.#Ref
			UsageVectors: unityschemas.UsageVectors.#Ref
			UsageVector: unityschemas.UsageVector.#Ref
			Invoice: unityschemas.Invoice.#Ref
			Invoices: unityschemas.Invoices.#Ref
			OrgUser: unityschemas.OrgUser.#Ref
			Me: unityschemas.Me.#Ref
			OrgUsers: unityschemas.OrgUsers.#Ref
			Organization: unityschemas.Organization.#Ref
			Organizations: unityschemas.Organizations.#Ref
			RelatedAccount: unityschemas.RelatedAccount.#Ref
			// quartz shared limits
			OrgLimits: {
				quartzschemas.OrgLimits.#Ref
			}
			RateLimits: quartzschemas.RateLimits.#Ref
			Limit: quartzschemas.Limit.#Ref
			BucketLimits: quartzschemas.BucketLimits.#Ref
			TaskLimits: quartzschemas.TaskLimits.#Ref
			DashboardLimits: quartzschemas.DashboardLimits.#Ref
			CheckLimits: quartzschemas.CheckLimits.#Ref
			NotificationRuleLimits: quartzschemas.NotificationRuleLimits.#Ref
			NotificationEndpointLimits: quartzschemas.NotificationEndpointLimits.#Ref
			RestrictedLimit: quartzschemas.RestrictedLimit.#Ref
			Unlimited: quartzschemas.Unlimited.#Ref
		}
		responses: ServerError: commonresponses.ServerError.#Ref
	}
}
