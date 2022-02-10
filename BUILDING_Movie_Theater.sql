
 CREATE TABLE "Customers" (
	"customer_id" serial NOT NULL,
	"first_name" varchar (255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	"customer_age" varchar(255) NOT NULL,
	CONSTRAINT "Customers_pk" PRIMARY KEY ("customer_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Tickets" (
	"ticket_id" serial NOT NULL,
	"movie_id" int NOT NULL,
	"customer" int NOT NULL,
	CONSTRAINT "tickets_pk" PRIMARY KEY ("ticket_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Concessions" (
	"snack_receipt_num" serial NOT NULL,
	"name_of_snack" varchar(255) NOT NULL,
	"customer_id" int NOT NULL,
	CONSTRAINT "concessions_pk" PRIMARY KEY ("snack_receipt_num")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Movies" (
	"movie_id" serial NOT NULL,
	"movie_title" varchar(255) NOT NULL,
	"cost_of_ticket" float4 NOT NULL,
	"duration_in_minutes" int NOT NULL,
	CONSTRAINT "movies_pk" PRIMARY KEY ("movie_id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "public"."Tickets" ADD CONSTRAINT "tickets_fk0" FOREIGN KEY ("movie_id") REFERENCES "public"."Movies"("movie_id");
ALTER TABLE "public"."Tickets" ADD CONSTRAINT "tickets_fk1" FOREIGN KEY ("customer") REFERENCES "public"."Customers"("customer_id");

ALTER TABLE "public"."Concessions" ADD CONSTRAINT "concessions_fk0" FOREIGN KEY ("customer_id") REFERENCES "public"."Customers"("customer_id");




