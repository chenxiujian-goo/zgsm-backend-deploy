/*
 Navicat Premium Dump SQL

 Source Server         : 测试集群
 Source Server Type    : PostgreSQL
 Source Server Version : 170005 (170005)
 Source Host           : localhost:5432
 Source Catalog        : casdoor
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 170005 (170005)
 File Encoding         : 65001

 Date: 05/08/2025 19:06:11
*/


-- ----------------------------
-- Sequence structure for casbin_api_rule_id_seq
-- ----------------------------
CREATE SEQUENCE IF NOT EXISTS "public"."casbin_api_rule_id_seq"
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for casbin_rule_id_seq
-- ----------------------------
CREATE SEQUENCE IF NOT EXISTS "public"."casbin_rule_id_seq"
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for casbin_user_rule_id_seq
-- ----------------------------
CREATE SEQUENCE IF NOT EXISTS "public"."casbin_user_rule_id_seq"
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for permission_rule_id_seq
-- ----------------------------
CREATE SEQUENCE IF NOT EXISTS "public"."permission_rule_id_seq"
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for record_id_seq
-- ----------------------------
CREATE SEQUENCE IF NOT EXISTS "public"."record_id_seq"
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for adapter
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."adapter" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "table" varchar(100) COLLATE "pg_catalog"."default",
  "use_same_db" bool,
  "type" varchar(100) COLLATE "pg_catalog"."default",
  "database_type" varchar(100) COLLATE "pg_catalog"."default",
  "host" varchar(100) COLLATE "pg_catalog"."default",
  "port" int4,
  "user" varchar(100) COLLATE "pg_catalog"."default",
  "password" varchar(150) COLLATE "pg_catalog"."default",
  "database" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for application
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."application" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "display_name" varchar(100) COLLATE "pg_catalog"."default",
  "logo" varchar(200) COLLATE "pg_catalog"."default",
  "homepage_url" varchar(100) COLLATE "pg_catalog"."default",
  "description" varchar(100) COLLATE "pg_catalog"."default",
  "organization" varchar(100) COLLATE "pg_catalog"."default",
  "cert" varchar(100) COLLATE "pg_catalog"."default",
  "default_group" varchar(100) COLLATE "pg_catalog"."default",
  "header_html" text COLLATE "pg_catalog"."default",
  "enable_password" bool,
  "enable_sign_up" bool,
  "enable_signin_session" bool,
  "enable_auto_signin" bool,
  "enable_code_signin" bool,
  "enable_saml_compress" bool,
  "enable_saml_c14n10" bool,
  "enable_saml_post_binding" bool,
  "use_email_as_saml_name_id" bool,
  "enable_web_authn" bool,
  "enable_link_with_email" bool,
  "org_choice_mode" varchar(255) COLLATE "pg_catalog"."default",
  "saml_reply_url" varchar(500) COLLATE "pg_catalog"."default",
  "providers" text COLLATE "pg_catalog"."default",
  "signin_methods" varchar(2000) COLLATE "pg_catalog"."default",
  "signup_items" varchar(3000) COLLATE "pg_catalog"."default",
  "signin_items" text COLLATE "pg_catalog"."default",
  "grant_types" varchar(1000) COLLATE "pg_catalog"."default",
  "tags" text COLLATE "pg_catalog"."default",
  "saml_attributes" varchar(1000) COLLATE "pg_catalog"."default",
  "is_shared" bool,
  "ip_restriction" varchar(255) COLLATE "pg_catalog"."default",
  "client_id" varchar(100) COLLATE "pg_catalog"."default",
  "client_secret" varchar(100) COLLATE "pg_catalog"."default",
  "redirect_uris" varchar(1000) COLLATE "pg_catalog"."default",
  "forced_redirect_origin" varchar(100) COLLATE "pg_catalog"."default",
  "token_format" varchar(100) COLLATE "pg_catalog"."default",
  "token_signing_method" varchar(100) COLLATE "pg_catalog"."default",
  "token_fields" varchar(1000) COLLATE "pg_catalog"."default",
  "expire_in_hours" int4,
  "refresh_expire_in_hours" int4,
  "signup_url" varchar(200) COLLATE "pg_catalog"."default",
  "signin_url" varchar(200) COLLATE "pg_catalog"."default",
  "forget_url" varchar(200) COLLATE "pg_catalog"."default",
  "affiliation_url" varchar(100) COLLATE "pg_catalog"."default",
  "ip_whitelist" varchar(200) COLLATE "pg_catalog"."default",
  "terms_of_use" varchar(100) COLLATE "pg_catalog"."default",
  "signup_html" text COLLATE "pg_catalog"."default",
  "signin_html" text COLLATE "pg_catalog"."default",
  "theme_data" json,
  "footer_html" text COLLATE "pg_catalog"."default",
  "form_css" text COLLATE "pg_catalog"."default",
  "form_css_mobile" text COLLATE "pg_catalog"."default",
  "form_offset" int4,
  "form_side_html" text COLLATE "pg_catalog"."default",
  "form_background_url" varchar(200) COLLATE "pg_catalog"."default",
  "form_background_url_mobile" varchar(200) COLLATE "pg_catalog"."default",
  "failed_signin_limit" int4,
  "failed_signin_frozen_time" int4
)
;

-- ----------------------------
-- Table structure for casbin_api_rule
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."casbin_api_rule" (
  "id" int8 NOT NULL DEFAULT nextval('casbin_api_rule_id_seq'::regclass),
  "ptype" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v0" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v1" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v2" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v3" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v4" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v5" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying
)
;

-- ----------------------------
-- Table structure for casbin_rule
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."casbin_rule" (
  "id" int8 NOT NULL DEFAULT nextval('casbin_rule_id_seq'::regclass),
  "ptype" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v0" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v1" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v2" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v3" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v4" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v5" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying
)
;

-- ----------------------------
-- Table structure for casbin_user_rule
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."casbin_user_rule" (
  "id" int8 NOT NULL DEFAULT nextval('casbin_user_rule_id_seq'::regclass),
  "ptype" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v0" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v1" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v2" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v3" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v4" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v5" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying
)
;

-- ----------------------------
-- Table structure for cert
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."cert" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "display_name" varchar(100) COLLATE "pg_catalog"."default",
  "scope" varchar(100) COLLATE "pg_catalog"."default",
  "type" varchar(100) COLLATE "pg_catalog"."default",
  "crypto_algorithm" varchar(100) COLLATE "pg_catalog"."default",
  "bit_size" int4,
  "expire_in_years" int4,
  "certificate" text COLLATE "pg_catalog"."default",
  "private_key" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for enforcer
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."enforcer" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "updated_time" varchar(100) COLLATE "pg_catalog"."default",
  "display_name" varchar(100) COLLATE "pg_catalog"."default",
  "description" varchar(100) COLLATE "pg_catalog"."default",
  "model" varchar(100) COLLATE "pg_catalog"."default",
  "adapter" varchar(100) COLLATE "pg_catalog"."default",
  "enforcer" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for group
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."group" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "updated_time" varchar(100) COLLATE "pg_catalog"."default",
  "display_name" varchar(100) COLLATE "pg_catalog"."default",
  "manager" varchar(100) COLLATE "pg_catalog"."default",
  "contact_email" varchar(100) COLLATE "pg_catalog"."default",
  "type" varchar(100) COLLATE "pg_catalog"."default",
  "parent_id" varchar(100) COLLATE "pg_catalog"."default",
  "is_top_group" bool,
  "title" varchar(255) COLLATE "pg_catalog"."default",
  "key" varchar(255) COLLATE "pg_catalog"."default",
  "children" text COLLATE "pg_catalog"."default",
  "is_enabled" bool
)
;

-- ----------------------------
-- Table structure for invitation
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."invitation" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "updated_time" varchar(100) COLLATE "pg_catalog"."default",
  "display_name" varchar(100) COLLATE "pg_catalog"."default",
  "code" varchar(100) COLLATE "pg_catalog"."default",
  "is_regexp" bool,
  "quota" int4,
  "used_count" int4,
  "application" varchar(100) COLLATE "pg_catalog"."default",
  "username" varchar(100) COLLATE "pg_catalog"."default",
  "email" varchar(100) COLLATE "pg_catalog"."default",
  "phone" varchar(100) COLLATE "pg_catalog"."default",
  "signup_group" varchar(100) COLLATE "pg_catalog"."default",
  "default_code" varchar(100) COLLATE "pg_catalog"."default",
  "state" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ldap
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."ldap" (
  "id" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "owner" varchar(100) COLLATE "pg_catalog"."default",
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "server_name" varchar(100) COLLATE "pg_catalog"."default",
  "host" varchar(100) COLLATE "pg_catalog"."default",
  "port" int4,
  "enable_ssl" bool,
  "allow_self_signed_cert" bool,
  "username" varchar(100) COLLATE "pg_catalog"."default",
  "password" varchar(100) COLLATE "pg_catalog"."default",
  "base_dn" varchar(100) COLLATE "pg_catalog"."default",
  "filter" varchar(200) COLLATE "pg_catalog"."default",
  "filter_fields" varchar(100) COLLATE "pg_catalog"."default",
  "default_group" varchar(100) COLLATE "pg_catalog"."default",
  "password_type" varchar(100) COLLATE "pg_catalog"."default",
  "auto_sync" int4,
  "last_sync" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for model
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."model" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "display_name" varchar(100) COLLATE "pg_catalog"."default",
  "description" varchar(100) COLLATE "pg_catalog"."default",
  "model_text" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for organization
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."organization" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "display_name" varchar(100) COLLATE "pg_catalog"."default",
  "website_url" varchar(100) COLLATE "pg_catalog"."default",
  "logo" varchar(200) COLLATE "pg_catalog"."default",
  "logo_dark" varchar(200) COLLATE "pg_catalog"."default",
  "favicon" varchar(200) COLLATE "pg_catalog"."default",
  "has_privilege_consent" bool,
  "password_type" varchar(100) COLLATE "pg_catalog"."default",
  "password_salt" varchar(100) COLLATE "pg_catalog"."default",
  "password_options" varchar(100) COLLATE "pg_catalog"."default",
  "password_obfuscator_type" varchar(100) COLLATE "pg_catalog"."default",
  "password_obfuscator_key" varchar(100) COLLATE "pg_catalog"."default",
  "password_expire_days" int4,
  "country_codes" text COLLATE "pg_catalog"."default",
  "default_avatar" varchar(200) COLLATE "pg_catalog"."default",
  "default_application" varchar(100) COLLATE "pg_catalog"."default",
  "user_types" text COLLATE "pg_catalog"."default",
  "tags" text COLLATE "pg_catalog"."default",
  "languages" varchar(255) COLLATE "pg_catalog"."default",
  "theme_data" json,
  "master_password" varchar(200) COLLATE "pg_catalog"."default",
  "default_password" varchar(200) COLLATE "pg_catalog"."default",
  "master_verification_code" varchar(100) COLLATE "pg_catalog"."default",
  "ip_whitelist" varchar(200) COLLATE "pg_catalog"."default",
  "init_score" int4,
  "enable_soft_deletion" bool,
  "is_profile_public" bool,
  "use_email_as_username" bool,
  "enable_tour" bool,
  "ip_restriction" varchar(255) COLLATE "pg_catalog"."default",
  "nav_items" varchar(1000) COLLATE "pg_catalog"."default",
  "widget_items" varchar(1000) COLLATE "pg_catalog"."default",
  "mfa_items" varchar(300) COLLATE "pg_catalog"."default",
  "account_items" varchar(5000) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for payment
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."payment" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "display_name" varchar(100) COLLATE "pg_catalog"."default",
  "provider" varchar(100) COLLATE "pg_catalog"."default",
  "type" varchar(100) COLLATE "pg_catalog"."default",
  "product_name" varchar(100) COLLATE "pg_catalog"."default",
  "product_display_name" varchar(100) COLLATE "pg_catalog"."default",
  "detail" varchar(255) COLLATE "pg_catalog"."default",
  "tag" varchar(100) COLLATE "pg_catalog"."default",
  "currency" varchar(100) COLLATE "pg_catalog"."default",
  "price" float8,
  "return_url" varchar(1000) COLLATE "pg_catalog"."default",
  "is_recharge" bool,
  "user" varchar(100) COLLATE "pg_catalog"."default",
  "person_name" varchar(100) COLLATE "pg_catalog"."default",
  "person_id_card" varchar(100) COLLATE "pg_catalog"."default",
  "person_email" varchar(100) COLLATE "pg_catalog"."default",
  "person_phone" varchar(100) COLLATE "pg_catalog"."default",
  "invoice_type" varchar(100) COLLATE "pg_catalog"."default",
  "invoice_title" varchar(100) COLLATE "pg_catalog"."default",
  "invoice_tax_id" varchar(100) COLLATE "pg_catalog"."default",
  "invoice_remark" varchar(100) COLLATE "pg_catalog"."default",
  "invoice_url" varchar(255) COLLATE "pg_catalog"."default",
  "out_order_id" varchar(100) COLLATE "pg_catalog"."default",
  "pay_url" varchar(2000) COLLATE "pg_catalog"."default",
  "success_url" varchar(2000) COLLATE "pg_catalog"."default",
  "state" varchar(100) COLLATE "pg_catalog"."default",
  "message" varchar(2000) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."permission" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "display_name" varchar(100) COLLATE "pg_catalog"."default",
  "description" varchar(100) COLLATE "pg_catalog"."default",
  "users" text COLLATE "pg_catalog"."default",
  "groups" text COLLATE "pg_catalog"."default",
  "roles" text COLLATE "pg_catalog"."default",
  "domains" text COLLATE "pg_catalog"."default",
  "model" varchar(100) COLLATE "pg_catalog"."default",
  "adapter" varchar(100) COLLATE "pg_catalog"."default",
  "resource_type" varchar(100) COLLATE "pg_catalog"."default",
  "resources" text COLLATE "pg_catalog"."default",
  "actions" text COLLATE "pg_catalog"."default",
  "effect" varchar(100) COLLATE "pg_catalog"."default",
  "is_enabled" bool,
  "submitter" varchar(100) COLLATE "pg_catalog"."default",
  "approver" varchar(100) COLLATE "pg_catalog"."default",
  "approve_time" varchar(100) COLLATE "pg_catalog"."default",
  "state" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for permission_rule
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."permission_rule" (
  "id" int8 NOT NULL DEFAULT nextval('permission_rule_id_seq'::regclass),
  "ptype" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v0" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v1" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v2" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v3" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v4" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "v5" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying
)
;

-- ----------------------------
-- Table structure for plan
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."plan" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "display_name" varchar(100) COLLATE "pg_catalog"."default",
  "description" varchar(100) COLLATE "pg_catalog"."default",
  "price" float8,
  "currency" varchar(100) COLLATE "pg_catalog"."default",
  "period" varchar(100) COLLATE "pg_catalog"."default",
  "product" varchar(100) COLLATE "pg_catalog"."default",
  "payment_providers" varchar(100) COLLATE "pg_catalog"."default",
  "is_enabled" bool,
  "role" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for pricing
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."pricing" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "display_name" varchar(100) COLLATE "pg_catalog"."default",
  "description" varchar(100) COLLATE "pg_catalog"."default",
  "plans" text COLLATE "pg_catalog"."default",
  "is_enabled" bool,
  "trial_duration" int4,
  "application" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for product
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."product" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "display_name" varchar(100) COLLATE "pg_catalog"."default",
  "image" varchar(100) COLLATE "pg_catalog"."default",
  "detail" varchar(1000) COLLATE "pg_catalog"."default",
  "description" varchar(200) COLLATE "pg_catalog"."default",
  "tag" varchar(100) COLLATE "pg_catalog"."default",
  "currency" varchar(100) COLLATE "pg_catalog"."default",
  "price" float8,
  "quantity" int4,
  "sold" int4,
  "is_recharge" bool,
  "providers" varchar(255) COLLATE "pg_catalog"."default",
  "return_url" varchar(1000) COLLATE "pg_catalog"."default",
  "state" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for provider
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."provider" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "display_name" varchar(100) COLLATE "pg_catalog"."default",
  "category" varchar(100) COLLATE "pg_catalog"."default",
  "type" varchar(100) COLLATE "pg_catalog"."default",
  "sub_type" varchar(100) COLLATE "pg_catalog"."default",
  "method" varchar(100) COLLATE "pg_catalog"."default",
  "client_id" varchar(200) COLLATE "pg_catalog"."default",
  "client_secret" varchar(3000) COLLATE "pg_catalog"."default",
  "client_id2" varchar(100) COLLATE "pg_catalog"."default",
  "client_secret2" varchar(500) COLLATE "pg_catalog"."default",
  "cert" varchar(100) COLLATE "pg_catalog"."default",
  "custom_auth_url" varchar(200) COLLATE "pg_catalog"."default",
  "custom_token_url" varchar(200) COLLATE "pg_catalog"."default",
  "custom_user_info_url" varchar(200) COLLATE "pg_catalog"."default",
  "custom_logo" varchar(200) COLLATE "pg_catalog"."default",
  "scopes" varchar(100) COLLATE "pg_catalog"."default",
  "user_mapping" varchar(500) COLLATE "pg_catalog"."default",
  "http_headers" varchar(500) COLLATE "pg_catalog"."default",
  "host" varchar(100) COLLATE "pg_catalog"."default",
  "port" int4,
  "disable_ssl" bool,
  "title" varchar(100) COLLATE "pg_catalog"."default",
  "content" varchar(2000) COLLATE "pg_catalog"."default",
  "receiver" varchar(100) COLLATE "pg_catalog"."default",
  "region_id" varchar(100) COLLATE "pg_catalog"."default",
  "sign_name" varchar(100) COLLATE "pg_catalog"."default",
  "template_code" varchar(100) COLLATE "pg_catalog"."default",
  "app_id" varchar(100) COLLATE "pg_catalog"."default",
  "endpoint" varchar(1000) COLLATE "pg_catalog"."default",
  "intranet_endpoint" varchar(100) COLLATE "pg_catalog"."default",
  "domain" varchar(100) COLLATE "pg_catalog"."default",
  "bucket" varchar(100) COLLATE "pg_catalog"."default",
  "path_prefix" varchar(100) COLLATE "pg_catalog"."default",
  "metadata" text COLLATE "pg_catalog"."default",
  "id_p" text COLLATE "pg_catalog"."default",
  "issuer_url" varchar(100) COLLATE "pg_catalog"."default",
  "enable_sign_authn_request" bool,
  "email_regex" varchar(200) COLLATE "pg_catalog"."default",
  "provider_url" varchar(200) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for radius_accounting
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."radius_accounting" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" timestamp(6),
  "username" varchar(255) COLLATE "pg_catalog"."default",
  "service_type" int8,
  "nas_id" varchar(255) COLLATE "pg_catalog"."default",
  "nas_ip_addr" varchar(255) COLLATE "pg_catalog"."default",
  "nas_port_id" varchar(255) COLLATE "pg_catalog"."default",
  "nas_port_type" int8,
  "nas_port" int8,
  "framed_ip_addr" varchar(255) COLLATE "pg_catalog"."default",
  "framed_ip_netmask" varchar(255) COLLATE "pg_catalog"."default",
  "acct_session_id" varchar(255) COLLATE "pg_catalog"."default",
  "acct_session_time" int8,
  "acct_input_total" int8,
  "acct_output_total" int8,
  "acct_input_packets" int8,
  "acct_output_packets" int8,
  "acct_terminate_cause" int8,
  "last_update" timestamp(6),
  "acct_start_time" timestamp(6),
  "acct_stop_time" timestamp(6)
)
;

-- ----------------------------
-- Table structure for record
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."record" (
  "id" int4 NOT NULL DEFAULT nextval('record_id_seq'::regclass),
  "owner" varchar(100) COLLATE "pg_catalog"."default",
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "organization" varchar(100) COLLATE "pg_catalog"."default",
  "client_ip" varchar(100) COLLATE "pg_catalog"."default",
  "user" varchar(100) COLLATE "pg_catalog"."default",
  "method" varchar(100) COLLATE "pg_catalog"."default",
  "request_uri" varchar(1000) COLLATE "pg_catalog"."default",
  "action" varchar(1000) COLLATE "pg_catalog"."default",
  "language" varchar(100) COLLATE "pg_catalog"."default",
  "object" text COLLATE "pg_catalog"."default",
  "response" text COLLATE "pg_catalog"."default",
  "status_code" int4,
  "is_triggered" bool
)
;

-- ----------------------------
-- Table structure for resource
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."resource" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(180) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "user" varchar(100) COLLATE "pg_catalog"."default",
  "provider" varchar(100) COLLATE "pg_catalog"."default",
  "application" varchar(100) COLLATE "pg_catalog"."default",
  "tag" varchar(100) COLLATE "pg_catalog"."default",
  "parent" varchar(100) COLLATE "pg_catalog"."default",
  "file_name" varchar(255) COLLATE "pg_catalog"."default",
  "file_type" varchar(100) COLLATE "pg_catalog"."default",
  "file_format" varchar(100) COLLATE "pg_catalog"."default",
  "file_size" int4,
  "url" varchar(500) COLLATE "pg_catalog"."default",
  "description" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for role
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."role" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "display_name" varchar(100) COLLATE "pg_catalog"."default",
  "description" varchar(100) COLLATE "pg_catalog"."default",
  "users" text COLLATE "pg_catalog"."default",
  "groups" text COLLATE "pg_catalog"."default",
  "roles" text COLLATE "pg_catalog"."default",
  "domains" text COLLATE "pg_catalog"."default",
  "is_enabled" bool
)
;

-- ----------------------------
-- Table structure for session
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."session" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "application" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "session_id" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for subscription
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."subscription" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "display_name" varchar(100) COLLATE "pg_catalog"."default",
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "description" varchar(100) COLLATE "pg_catalog"."default",
  "user" varchar(100) COLLATE "pg_catalog"."default",
  "pricing" varchar(100) COLLATE "pg_catalog"."default",
  "plan" varchar(100) COLLATE "pg_catalog"."default",
  "payment" varchar(100) COLLATE "pg_catalog"."default",
  "start_time" timestamp(6),
  "end_time" timestamp(6),
  "period" varchar(100) COLLATE "pg_catalog"."default",
  "state" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for syncer
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."syncer" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "organization" varchar(100) COLLATE "pg_catalog"."default",
  "type" varchar(100) COLLATE "pg_catalog"."default",
  "database_type" varchar(100) COLLATE "pg_catalog"."default",
  "ssl_mode" varchar(100) COLLATE "pg_catalog"."default",
  "ssh_type" varchar(100) COLLATE "pg_catalog"."default",
  "host" varchar(100) COLLATE "pg_catalog"."default",
  "port" int4,
  "user" varchar(100) COLLATE "pg_catalog"."default",
  "password" varchar(150) COLLATE "pg_catalog"."default",
  "ssh_host" varchar(100) COLLATE "pg_catalog"."default",
  "ssh_port" int4,
  "ssh_user" varchar(100) COLLATE "pg_catalog"."default",
  "ssh_password" varchar(150) COLLATE "pg_catalog"."default",
  "cert" varchar(100) COLLATE "pg_catalog"."default",
  "database" varchar(100) COLLATE "pg_catalog"."default",
  "table" varchar(100) COLLATE "pg_catalog"."default",
  "table_columns" text COLLATE "pg_catalog"."default",
  "affiliation_table" varchar(100) COLLATE "pg_catalog"."default",
  "avatar_base_url" varchar(100) COLLATE "pg_catalog"."default",
  "error_text" text COLLATE "pg_catalog"."default",
  "sync_interval" int4,
  "is_read_only" bool,
  "is_enabled" bool
)
;

-- ----------------------------
-- Table structure for token
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."token" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "application" varchar(100) COLLATE "pg_catalog"."default",
  "organization" varchar(100) COLLATE "pg_catalog"."default",
  "user" varchar(100) COLLATE "pg_catalog"."default",
  "code" varchar(100) COLLATE "pg_catalog"."default",
  "access_token" text COLLATE "pg_catalog"."default",
  "refresh_token" text COLLATE "pg_catalog"."default",
  "access_token_hash" varchar(100) COLLATE "pg_catalog"."default",
  "refresh_token_hash" varchar(100) COLLATE "pg_catalog"."default",
  "expires_in" int4,
  "scope" varchar(100) COLLATE "pg_catalog"."default",
  "token_type" varchar(100) COLLATE "pg_catalog"."default",
  "code_challenge" varchar(100) COLLATE "pg_catalog"."default",
  "code_is_used" bool,
  "code_expire_in" int8
)
;

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."transaction" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "display_name" varchar(100) COLLATE "pg_catalog"."default",
  "provider" varchar(100) COLLATE "pg_catalog"."default",
  "category" varchar(100) COLLATE "pg_catalog"."default",
  "type" varchar(100) COLLATE "pg_catalog"."default",
  "product_name" varchar(100) COLLATE "pg_catalog"."default",
  "product_display_name" varchar(100) COLLATE "pg_catalog"."default",
  "detail" varchar(255) COLLATE "pg_catalog"."default",
  "tag" varchar(100) COLLATE "pg_catalog"."default",
  "currency" varchar(100) COLLATE "pg_catalog"."default",
  "amount" float8,
  "return_url" varchar(1000) COLLATE "pg_catalog"."default",
  "user" varchar(100) COLLATE "pg_catalog"."default",
  "application" varchar(100) COLLATE "pg_catalog"."default",
  "payment" varchar(100) COLLATE "pg_catalog"."default",
  "state" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for user
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."user" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "updated_time" varchar(100) COLLATE "pg_catalog"."default",
  "deleted_time" varchar(100) COLLATE "pg_catalog"."default",
  "id" varchar(100) COLLATE "pg_catalog"."default",
  "external_id" varchar(100) COLLATE "pg_catalog"."default",
  "universal_id" varchar(100) COLLATE "pg_catalog"."default",
  "type" varchar(100) COLLATE "pg_catalog"."default",
  "password" varchar(150) COLLATE "pg_catalog"."default",
  "password_salt" varchar(100) COLLATE "pg_catalog"."default",
  "password_type" varchar(100) COLLATE "pg_catalog"."default",
  "display_name" varchar(100) COLLATE "pg_catalog"."default",
  "first_name" varchar(100) COLLATE "pg_catalog"."default",
  "last_name" varchar(100) COLLATE "pg_catalog"."default",
  "avatar" varchar(500) COLLATE "pg_catalog"."default",
  "avatar_type" varchar(100) COLLATE "pg_catalog"."default",
  "permanent_avatar" varchar(500) COLLATE "pg_catalog"."default",
  "email" varchar(100) COLLATE "pg_catalog"."default",
  "email_verified" bool,
  "phone" varchar(100) COLLATE "pg_catalog"."default",
  "country_code" varchar(6) COLLATE "pg_catalog"."default",
  "region" varchar(100) COLLATE "pg_catalog"."default",
  "location" varchar(100) COLLATE "pg_catalog"."default",
  "address" text COLLATE "pg_catalog"."default",
  "affiliation" varchar(100) COLLATE "pg_catalog"."default",
  "title" varchar(100) COLLATE "pg_catalog"."default",
  "id_card_type" varchar(100) COLLATE "pg_catalog"."default",
  "id_card" varchar(100) COLLATE "pg_catalog"."default",
  "homepage" varchar(100) COLLATE "pg_catalog"."default",
  "bio" varchar(100) COLLATE "pg_catalog"."default",
  "tag" varchar(100) COLLATE "pg_catalog"."default",
  "language" varchar(100) COLLATE "pg_catalog"."default",
  "gender" varchar(100) COLLATE "pg_catalog"."default",
  "birthday" varchar(100) COLLATE "pg_catalog"."default",
  "education" varchar(100) COLLATE "pg_catalog"."default",
  "score" int4,
  "karma" int4,
  "ranking" int4,
  "balance" float8,
  "currency" varchar(100) COLLATE "pg_catalog"."default",
  "is_default_avatar" bool,
  "is_online" bool,
  "is_admin" bool,
  "is_forbidden" bool,
  "is_deleted" bool,
  "signup_application" varchar(100) COLLATE "pg_catalog"."default",
  "hash" varchar(100) COLLATE "pg_catalog"."default",
  "pre_hash" varchar(100) COLLATE "pg_catalog"."default",
  "access_key" varchar(100) COLLATE "pg_catalog"."default",
  "access_secret" varchar(100) COLLATE "pg_catalog"."default",
  "access_token" text COLLATE "pg_catalog"."default",
  "created_ip" varchar(100) COLLATE "pg_catalog"."default",
  "last_signin_time" varchar(100) COLLATE "pg_catalog"."default",
  "last_signin_ip" varchar(100) COLLATE "pg_catalog"."default",
  "github" varchar(100) COLLATE "pg_catalog"."default",
  "google" varchar(100) COLLATE "pg_catalog"."default",
  "qq" varchar(100) COLLATE "pg_catalog"."default",
  "wechat" varchar(100) COLLATE "pg_catalog"."default",
  "facebook" varchar(100) COLLATE "pg_catalog"."default",
  "dingtalk" varchar(100) COLLATE "pg_catalog"."default",
  "weibo" varchar(100) COLLATE "pg_catalog"."default",
  "gitee" varchar(100) COLLATE "pg_catalog"."default",
  "linkedin" varchar(100) COLLATE "pg_catalog"."default",
  "wecom" varchar(100) COLLATE "pg_catalog"."default",
  "lark" varchar(100) COLLATE "pg_catalog"."default",
  "gitlab" varchar(100) COLLATE "pg_catalog"."default",
  "adfs" varchar(100) COLLATE "pg_catalog"."default",
  "baidu" varchar(100) COLLATE "pg_catalog"."default",
  "alipay" varchar(100) COLLATE "pg_catalog"."default",
  "casdoor" varchar(100) COLLATE "pg_catalog"."default",
  "infoflow" varchar(100) COLLATE "pg_catalog"."default",
  "apple" varchar(100) COLLATE "pg_catalog"."default",
  "azuread" varchar(100) COLLATE "pg_catalog"."default",
  "azureadb2c" varchar(100) COLLATE "pg_catalog"."default",
  "slack" varchar(100) COLLATE "pg_catalog"."default",
  "steam" varchar(100) COLLATE "pg_catalog"."default",
  "bilibili" varchar(100) COLLATE "pg_catalog"."default",
  "okta" varchar(100) COLLATE "pg_catalog"."default",
  "douyin" varchar(100) COLLATE "pg_catalog"."default",
  "kwai" varchar(100) COLLATE "pg_catalog"."default",
  "line" varchar(100) COLLATE "pg_catalog"."default",
  "amazon" varchar(100) COLLATE "pg_catalog"."default",
  "auth0" varchar(100) COLLATE "pg_catalog"."default",
  "battlenet" varchar(100) COLLATE "pg_catalog"."default",
  "bitbucket" varchar(100) COLLATE "pg_catalog"."default",
  "box" varchar(100) COLLATE "pg_catalog"."default",
  "cloudfoundry" varchar(100) COLLATE "pg_catalog"."default",
  "dailymotion" varchar(100) COLLATE "pg_catalog"."default",
  "deezer" varchar(100) COLLATE "pg_catalog"."default",
  "digitalocean" varchar(100) COLLATE "pg_catalog"."default",
  "discord" varchar(100) COLLATE "pg_catalog"."default",
  "dropbox" varchar(100) COLLATE "pg_catalog"."default",
  "eveonline" varchar(100) COLLATE "pg_catalog"."default",
  "fitbit" varchar(100) COLLATE "pg_catalog"."default",
  "gitea" varchar(100) COLLATE "pg_catalog"."default",
  "heroku" varchar(100) COLLATE "pg_catalog"."default",
  "influxcloud" varchar(100) COLLATE "pg_catalog"."default",
  "instagram" varchar(100) COLLATE "pg_catalog"."default",
  "intercom" varchar(100) COLLATE "pg_catalog"."default",
  "kakao" varchar(100) COLLATE "pg_catalog"."default",
  "lastfm" varchar(100) COLLATE "pg_catalog"."default",
  "mailru" varchar(100) COLLATE "pg_catalog"."default",
  "meetup" varchar(100) COLLATE "pg_catalog"."default",
  "microsoftonline" varchar(100) COLLATE "pg_catalog"."default",
  "naver" varchar(100) COLLATE "pg_catalog"."default",
  "nextcloud" varchar(100) COLLATE "pg_catalog"."default",
  "onedrive" varchar(100) COLLATE "pg_catalog"."default",
  "oura" varchar(100) COLLATE "pg_catalog"."default",
  "patreon" varchar(100) COLLATE "pg_catalog"."default",
  "paypal" varchar(100) COLLATE "pg_catalog"."default",
  "salesforce" varchar(100) COLLATE "pg_catalog"."default",
  "shopify" varchar(100) COLLATE "pg_catalog"."default",
  "soundcloud" varchar(100) COLLATE "pg_catalog"."default",
  "spotify" varchar(100) COLLATE "pg_catalog"."default",
  "strava" varchar(100) COLLATE "pg_catalog"."default",
  "stripe" varchar(100) COLLATE "pg_catalog"."default",
  "tiktok" varchar(100) COLLATE "pg_catalog"."default",
  "tumblr" varchar(100) COLLATE "pg_catalog"."default",
  "twitch" varchar(100) COLLATE "pg_catalog"."default",
  "twitter" varchar(100) COLLATE "pg_catalog"."default",
  "typetalk" varchar(100) COLLATE "pg_catalog"."default",
  "uber" varchar(100) COLLATE "pg_catalog"."default",
  "vk" varchar(100) COLLATE "pg_catalog"."default",
  "wepay" varchar(100) COLLATE "pg_catalog"."default",
  "xero" varchar(100) COLLATE "pg_catalog"."default",
  "yahoo" varchar(100) COLLATE "pg_catalog"."default",
  "yammer" varchar(100) COLLATE "pg_catalog"."default",
  "yandex" varchar(100) COLLATE "pg_catalog"."default",
  "zoom" varchar(100) COLLATE "pg_catalog"."default",
  "metamask" varchar(100) COLLATE "pg_catalog"."default",
  "web3onboard" varchar(100) COLLATE "pg_catalog"."default",
  "custom" varchar(100) COLLATE "pg_catalog"."default",
  "webauthnCredentials" bytea,
  "preferred_mfa_type" varchar(100) COLLATE "pg_catalog"."default",
  "recovery_codes" varchar(1000) COLLATE "pg_catalog"."default",
  "totp_secret" varchar(100) COLLATE "pg_catalog"."default",
  "mfa_phone_enabled" bool,
  "mfa_email_enabled" bool,
  "invitation" varchar(100) COLLATE "pg_catalog"."default",
  "invitation_code" varchar(100) COLLATE "pg_catalog"."default",
  "face_ids" text COLLATE "pg_catalog"."default",
  "ldap" varchar(100) COLLATE "pg_catalog"."default",
  "properties" text COLLATE "pg_catalog"."default",
  "roles" text COLLATE "pg_catalog"."default",
  "permissions" text COLLATE "pg_catalog"."default",
  "groups" varchar(1000) COLLATE "pg_catalog"."default",
  "last_change_password_time" varchar(100) COLLATE "pg_catalog"."default",
  "last_signin_wrong_time" varchar(100) COLLATE "pg_catalog"."default",
  "signin_wrong_times" int4,
  "managedAccounts" bytea,
  "mfaAccounts" bytea,
  "need_update_password" bool,
  "ip_whitelist" varchar(200) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for user_identity_binding
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."user_identity_binding" (
  "id" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "universal_id" varchar(100) COLLATE "pg_catalog"."default",
  "auth_type" varchar(50) COLLATE "pg_catalog"."default",
  "auth_value" varchar(255) COLLATE "pg_catalog"."default",
  "created_time" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for verification_record
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."verification_record" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "remote_addr" varchar(100) COLLATE "pg_catalog"."default",
  "type" varchar(10) COLLATE "pg_catalog"."default",
  "user" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "provider" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "receiver" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "time" int8 NOT NULL,
  "is_used" bool NOT NULL
)
;

-- ----------------------------
-- Table structure for webhook
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."webhook" (
  "owner" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" varchar(100) COLLATE "pg_catalog"."default",
  "organization" varchar(100) COLLATE "pg_catalog"."default",
  "url" varchar(200) COLLATE "pg_catalog"."default",
  "method" varchar(100) COLLATE "pg_catalog"."default",
  "content_type" varchar(100) COLLATE "pg_catalog"."default",
  "headers" text COLLATE "pg_catalog"."default",
  "events" varchar(1000) COLLATE "pg_catalog"."default",
  "token_fields" varchar(1000) COLLATE "pg_catalog"."default",
  "object_fields" varchar(1000) COLLATE "pg_catalog"."default",
  "is_user_extended" bool,
  "single_org_only" bool,
  "is_enabled" bool
)
;
