--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: package_extra; Type: TABLE; Schema: public; Owner: sa; Tablespace: 
--

CREATE TABLE package_extra (
    id text NOT NULL,
    package_id text,
    key text,
    value text,
    revision_id text,
    state text
);


ALTER TABLE public.package_extra OWNER TO sa;

--
-- Name: package_extra_revision; Type: TABLE; Schema: public; Owner: sa; Tablespace: 
--

CREATE TABLE package_extra_revision (
    id text NOT NULL,
    package_id text,
    key text,
    value text,
    revision_id text NOT NULL,
    continuity_id text,
    state text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean
);


ALTER TABLE public.package_extra_revision OWNER TO sa;

--
-- Data for Name: package_extra; Type: TABLE DATA; Schema: public; Owner: sa
--

COPY package_extra (id, package_id, key, value, revision_id, state) FROM stdin;
7472cd2b-29c2-427f-9a3b-510acf84b033	1d18e234-c331-44fb-9b93-32ef20578768	Frequency	Periodic	df356919-df12-489d-8e71-9e0f3bd9e9bd	active
5e2da36b-d196-4266-b67d-199f22c3ac6c	1d18e234-c331-44fb-9b93-32ef20578768	Coverage	South Australia	df356919-df12-489d-8e71-9e0f3bd9e9bd	active
a4c8fca9-e3ce-4c6f-84a6-53e32eece879	1d18e234-c331-44fb-9b93-32ef20578768	Granularity		df356919-df12-489d-8e71-9e0f3bd9e9bd	active
e2ac20a3-56ae-47cb-8128-f4b55c379242	9fb5195b-e696-45bb-a277-866e2efa62d5	Refresh Frequency	Ad Hoc	e47efc64-f751-4f5c-869f-5fe5f0674a95	active
251827e9-5519-40ed-b1f0-a3a700a66b08	35381991-7dc3-42cc-b742-1c8dedc3dfa0	Refresh Frequency		0c343d09-ba2c-4e14-8d7b-3e661e8ad414	active
83ea098f-920c-4451-8a11-38f42a986e19	c471cb83-7e6e-46f2-8b43-ee43acc4df36	Refresh Frequency	Ad Hoc	372e261f-bf49-40df-a5a0-df1a0729470a	active
6cb17dc1-fcb3-4c86-90da-99851e4bb16d	0d2f65f9-4386-4352-b46e-1259ebc06afe	Creation Date	August 2013	94c8f3a6-3dc0-4e50-b633-cbbcd01aaa23	active
3ab3ae8a-81fb-4bd3-a248-24cea8d373f9	0d2f65f9-4386-4352-b46e-1259ebc06afe	Update Frequency	Quarterly	94c8f3a6-3dc0-4e50-b633-cbbcd01aaa23	active
7a8f660a-3ec9-4557-b239-f8ddf2281780	a6b78241-de36-4180-878b-d5d0db01d69a	Data Location	Linked	38674e49-a847-411a-89a0-1de0b134cab8	active
4bcb56cc-bde3-41ff-ae4b-2c15bbef8933	4af43922-62b1-49c7-a3d1-f2381ca52b5d	Refresh Frequency	Weekly	cd99bb4f-dcce-4a97-b794-fb7c2d9c293d	deleted
7e4e2d14-0bc8-4c45-9ca5-baf6be2c6553	4af43922-62b1-49c7-a3d1-f2381ca52b5d	Data Location	Linked	cd99bb4f-dcce-4a97-b794-fb7c2d9c293d	active
026aa469-95c6-4530-bbef-b5420ae460ab	4af43922-62b1-49c7-a3d1-f2381ca52b5d	Updated Frequency	Weekly	cd99bb4f-dcce-4a97-b794-fb7c2d9c293d	active
47464b7b-e4f7-48a1-a5c4-dc0d7e6bef40	0ffa95bd-9345-4dd5-aa22-e91158538743	Refresh Frequency	Weekly	b70ecaa5-9b55-415f-abc8-5beebc9be676	deleted
203c7a7c-aa46-42b2-9eca-f217613f9f88	0ffa95bd-9345-4dd5-aa22-e91158538743	Data Location	Linked	b70ecaa5-9b55-415f-abc8-5beebc9be676	active
891338bb-15d7-4b44-8ae4-76834a36b968	0ffa95bd-9345-4dd5-aa22-e91158538743	Update Frequency	Weekly	b70ecaa5-9b55-415f-abc8-5beebc9be676	active
d616daf1-fd1f-4f77-b1fd-33483780ee19	3d1fc5f0-ce19-4b68-a7cd-191ded177f5e	Refresh Frequency	Yearly	97132c29-5c13-489b-909d-39df23717a04	deleted
4930076c-fa61-4fe7-89e9-df15a992fe32	3d1fc5f0-ce19-4b68-a7cd-191ded177f5e	Data Location	Linked	97132c29-5c13-489b-909d-39df23717a04	active
054a66e2-1578-47d7-a463-7be89f0cda74	3d1fc5f0-ce19-4b68-a7cd-191ded177f5e	Update Frequency	Yearly	97132c29-5c13-489b-909d-39df23717a04	active
780dee7e-d463-4aa7-a659-c0bd19b36ea5	77afe596-b5bb-4a7a-a8f3-f56848b975a8	Data Location	Linked	43f260d7-772d-494a-a2e0-81ccca2f40d4	active
108e446e-b388-40ef-9785-0d366515dd46	a6b78241-de36-4180-878b-d5d0db01d69a	Data Updated	Automatically	158da427-76e0-4854-93f6-a3c5c0a1253a	active
d06de8c4-9263-409c-a52d-851a3014a597	30e275dd-a6f3-4af5-8b8a-6f4919ff6fe7	Data Location	Linked	95c16b18-38db-4810-a2a9-2318151d105d	active
d136e74e-e073-4d06-88b6-387fdd858066	5fb4e6d7-1afe-4f91-a575-f65b451b3c2b	Data Location	Linked	44730bfe-82cc-41ca-8c4f-3ab6dbb00c22	active
8633fd38-7158-4159-b9e8-ac25883ce39e	5fa1cafd-4599-4888-9f70-6a19beb75a4d	Data Location	Linked	481c3f42-337c-4b8d-b1ec-2d0c6fe39289	active
669fce01-f1a2-4c05-9914-a653baec64bd	5fa1cafd-4599-4888-9f70-6a19beb75a4d	Update frequency	Ad Hoc	d1bf1c03-df52-4e37-a5cc-e73d7546fefe	deleted
8a05ac1a-7f16-4ed3-b20d-ee8ba26ae893	5fa1cafd-4599-4888-9f70-6a19beb75a4d	Data updated	9/08/2013	d1bf1c03-df52-4e37-a5cc-e73d7546fefe	active
7235a0e8-d7e6-4ec8-80ba-3122e6060859	5fa1cafd-4599-4888-9f70-6a19beb75a4d	Update Frequency		d1bf1c03-df52-4e37-a5cc-e73d7546fefe	active
9cb9b558-3516-42b3-9b96-1f6026fbc5ab	4e191c1e-b971-441f-83f7-45e266c41b99	Data Location	Linked	0acd6637-7ab9-4dbb-8792-eec19d80c236	active
0c135643-8e12-4907-be71-1625799709e7	6bfd0d67-6abc-43d7-bf87-dea7a0710208	Data Location	Linked	5e786ae5-4371-4e6a-b854-6a756b02abfd	active
93c0e33e-5d45-4197-8e59-23d7ee5479fb	6bfd0d67-6abc-43d7-bf87-dea7a0710208	Data Updated	06/05/2013	5e786ae5-4371-4e6a-b854-6a756b02abfd	active
b0c85845-0de7-4b15-b738-21dd9709a608	30e275dd-a6f3-4af5-8b8a-6f4919ff6fe7	Update Frequency	Weekly Automated	257d96a2-3ee4-41d6-a150-fc266ab5a000	active
68d4be31-1d7c-40a5-b1e3-d6c77e6fd479	30e275dd-a6f3-4af5-8b8a-6f4919ff6fe7	Data updated	Automatically	02bd69cd-2f43-47ca-90ba-c8e1a7ae2b86	deleted
8b4cde7c-ce72-4443-94aa-697652e77925	4497f76a-7b3d-4194-9a08-5f64ab037350	Data Location	Linked	36790488-ad97-41a9-96da-65bf058e7638	active
7e58dc36-713f-4805-9213-77b4da8c5d0a	4497f76a-7b3d-4194-9a08-5f64ab037350	Data Updated	20/08/2013	36790488-ad97-41a9-96da-65bf058e7638	active
47e27d91-398b-48d4-9448-c25a5ec4d22c	ace7352f-6c48-4a07-b846-2a7865791d87	Data Location	Linked	b2a2aeab-4322-4565-92ad-a22d1abdfdb2	active
15ac9bd3-96ec-43f2-98d0-9eef7258c644	ace7352f-6c48-4a07-b846-2a7865791d87	Data Updated	22/03/2013	b2a2aeab-4322-4565-92ad-a22d1abdfdb2	active
8ca4166c-baff-43c6-af87-7e0398c2d73a	a6b78241-de36-4180-878b-d5d0db01d69a	Update Frequency	Ad Hoc	b2e8820c-674b-43ab-a001-eb316f350780	deleted
2e5ab3b2-f2f0-4848-90df-0d1a867eda3b	77afe596-b5bb-4a7a-a8f3-f56848b975a8	Data updated	20/08/2013	43f260d7-772d-494a-a2e0-81ccca2f40d4	active
cb5385b3-bd4e-4902-992f-d1ef2b698791	921d83cc-bf41-48da-9781-07a8af8e3007	Last Updated 	2009	08b7a777-34f9-48ff-94f7-117c81327a5b	deleted
55c7463d-7777-4b55-95e2-203744debccb	868db81d-021c-4aed-994b-403e29afdd43	Refresh Frequency	Ad Hoc	9c9dfbea-1088-4df3-9acd-6d0ba3596415	deleted
e90f6206-c7a8-4626-91c9-c5fefa1a7881	f33c5b36-a450-4755-837c-6e0cf289e20e	Last Updated	2007	12d276d8-8635-4fcc-acae-88a8c78977ed	deleted
4349c3e3-88f5-40da-b70f-540855385e57	6c32ef31-aa23-4377-926b-bb9fa4038f89	Last Updated	2001	4c0aa4b8-c456-4214-b48c-d88ae4da051b	deleted
0214c2c9-7741-44d6-8754-e87bd852b4ca	3666bf95-528f-4cef-a955-1e35a89855a9	Refresh Frequency	Ad Hoc	f1e62db9-3b99-44a4-8c46-9d472b53e169	deleted
0ccede80-b07f-46ed-b5d7-fe93506b5f30	8766ff8d-8883-48fb-9104-948ee31e2c95	Refresh Frequency	Ad Hoc	d85bc1d0-f5bb-49be-b970-24108547de96	deleted
00a28c1f-33b6-45a7-9603-7a0caa8a5d15	4e191c1e-b971-441f-83f7-45e266c41b99	Data updated	Dynamic	85740ec3-4126-4064-beb8-89c9a56bfaf5	active
df303a25-b1c9-4d8d-a1c7-1a384218f589	968c8768-802a-48ed-92d9-eb927fe50c46	Data Location	Linked	38f3b103-2678-48e1-9a5d-13af524bd77f	active
6932c89d-b5e3-4bc9-a4d7-969055f8b262	968c8768-802a-48ed-92d9-eb927fe50c46	Data Updated	20/08/2013	38f3b103-2678-48e1-9a5d-13af524bd77f	active
4e659f44-4a27-4dd0-983e-f4702d97e96f	5fb4e6d7-1afe-4f91-a575-f65b451b3c2b	Update Frequency	Weekly Automated	68b04c6f-85ce-4434-9401-c0e9b22a90e2	active
77e360b1-ee6f-4094-9f59-9ba749677587	5fb4e6d7-1afe-4f91-a575-f65b451b3c2b	Data update	Automatically	68b04c6f-85ce-4434-9401-c0e9b22a90e2	deleted
acb1b04d-d462-407e-9fe3-43a393eeae4f	5fb4e6d7-1afe-4f91-a575-f65b451b3c2b	Data updated	Automatically	68b04c6f-85ce-4434-9401-c0e9b22a90e2	active
5cf42b6a-e027-4a81-90fb-dd7317db1796	4cc17ac3-ce49-4525-971b-6122023b8937	Data Location	Linked	252b15c6-8513-4d9a-9429-bd577a2a5629	active
6cab7d4f-3976-476c-ae3e-da4c513f5f92	5a0381b3-1923-4ad3-b76b-c90e19fa2762	Data Location	Linked	068b11c9-8bc6-4761-8340-9054590256a4	active
ffd4552e-4350-46e0-aa8e-93046d617bfa	5a0381b3-1923-4ad3-b76b-c90e19fa2762	Data updated	20/08/2013	068b11c9-8bc6-4761-8340-9054590256a4	active
2a6f19e0-c1a9-411e-a0df-d18f37c376b4	6459ec32-a165-4de6-9861-1466f910434d	Data Location	Linked	2c9f07ab-bd6f-4cdd-9a58-39b403fadbc5	active
338e45f8-df0b-498c-af90-ef1454b5fdce	6459ec32-a165-4de6-9861-1466f910434d	Data updated	16/05/2013	2c9f07ab-bd6f-4cdd-9a58-39b403fadbc5	active
38865e11-1495-4eda-a9a7-a55beaf0e816	4cc17ac3-ce49-4525-971b-6122023b8937	Data updated	Automatically	6c2c2476-f5c1-49ee-8774-216a58a0f78c	active
3356424d-cf5d-4bb5-b672-e2d3a4fb41ea	e4d3a355-29d7-4bdc-a81d-13fd5ed09ef9	Data Location	Linked	0d6d0890-447a-499a-bcb8-0fdbb8c807db	active
143b4261-1bae-4883-b071-a5bb4fe27d84	e4d3a355-29d7-4bdc-a81d-13fd5ed09ef9	Data updated	19/08/2013	0d6d0890-447a-499a-bcb8-0fdbb8c807db	active
bca9a07d-d3c9-400b-8da7-4287e7bfb683	0ddf2305-c116-4d5d-a197-736122fa67b6	Data Location	Data.sa	f6328176-73a9-41fe-818e-7662166d6e51	active
6edb48f3-5232-43f4-a4e4-28382505951c	0ddf2305-c116-4d5d-a197-736122fa67b6	Data updated	03/09/2013	f6328176-73a9-41fe-818e-7662166d6e51	active
029d71f5-0529-4a5b-ad1b-2f027eb298ae	9b934ea1-856c-4dcc-b2b3-6f4f04a49476	Data Location	Data.sa	80d2eb92-789f-4ab1-b9e7-85a15a2da407	active
fcbcd249-be95-4dc4-ad19-26dfdee5b3a3	9b934ea1-856c-4dcc-b2b3-6f4f04a49476	Data updated	03/09/2013	80d2eb92-789f-4ab1-b9e7-85a15a2da407	active
4b673eca-80cf-4877-aea9-1558a225cfee	cf466291-8740-4b54-ae11-8c98c347f201	Data Location	Data.sa	188c4d62-755d-4e2d-8dce-033fa21ff965	active
4ae054c4-e268-4ede-8042-3da373e955b1	cf466291-8740-4b54-ae11-8c98c347f201	Data updated	03/09/2013	188c4d62-755d-4e2d-8dce-033fa21ff965	active
be2c7434-a710-4b19-a880-311337e4a32c	61d45b48-85bc-4691-968f-3c8d5d23564b	Data Location	Data.sa	a6b3ea52-518b-40ac-bc8d-6acacd5af99e	active
34421b4e-9e51-4681-a2f7-b04a7d1ff415	61d45b48-85bc-4691-968f-3c8d5d23564b	Data updated	03/09/2013	a6b3ea52-518b-40ac-bc8d-6acacd5af99e	active
1a99d2ba-2693-4598-98e7-3a62bc46080a	d002ac71-239c-491a-97c8-6150d10dbdae	Data Location	Linked	c7fd4a7c-5d27-4bbe-bd09-22b9c5f5e86d	active
55e97083-802b-4201-95e8-e12c09627bb3	b667a56a-8959-41bc-a7cc-68e5bc858841	Creation Date	2011	55210322-a2b1-48b6-a0d8-810d02f0ceff	active
add9a100-b245-498b-ac52-606750be7616	b667a56a-8959-41bc-a7cc-68e5bc858841	Update frequency	5 years	55210322-a2b1-48b6-a0d8-810d02f0ceff	active
ba90d0a5-c025-47c8-a299-bd92dbf2dbd1	7b3c68d7-ca6f-46c7-bf81-9f7ee498e740	Update frequency	Automatic	30e34be9-8ff4-4e2b-8f67-29ee6f237d2b	active
fb4df258-dfea-4abb-a6c5-94025cfd3436	7b3c68d7-ca6f-46c7-bf81-9f7ee498e740	Gepspatial Coverage	Adelaide & North Adelaide	30e34be9-8ff4-4e2b-8f67-29ee6f237d2b	active
fe5a7896-11b7-4686-b8b7-12e9640fd65a	7b3c68d7-ca6f-46c7-bf81-9f7ee498e740	Temporal Coverage	Current	30e34be9-8ff4-4e2b-8f67-29ee6f237d2b	active
a1a09752-b285-4d32-ba92-01dd094ec46c	68ce82f9-f1dc-4cb2-9080-e5c5f0cf0eb0	Update Frequency	When new traffic restrictions are submitted	7261832e-1740-48ca-9fa7-30b7d17aa34c	active
e2af28a0-752c-47dc-a026-8ee06c21312b	68ce82f9-f1dc-4cb2-9080-e5c5f0cf0eb0	Data Granularity	Provides location and time information on traffic restrictions	7261832e-1740-48ca-9fa7-30b7d17aa34c	active
60148fb9-ccad-4279-91c2-7b5383a4a85b	68ce82f9-f1dc-4cb2-9080-e5c5f0cf0eb0	Geospatial Coverage	Adelaide and North Adelaide	7261832e-1740-48ca-9fa7-30b7d17aa34c	active
bf1f7c29-f0c9-44ec-ae89-ff64c7fb8793	a43891a8-c765-46cd-84ad-e1c4f6c1c97c	Update Frequency	Annually	f7f717ff-84af-444f-a7be-2ea0ccf88add	active
8aa68d3d-ff5e-44ea-85ec-c5b041491900	a43891a8-c765-46cd-84ad-e1c4f6c1c97c	Data Granularity	Provides toilet data illustrating GPS location and toilet facilities	f7f717ff-84af-444f-a7be-2ea0ccf88add	active
59fae6cb-ffcb-4756-9e19-300221fe671f	a43891a8-c765-46cd-84ad-e1c4f6c1c97c	Geospatial Coverage	Adelaide and North Adelaide	f7f717ff-84af-444f-a7be-2ea0ccf88add	active
c196aa18-5bff-4390-8dd3-f1834269e09c	5f716adc-739e-4050-bb49-76abdadd89b9	Update Frequency	Annually	90383066-e56d-4dbe-83dd-071819d42118	active
6d20aaf1-b03c-4377-a9ce-584e4042e723	5f716adc-739e-4050-bb49-76abdadd89b9	Data Granularity	Provides BBQ data with its GPS coordinate and type of BBQ e.g. Christie 2 plate bbq, green 2 plate bbq. 	90383066-e56d-4dbe-83dd-071819d42118	active
b2236812-9db4-43a8-95c4-82f14c99a6d5	5f716adc-739e-4050-bb49-76abdadd89b9	Geospatial Coverage	Adelaide and North Adelaide	90383066-e56d-4dbe-83dd-071819d42118	active
2a410530-4eb4-4f40-b6fe-8afd023c7361	5f716adc-739e-4050-bb49-76abdadd89b9	Temporal Coverage	Current	90383066-e56d-4dbe-83dd-071819d42118	active
a1747d5f-2c4b-49e2-ba25-ac07e1b954c2	e6e0a010-7074-4776-ad48-b168a1b90b27	Update Frequency	Annually	7f79613f-70c3-4010-ab71-7f47a1a7c801	active
7cedda67-4efb-4f15-bd27-2f092ca9d432	e6e0a010-7074-4776-ad48-b168a1b90b27	Data Granularity	Provides bollards data illustrating GPS location, its material and type.	7f79613f-70c3-4010-ab71-7f47a1a7c801	active
dc3e6f93-b562-4474-a02e-5e51f88c66a9	e6e0a010-7074-4776-ad48-b168a1b90b27	Geospatial Coverage	Adelaide and North Adelaide	7f79613f-70c3-4010-ab71-7f47a1a7c801	active
b2c7587c-92d6-49e0-879e-809427447007	e6e0a010-7074-4776-ad48-b168a1b90b27	Temporal Coverage	Current	7f79613f-70c3-4010-ab71-7f47a1a7c801	active
d52f5e1c-acc0-4161-9fc1-711b246ce5af	32deed74-3050-4b48-acca-64d575f38ab5	Update Frequency	Annually	00247e8b-34d6-4a2c-a2c5-d5d2f83ca087	active
d23c0f24-280e-4554-ba19-12ecfcc7a47e	32deed74-3050-4b48-acca-64d575f38ab5	Data Granularity	Provides bike rack data illustrating GPS location and bike rack type. 	00247e8b-34d6-4a2c-a2c5-d5d2f83ca087	active
61328a81-25f5-476b-ab5a-319af53969ce	32deed74-3050-4b48-acca-64d575f38ab5	Geospatial Coverage	Adelaide and North Adelaide	00247e8b-34d6-4a2c-a2c5-d5d2f83ca087	active
3246103c-306b-4cf5-bc0e-cef10e587161	db944224-9a45-42ce-b657-0aac25f1681f	Geospatial Coverage	South Australia	ece238c2-00d3-46cc-8403-115d30e124a0	active
ce5def70-6ab5-4237-b665-edd4fa69d6dc	ec5b0373-63a2-4193-b095-2dd5b66edf3f	Update Frequency	Reviewed annually	c9c935da-6e8c-467c-8453-ecb4008bc26b	active
de91bf8d-150f-420a-a4f7-70e1094d0a54	60aca0c6-0c84-4bac-8359-d736ad4a67e7	Update Frequency		0b943c0e-388d-4fe4-a2a4-f8d1e516992d	active
71f788c2-6ebc-4d4c-8083-16e7ca9d0e84	ec5b0373-63a2-4193-b095-2dd5b66edf3f	Geospatial Coverage	South Australia	c9c935da-6e8c-467c-8453-ecb4008bc26b	active
5bd88549-9e04-4283-a0b3-8a91ade616e2	bdaa49aa-7d03-4508-8990-ab800db9e232	Update Frequency	Reviewed annually	116e49f6-02c3-47ff-b595-dd011d5d4b3a	active
1f89429b-1004-4524-b03b-16eab2365ab6	bdaa49aa-7d03-4508-8990-ab800db9e232	Geospatial Coverage	South Australia	116e49f6-02c3-47ff-b595-dd011d5d4b3a	active
75b5b68f-c7c4-42a0-b2d9-7cc0e2ba89d1	147ab4cc-60a1-4c49-a213-5a3805551283	Update Frequency	Annually	1b5e7c69-453c-4261-a8ef-d2aa1adeae4e	active
6f4ae398-5f8d-49a7-806e-48a5897ae276	240827d3-a350-4b95-87f9-6e55e1c89fe5	Data Status	N/A	81e07181-b82d-418e-8c12-4bbcaa1a30aa	active
b6c11b03-ff92-4fb8-8cf8-71a7244f487e	240827d3-a350-4b95-87f9-6e55e1c89fe5	Geospatial Coverage	Mount Barker	81e07181-b82d-418e-8c12-4bbcaa1a30aa	active
d8f3e794-b9fb-4bb8-b5fc-d1ceb1053c55	240827d3-a350-4b95-87f9-6e55e1c89fe5	Update Frequency	Annually	81e07181-b82d-418e-8c12-4bbcaa1a30aa	active
7e810d61-1386-4ff1-af08-1375cfdec4d1	147ab4cc-60a1-4c49-a213-5a3805551283	Data Granularity	Defines maximum height of buildings for specific geographical areas updated annually.	1b5e7c69-453c-4261-a8ef-d2aa1adeae4e	active
3a1284d2-181b-4242-8437-b92fb917ca16	147ab4cc-60a1-4c49-a213-5a3805551283	Geospatial Coverage	Adelaide and North Adelaide	1b5e7c69-453c-4261-a8ef-d2aa1adeae4e	active
3da88be0-96c3-4a9c-87c8-83afdd296a27	0f2403fd-a8f9-4d4c-9fb3-8a613c7b4022	Update Frequency	Annually	c5f399ea-dcf1-4139-ae56-03b4af156bfa	active
cbd3892f-ba4c-4d3c-bc5d-67c90f72c41b	0f2403fd-a8f9-4d4c-9fb3-8a613c7b4022	Data Granularity	Shows all the bike and pedestrian paths around the parklands area updated annually.	c5f399ea-dcf1-4139-ae56-03b4af156bfa	active
2b8e2e7a-0a37-4837-92a8-71eea7838757	0f2403fd-a8f9-4d4c-9fb3-8a613c7b4022	Geospatial Coverage	Adelaide & North Adelaide	c5f399ea-dcf1-4139-ae56-03b4af156bfa	active
46fb42ea-93c0-41c0-a863-8d76f1740d4a	a6a7cac5-3016-4525-bf49-b0d33492a466	Update Frequency	Annually	ca605878-99c6-4eb3-9c17-07635813bfb7	active
55308e4a-7444-4669-9525-4b5e07fc43f1	a6a7cac5-3016-4525-bf49-b0d33492a466	Data Granularity	Shows all the bike routes around the Adelaide city Council area along with its length	ca605878-99c6-4eb3-9c17-07635813bfb7	active
0575e567-275c-4351-b0b0-5d5f0350d422	a6a7cac5-3016-4525-bf49-b0d33492a466	Geospatial Coverage	Adelaide and North Adelaide	ca605878-99c6-4eb3-9c17-07635813bfb7	active
92526b68-9687-4943-9597-62351dbdcfaf	6f9688c0-6952-4805-8da8-8e090202c55c	Data Granularity	Employment numbers (part-time & full-time) aggregated down to city survey block level. Land use presented in higher and lower level divisions linking to employment numbers. 	86856cff-f3b5-4ca2-9c9b-3a31ff81bbd2	active
734516f9-0dc6-4d6a-8ff1-cfeb2b781fbe	6f9688c0-6952-4805-8da8-8e090202c55c	Update Frequency	Every two to three years	7554cfa4-c55f-4d7a-aee9-f842772d46fa	active
dd0690a3-86fe-4c2c-b389-96bedb029ada	6f9688c0-6952-4805-8da8-8e090202c55c	Geospatial Coverage	Adelaide and North Adelaide	7554cfa4-c55f-4d7a-aee9-f842772d46fa	active
abe8b9fa-563d-44d2-b7f8-3d166f03e2fe	719c3371-c845-42fd-aa29-24b89f3a150c	Update Frequency	Annually	0ff43e80-0830-4406-aac8-4be99ff22ecc	active
f5234b69-ec1b-4ac5-ab09-daa19bb5e6b0	719c3371-c845-42fd-aa29-24b89f3a150c	Data Granularity	Unit records	0ff43e80-0830-4406-aac8-4be99ff22ecc	active
086f68ab-47be-4f89-9771-67ed1c732874	719c3371-c845-42fd-aa29-24b89f3a150c	Geospatial Coverage	Metropolitan Adelaide	0ff43e80-0830-4406-aac8-4be99ff22ecc	active
d4cc4f44-9f28-4eeb-b190-c56bb2857af3	719c3371-c845-42fd-aa29-24b89f3a150c	Temporal Coverage	1986-2013	0ff43e80-0830-4406-aac8-4be99ff22ecc	active
fde0c610-d45f-4ed8-8f2d-62439d19cfb7	e0752905-814d-4cb6-a0cd-538b66079688	Update Frequency	Annually	b0d28e21-2273-4b95-b01b-fe51f4bc4d75	active
0d670459-5e45-494c-a7ce-964a6beeb091	e0752905-814d-4cb6-a0cd-538b66079688	Data Granularity	Aggregated by Local Health Networks	b0d28e21-2273-4b95-b01b-fe51f4bc4d75	active
190135dd-cb9e-418b-99ee-1f304c515751	e0752905-814d-4cb6-a0cd-538b66079688	Geospatial Coverage	South Australia	b0d28e21-2273-4b95-b01b-fe51f4bc4d75	active
1a187dff-914f-4b69-8dfc-b1c59d3bc046	1f232b6f-4e90-4ebf-9dcd-ad3d84cf2d8d	Update Frequency	Annually	2a003a1c-4169-41fd-9243-a4c96bb82493	active
7ce7d8f9-1c4a-4e1a-bc23-2964e4d96595	1f232b6f-4e90-4ebf-9dcd-ad3d84cf2d8d	Data Granularity	Across the Council	2a003a1c-4169-41fd-9243-a4c96bb82493	active
79ce678e-cc6b-4087-985e-e4102baf7676	1f232b6f-4e90-4ebf-9dcd-ad3d84cf2d8d	Geospatial Coverage	Adelaide & North Adelaide	2a003a1c-4169-41fd-9243-a4c96bb82493	active
876e6d47-cc78-4b48-8ece-531a2ba47a03	bc38db4a-2694-4639-a27f-8aa85eea2f3f	Update Frequency	Annually	77b45465-3bb0-4d5b-b848-51de8ed90bb1	active
54caf632-b1c5-42f9-9a81-00af8470d670	bc38db4a-2694-4639-a27f-8aa85eea2f3f	Data Granularity		77b45465-3bb0-4d5b-b848-51de8ed90bb1	active
4eef1e89-e8a2-4b54-91d8-df72212600d1	bc38db4a-2694-4639-a27f-8aa85eea2f3f	Geospatial Coverage	Adelaide & North Adelaide	77b45465-3bb0-4d5b-b848-51de8ed90bb1	active
eea96de7-0611-4e3d-96db-7637f4c30790	bc38db4a-2694-4639-a27f-8aa85eea2f3f	Temporal Coverage	2011-12	77b45465-3bb0-4d5b-b848-51de8ed90bb1	active
cf782beb-7ad6-4e3a-8ac8-896ee963e4e7	35711273-b0b0-49ab-9d42-f92cc27b0912	Update Frequency	daily	3c13bd11-976e-44bc-806c-accabec179e7	active
3887264a-5303-4d42-8cfa-c62cb30da0e4	35711273-b0b0-49ab-9d42-f92cc27b0912	Data Granularity		3c13bd11-976e-44bc-806c-accabec179e7	active
89238dc3-c30e-44f2-ac08-0fe48c82fa75	35711273-b0b0-49ab-9d42-f92cc27b0912	Geospatial Coverage	Adelaide and North Adelaide	3c13bd11-976e-44bc-806c-accabec179e7	active
36095b33-6d56-4958-8d40-1abfbce2f46e	35711273-b0b0-49ab-9d42-f92cc27b0912	Temporal Coverage		3c13bd11-976e-44bc-806c-accabec179e7	active
b24b493a-ce64-4b8f-88b4-c10600b8f827	f9e4a4f6-6ca6-41b8-805b-f39543590b71	Update Frequency	Annually	3807f120-b017-4883-a349-5cbaab39fdf1	active
124bbca7-517f-4421-a7fc-ccb4d032cfb0	f9e4a4f6-6ca6-41b8-805b-f39543590b71	Geospatial Coverage	Adelaide & North Adelaide	3807f120-b017-4883-a349-5cbaab39fdf1	active
d42a08dc-45ca-4fbe-bf2b-610ea0534b38	f9e4a4f6-6ca6-41b8-805b-f39543590b71	Temporal Coverage	Current	3807f120-b017-4883-a349-5cbaab39fdf1	active
c50b59e0-3470-4755-a912-40bf0c989453	0b10eea8-149d-4719-9702-c45f12630d0a	Update Frequency	As Required	ca62d013-c69e-4d91-9675-e8615da462d3	active
d3378723-8ecb-4cbd-8b88-1f26b73adfba	0b10eea8-149d-4719-9702-c45f12630d0a	Geospatial Coverage	South Australia	ca62d013-c69e-4d91-9675-e8615da462d3	active
e8360c73-82cd-4585-b4cd-f1b87baa6cbd	0b10eea8-149d-4719-9702-c45f12630d0a	Temporal Coverage	2008 to Current	ca62d013-c69e-4d91-9675-e8615da462d3	active
8849d43a-dd8c-4724-8986-d49ed2cd2db1	60aca0c6-0c84-4bac-8359-d736ad4a67e7	Data Granularity	All cancer by gender, age group and year of diagnosis	0b943c0e-388d-4fe4-a2a4-f8d1e516992d	active
4717b9ce-83eb-4f12-b543-53e6beacd118	60aca0c6-0c84-4bac-8359-d736ad4a67e7	Geospatial Coverage	South Australia	0b943c0e-388d-4fe4-a2a4-f8d1e516992d	active
055aaf51-01dc-4d84-bfae-d01a9cc5967c	60aca0c6-0c84-4bac-8359-d736ad4a67e7	Temporal Coverage	1977-2009	0b943c0e-388d-4fe4-a2a4-f8d1e516992d	active
690d7834-e46f-48a6-a737-f9faba3c9219	f93aa37d-dc46-48da-ae65-7d44feb68559	Update Frequency	2 Yearly	1275ec28-72f3-46c7-a3db-2f517dbebec8	active
42ee7853-438f-45a3-b7f7-2922a4e8e295	f93aa37d-dc46-48da-ae65-7d44feb68559	Data Granularity	Statistical Local Area	1275ec28-72f3-46c7-a3db-2f517dbebec8	active
0eaed9ff-6877-4775-841a-79d1930867d9	f93aa37d-dc46-48da-ae65-7d44feb68559	Geospatial Coverage	South Australia	1275ec28-72f3-46c7-a3db-2f517dbebec8	active
b281195a-9b38-46dd-9cec-d8d374ffd6a7	f93aa37d-dc46-48da-ae65-7d44feb68559	Temporal Coverage	2012	1275ec28-72f3-46c7-a3db-2f517dbebec8	active
f63ea495-27d0-4cd1-824b-186f824757f8	e05b4646-3160-47c9-a9b7-817bd31b91fd	Update Frequency	Annually	defdbbd7-c46c-4d89-8463-65f061dc83b9	active
c3c6b795-7076-4491-a307-e14f0b55402f	e05b4646-3160-47c9-a9b7-817bd31b91fd	Data Granularity	GPS location, bin type and features	defdbbd7-c46c-4d89-8463-65f061dc83b9	active
a90155bb-7cac-4743-86de-7d5751700580	e05b4646-3160-47c9-a9b7-817bd31b91fd	Geospatial Coverage	Adelaide & North Adelaide	defdbbd7-c46c-4d89-8463-65f061dc83b9	active
a1131ead-1e2e-4c8a-83a5-ff907f15706c	e05b4646-3160-47c9-a9b7-817bd31b91fd	Temporal Coverage	Current	defdbbd7-c46c-4d89-8463-65f061dc83b9	active
d1564558-736f-41bc-ad9c-de2f32501dce	4c3d4dd6-3221-4678-b14f-bed30c94a47d	Update Frequency	Annually	d083462f-4155-4942-a094-a752ca0c3cb8	active
c7c63571-c633-4234-af48-eb5daca60357	4c3d4dd6-3221-4678-b14f-bed30c94a47d	Data Granularity	GPS location and the monument type	d083462f-4155-4942-a094-a752ca0c3cb8	active
0356c307-479c-4c96-806f-b5fda4885359	4c3d4dd6-3221-4678-b14f-bed30c94a47d	Geospatial Coverage	Adelaide & North Adelaide	d083462f-4155-4942-a094-a752ca0c3cb8	active
c224c626-a5f6-4312-91b0-f81cfbe2bf26	4c3d4dd6-3221-4678-b14f-bed30c94a47d	Temporal Coverage	Current	d083462f-4155-4942-a094-a752ca0c3cb8	active
cb1661de-ec50-487b-9e6a-fe3b473651f3	0cb3b204-41f6-4703-aabf-c8c5adfc08d0	Update Frequency	weekly	0d0ec04f-56cd-4561-bc62-9d3c4d00f5ed	active
a609ca27-11a0-45d3-8a95-239768dfa0e0	0cb3b204-41f6-4703-aabf-c8c5adfc08d0	Data Granularity	All restrictions & controls	0d0ec04f-56cd-4561-bc62-9d3c4d00f5ed	active
14a4cedd-6d94-4337-bc19-775f74e1e06e	0cb3b204-41f6-4703-aabf-c8c5adfc08d0	Geospatial Coverage	Adelaide City Council boundary	0d0ec04f-56cd-4561-bc62-9d3c4d00f5ed	active
29b68d34-8141-4e3c-881e-5fadcc3bf9aa	0cb3b204-41f6-4703-aabf-c8c5adfc08d0	Temporal Coverage	Current	0d0ec04f-56cd-4561-bc62-9d3c4d00f5ed	active
d27dda45-ef39-41ec-acca-ae5098f486e3	f798f4cd-ce0a-4623-bb94-2b81c6bdf52a	Update Frequency	Annually	0101adff-0f13-429f-a876-f5acdf304635	active
62067cf0-8f48-4f8c-a1be-6700058bf97c	f798f4cd-ce0a-4623-bb94-2b81c6bdf52a	Data Granularity	GPS location, monument type and brief descrition	0101adff-0f13-429f-a876-f5acdf304635	active
bb4dd627-292a-4b14-b104-f21ab1359ddd	f798f4cd-ce0a-4623-bb94-2b81c6bdf52a	Geospatial Coverage	Adelaide & North Adelaide	0101adff-0f13-429f-a876-f5acdf304635	active
ce1f4705-ff79-4753-9883-0cc32bf6ed42	f798f4cd-ce0a-4623-bb94-2b81c6bdf52a	Temporal Coverage	Current	0101adff-0f13-429f-a876-f5acdf304635	active
1a875deb-38ee-47cf-93b9-b739d34e33b3	1a36b15d-7f2a-4ef9-8c71-1f1da954da36	Update Frequency	Annually	770e3d02-73b0-42d2-bf99-d2d2bd7fee21	active
75a7fe12-4b63-4c7b-a4c8-1ffea90bfbaf	1a36b15d-7f2a-4ef9-8c71-1f1da954da36	Data Granularity	Provides street tree data illustrating GPS location, circumference, vigour, height, structure, species and common name.	770e3d02-73b0-42d2-bf99-d2d2bd7fee21	active
8e7d775f-8c6a-416f-ad9e-a7b5fd9c02df	1a36b15d-7f2a-4ef9-8c71-1f1da954da36	Geospatial Coverage	Adelaide and North Adelaide	770e3d02-73b0-42d2-bf99-d2d2bd7fee21	active
ae3d7d80-e1c2-40a1-960d-a55a892438a5	1a36b15d-7f2a-4ef9-8c71-1f1da954da36	Temporal Coverage	Current	770e3d02-73b0-42d2-bf99-d2d2bd7fee21	active
00100c48-8df2-4a73-8134-53da5a9de216	2ed254ca-8cd6-4387-ba90-e019d0db3be3	Update Frequency	Annually	747475ec-5905-4eb5-9884-30bb3e4125a6	active
e253e02d-193d-4b6a-8ddd-411390f66b89	2ed254ca-8cd6-4387-ba90-e019d0db3be3	Data Granularity	Illustrates parklands sports facilities with its current park location and a description of the facility e.g. tennis courts, golf courses etc. updated annually.	747475ec-5905-4eb5-9884-30bb3e4125a6	active
919c764b-6250-4787-920e-11eace175f3f	2ed254ca-8cd6-4387-ba90-e019d0db3be3	Geospatial Coverage	Adelaide and North Adelaide	747475ec-5905-4eb5-9884-30bb3e4125a6	active
089e0f9e-d175-493c-b369-d2a49973c9d7	2ed254ca-8cd6-4387-ba90-e019d0db3be3	Temporal Coverage	Current	747475ec-5905-4eb5-9884-30bb3e4125a6	active
787e3331-a039-4bc4-92e4-2fd4c013b5aa	7c92fd11-a2f4-4ca6-b7f2-f23bf123dff9	Update Frequency	Annually	e3a86241-4ea8-43f9-9726-2ada675811cf	active
5b61624f-579b-4836-a5b0-991dd41a7618	7c92fd11-a2f4-4ca6-b7f2-f23bf123dff9	Data Granularity	GPS location, max parking hours, rate per hour, operational time and maximum number of bays	e3a86241-4ea8-43f9-9726-2ada675811cf	active
89f3620c-1f55-407d-9865-a54de45931c7	7c92fd11-a2f4-4ca6-b7f2-f23bf123dff9	Geospatial Coverage	Adelaide & North Adelaide	e3a86241-4ea8-43f9-9726-2ada675811cf	active
4ecbdafe-b012-473c-84cf-84ddfc95259a	7c92fd11-a2f4-4ca6-b7f2-f23bf123dff9	Temporal Coverage	Current	e3a86241-4ea8-43f9-9726-2ada675811cf	active
6526c8ba-6478-42e8-a989-0845fc9e9ee8	e0752905-814d-4cb6-a0cd-538b66079688	Temporal Coverage	2007 - 2012	870b7af1-354a-4746-bcc2-efa7d635d80a	active
66af3330-52f2-49ab-bd6d-e1c8b9312f9d	38361477-6054-4bb4-abde-39f2b3982254	Update Frequency	Annually	31c70799-2062-4142-9f32-ff5c14d2f26c	active
470c6d3a-40d6-4165-ac78-38257f10322f	38361477-6054-4bb4-abde-39f2b3982254	Geospatial Coverage	South Australia	31c70799-2062-4142-9f32-ff5c14d2f26c	active
a98c3802-9eb7-4bbd-87e3-6a5ff5acd9de	38361477-6054-4bb4-abde-39f2b3982254	Temporal Coverage	Current	31c70799-2062-4142-9f32-ff5c14d2f26c	active
fa9da4f3-1524-402b-a513-23defc78be65	3b437900-7c4c-485b-91df-c3daec69b07b	Data Granularity	One snapshot of three images (two side views and top view) taken three times per week per plant. Per plant image analysis results.	6ed5354e-1444-43c4-b78d-3e0548264f51	active
e6a6e668-1908-4a80-bc93-3cd29ea6ef77	3b437900-7c4c-485b-91df-c3daec69b07b	Geospatial Coverage	The Plant Accelerator Southwest Smarthouse, Hartley Grove, Urrbrae, South Australia. Approximately: 34°58'17.3"S 138°38'22.4"E	6ed5354e-1444-43c4-b78d-3e0548264f51	active
4b7317a5-72c7-404b-9f06-c04c15d64681	3b437900-7c4c-485b-91df-c3daec69b07b	Temporal Coverage	27-06-2011 to 27-07-2011	1c551d1a-8742-4ead-aaf9-e30c6c93f815	active
c554a3f4-6746-4e0c-ba69-e845fb56aa41	3b437900-7c4c-485b-91df-c3daec69b07b	Currency	27-07-2011	1c551d1a-8742-4ead-aaf9-e30c6c93f815	active
ef7cbd48-f8da-42fa-90ab-5b53255a55ae	1436651b-0684-42f1-b2e3-7dd113e2c007	Update Frequency	Annually	bed51a95-ded9-4866-8b70-85a13c8e5e50	active
1a62a71d-963f-46e8-8e54-56f2743aa1eb	1436651b-0684-42f1-b2e3-7dd113e2c007	Data Granularity	Individual specimen records.	bed51a95-ded9-4866-8b70-85a13c8e5e50	active
0577a4c1-b24c-4884-92c9-834b4889548d	1436651b-0684-42f1-b2e3-7dd113e2c007	Geospatial Coverage	Primarily whole of Australia, some international records.	bed51a95-ded9-4866-8b70-85a13c8e5e50	active
2e8e80af-6a36-4954-b1cd-9726c00f194f	1436651b-0684-42f1-b2e3-7dd113e2c007	Temporal Coverage	1860-2014	185a195c-ce35-4f0e-a9ed-8d3c678810b0	active
783a0e99-c511-43ea-9852-a1a86dd507a5	fe72a51c-def3-4229-b58c-cf9fef5d30ba	Update Frequency	Annually	594fb77e-ca29-4b21-98aa-73ce77b9362f	active
c47940dd-f1c0-4db1-9b5a-898971e3b68c	fe72a51c-def3-4229-b58c-cf9fef5d30ba	Data Granularity	Individual specimen records.	594fb77e-ca29-4b21-98aa-73ce77b9362f	active
2e4778da-6232-4dff-9cd8-6131669f94d8	fe72a51c-def3-4229-b58c-cf9fef5d30ba	Geospatial Coverage	Primarily whole of Australia, some international records.	594fb77e-ca29-4b21-98aa-73ce77b9362f	active
b95c4a88-6973-4ee2-9d9c-acab9a0b31b2	fe72a51c-def3-4229-b58c-cf9fef5d30ba	Temporal Coverage	1865-2014	594fb77e-ca29-4b21-98aa-73ce77b9362f	active
afe7970c-0765-4a44-9db5-f16d282b1c6e	f47e5aea-fbcc-49b8-b1b3-b48dca31ec79	Update Frequency	Annually	c6ce89bb-d820-4a6f-b4db-4d2bdb68155b	active
6a13c64e-b7c7-45e3-b9a9-ba033551c932	f47e5aea-fbcc-49b8-b1b3-b48dca31ec79	Data Granularity	Individual specimen records	c6ce89bb-d820-4a6f-b4db-4d2bdb68155b	active
7533519d-8df1-4f80-aa66-46bca6c3a913	f47e5aea-fbcc-49b8-b1b3-b48dca31ec79	Geospatial Coverage	Primarily whole of Australia, some international records.	c6ce89bb-d820-4a6f-b4db-4d2bdb68155b	active
fa2645b0-14f4-4727-af24-01b6f9b4f789	f47e5aea-fbcc-49b8-b1b3-b48dca31ec79	Temporal Coverage	1860-2014	c6ce89bb-d820-4a6f-b4db-4d2bdb68155b	active
16abb740-fa67-4008-b946-850ae7f123d8	a81870be-82eb-4868-81e9-0a8d11622675	Update Frequency	Quarterly	6f2a8751-fdde-4987-b5a1-c389922df5fe	active
16dcec4e-1eaa-47a3-bdef-06e9da81fcff	a81870be-82eb-4868-81e9-0a8d11622675	Data Granularity	Individual specimen records	6f2a8751-fdde-4987-b5a1-c389922df5fe	active
b5dba950-de0b-459a-a02a-0dfb248b8acb	a81870be-82eb-4868-81e9-0a8d11622675	Geospatial Coverage	Primarily whole of Australia, some international records.	6f2a8751-fdde-4987-b5a1-c389922df5fe	active
e33a4180-2ea5-4178-a3ca-9cdf1a2caf2f	a81870be-82eb-4868-81e9-0a8d11622675	Temporal Coverage	1860-2014	6f2a8751-fdde-4987-b5a1-c389922df5fe	active
d6492f86-5267-427a-a85f-b0962e26f9d3	a4fbf1a3-bb6f-4b59-860a-3283200e7a90	Update Frequency	Quarterly	f2e0376e-3c3a-4de7-a0f5-0e33cbd53965	active
aa53a9bd-adc5-44cf-9ff7-b66f242a1b64	a4fbf1a3-bb6f-4b59-860a-3283200e7a90	Data Granularity	Individual specimen records	f2e0376e-3c3a-4de7-a0f5-0e33cbd53965	active
6f9c8ce2-f463-4075-9e08-e99a72e1de24	a4fbf1a3-bb6f-4b59-860a-3283200e7a90	Geospatial Coverage	Primarily whole of Australia, some international records	f2e0376e-3c3a-4de7-a0f5-0e33cbd53965	active
e4d9dac0-2be2-4422-91d8-e4088cb2376a	a4fbf1a3-bb6f-4b59-860a-3283200e7a90	Temporal Coverage	1860-2014	f2e0376e-3c3a-4de7-a0f5-0e33cbd53965	active
129ad653-c458-4c39-ad1b-d0999b2e2e86	a09d615c-79f1-4918-9cb4-8c4c636c80eb	Update Frequency	Quarterly	c05ee173-66b2-470d-afed-5ce788e4cf26	active
652c26c1-695c-4b5f-b983-e299accdf7a8	a09d615c-79f1-4918-9cb4-8c4c636c80eb	Data Granularity	Individual specimen records	c05ee173-66b2-470d-afed-5ce788e4cf26	active
5f3b8ca1-b79f-4bbc-b19d-8cf88e73f464	a09d615c-79f1-4918-9cb4-8c4c636c80eb	Geospatial Coverage	Primarily whole of Australia, some international records	c05ee173-66b2-470d-afed-5ce788e4cf26	active
04b5148b-6341-481f-898e-81d83a38b4a0	a09d615c-79f1-4918-9cb4-8c4c636c80eb	Temporal Coverage	1880-2014	c05ee173-66b2-470d-afed-5ce788e4cf26	active
c9c488a8-8f6a-4f04-9024-a6675b4e0a96	35f2b0e5-a207-4114-b2c5-b2f12aa8b8ad	Update Frequency	Quarterly	405396cc-96ea-4f80-b595-9fe11cd7893e	active
66cbfd27-ca8d-480d-bb56-66f79e840434	35f2b0e5-a207-4114-b2c5-b2f12aa8b8ad	Data Granularity	Individual specimen records	405396cc-96ea-4f80-b595-9fe11cd7893e	active
337b955b-5939-4d45-a569-f3b016a22642	35f2b0e5-a207-4114-b2c5-b2f12aa8b8ad	Geospatial Coverage	Primarily whole of Australia, some international records 	405396cc-96ea-4f80-b595-9fe11cd7893e	active
428508fc-a002-4964-974d-5df280dbb2f6	35f2b0e5-a207-4114-b2c5-b2f12aa8b8ad	Temporal Coverage	1880-2014	405396cc-96ea-4f80-b595-9fe11cd7893e	active
0aec2620-7331-4958-b6cb-79b9b6dc446d	e0cc2850-5096-44ec-9602-7b5abfaa2094	Update Frequency	Quarterly	494fda43-f38a-426f-957a-48b587f13b9d	active
f3e0596c-966e-4116-b52f-2a8fc8e52342	e0cc2850-5096-44ec-9602-7b5abfaa2094	Data Granularity	Individual specimen records	494fda43-f38a-426f-957a-48b587f13b9d	active
c750e7ab-7f9c-49d0-8359-b7ad37c07322	e0cc2850-5096-44ec-9602-7b5abfaa2094	Geospatial Coverage	Primarily whole of Australia, some international records (4.4%)	494fda43-f38a-426f-957a-48b587f13b9d	active
96a1c50c-55b1-4f12-a3d4-4d506e690ec4	e0cc2850-5096-44ec-9602-7b5abfaa2094	Temporal Coverage	1880-2014	494fda43-f38a-426f-957a-48b587f13b9d	active
94dafa30-4e44-45c4-be61-43644b4599c0	6553ff25-8b5c-462b-906c-cbfdda54b68b	Update Frequency	Annually	34cc0682-f701-42fd-b1d5-60b22902c30f	active
21046b10-1c00-417c-92d9-583e534131f3	6553ff25-8b5c-462b-906c-cbfdda54b68b	Data Granularity	GPS location and the table type	34cc0682-f701-42fd-b1d5-60b22902c30f	active
30e5393f-0ae7-48c0-b656-e6afb721e03b	6553ff25-8b5c-462b-906c-cbfdda54b68b	Geospatial Coverage	Adelaide & North Adelaide	34cc0682-f701-42fd-b1d5-60b22902c30f	active
9874cc09-cc0e-4018-b59c-d4108aefe030	6553ff25-8b5c-462b-906c-cbfdda54b68b	Temporal Coverage	Current	34cc0682-f701-42fd-b1d5-60b22902c30f	active
ebcef293-581f-42fd-a179-06e6a5e4ad89	50c46577-62c0-4479-aa21-df3fcc3c0aae	Update Frequency	Annually	8faed5f0-b28b-4ae6-ba05-c76082bf0128	active
c929644f-4b6d-4ee6-95c5-2099823b3845	50c46577-62c0-4479-aa21-df3fcc3c0aae	Data Granularity	Shows annual planning and policy zone areas 	8faed5f0-b28b-4ae6-ba05-c76082bf0128	active
d480f918-d5d5-4c5c-aaf9-43d58c8e2d97	50c46577-62c0-4479-aa21-df3fcc3c0aae	Geospatial Coverage	Adelaide & North Adelaide	8faed5f0-b28b-4ae6-ba05-c76082bf0128	active
50f01b21-5872-468e-a341-10996c0ea929	50c46577-62c0-4479-aa21-df3fcc3c0aae	Temporal Coverage	Current	8faed5f0-b28b-4ae6-ba05-c76082bf0128	active
76a74724-3a1c-460b-a27b-c8d4b94827ef	5a9a4f27-0098-48ef-b13d-c321a96e1d23	Update Frequency	Annually	50b9ceb0-a43d-4667-8d2e-cd6389ee02aa	active
70bc13aa-f266-4d39-b167-c7dcf95542ef	5a9a4f27-0098-48ef-b13d-c321a96e1d23	Data Granularity	parklands playground by name	50b9ceb0-a43d-4667-8d2e-cd6389ee02aa	active
94121c5e-c467-4270-9904-c85d72577587	5a9a4f27-0098-48ef-b13d-c321a96e1d23	Geospatial Coverage	Adelaide & North Adelaide	50b9ceb0-a43d-4667-8d2e-cd6389ee02aa	active
c41257d6-7924-4f5b-b9dc-a2d900d5439b	5a9a4f27-0098-48ef-b13d-c321a96e1d23	Temporal Coverage	Current	50b9ceb0-a43d-4667-8d2e-cd6389ee02aa	active
5ccc9469-d056-482c-bd2e-4870926c45bb	d8ceffe5-0528-46ec-8506-970c09325881	Update Frequency	Annually	974389e4-4848-4faf-8e1b-4856ae609588	active
b22b6e5c-bf55-4c2b-8622-69155049b0dc	d8ceffe5-0528-46ec-8506-970c09325881	Data Granularity	information on allotment 	974389e4-4848-4faf-8e1b-4856ae609588	active
2c0485d9-85fa-4b05-b82a-440545f78813	d8ceffe5-0528-46ec-8506-970c09325881	Geospatial Coverage	Adelaide & North Adelaide	974389e4-4848-4faf-8e1b-4856ae609588	active
137781d7-da12-4894-b06d-7e7a76e7e295	d8ceffe5-0528-46ec-8506-970c09325881	Temporal Coverage	Current	974389e4-4848-4faf-8e1b-4856ae609588	active
3eeed9fd-7655-4ddb-8172-e232cd503e21	c29960ca-24a9-47c5-a0cf-aa094f663202	Update Frequency	Annually	7c3ab9f9-f242-46fb-bd17-540aeff9a083	active
857cfde9-4ff4-4d20-8c33-248cf35d3e3c	c29960ca-24a9-47c5-a0cf-aa094f663202	Data Granularity	Illustrates parklands sports facilities with its current park location and a description of the facility e.g. tennis courts, golf courses etc. updated annually.	7c3ab9f9-f242-46fb-bd17-540aeff9a083	active
ccc5aeeb-f9f8-458a-926e-31cd55c71a66	c29960ca-24a9-47c5-a0cf-aa094f663202	Geospatial Coverage	Adelaide and North Adelaide	7c3ab9f9-f242-46fb-bd17-540aeff9a083	active
cbdf62fe-2dc4-4c5c-be4a-dbf961f47cdd	c29960ca-24a9-47c5-a0cf-aa094f663202	Temporal Coverage	Current	7c3ab9f9-f242-46fb-bd17-540aeff9a083	active
61118c29-2fea-414a-bda0-1fa23625dbc2	8aa33af5-4146-447e-b9e9-0c00b616cd38	Update Frequency	Annually	132d0cc1-fdd2-4621-80e6-555e4226da61	active
5093efb7-6c06-4bb9-b33f-118d343cf535	8aa33af5-4146-447e-b9e9-0c00b616cd38	Data Granularity	Provides summary data about the dog, does not include ownership or address details. 	132d0cc1-fdd2-4621-80e6-555e4226da61	active
a923b899-a78e-43ba-ace3-27d378d9296e	8aa33af5-4146-447e-b9e9-0c00b616cd38	Geospatial Coverage	Adelaide and North Adelaide	132d0cc1-fdd2-4621-80e6-555e4226da61	active
62ef3a35-d596-4bca-8293-8437f8fa524c	8aa33af5-4146-447e-b9e9-0c00b616cd38	Temporal Coverage	Current	132d0cc1-fdd2-4621-80e6-555e4226da61	active
00125dbf-61fc-4c4e-be0a-d325beddb78e	0a66175c-e9d4-4513-ad8e-83c0f1b845ef	Update Frequency	Every 2 minutes	1152286a-fe7c-4179-bd1d-c2b8b1bc8232	active
10f37a87-8697-4a02-b04f-3c39dbc57f38	0a66175c-e9d4-4513-ad8e-83c0f1b845ef	Data Granularity	Off street parking data for UPARK car parks showing number of spaces currently available, updated every two minutes.	1152286a-fe7c-4179-bd1d-c2b8b1bc8232	active
338b9f24-42bc-47fb-bb20-37ad7b00abd2	0a66175c-e9d4-4513-ad8e-83c0f1b845ef	Geospatial Coverage	Adelaide City Council Boundary	1152286a-fe7c-4179-bd1d-c2b8b1bc8232	active
d8342b5c-ee87-4c59-b729-90dac15b6766	0a66175c-e9d4-4513-ad8e-83c0f1b845ef	Temporal Coverage	Current	1152286a-fe7c-4179-bd1d-c2b8b1bc8232	active
30a33a23-fc09-4686-98a5-2817af34991c	a3a87b53-3971-4876-95a0-aac2add781af	Update Frequency	Annually	75a18689-6915-47ab-90c7-66fd64e40b89	active
8cb7dc22-8e82-4c97-b0d4-094e540f3f26	a3a87b53-3971-4876-95a0-aac2add781af	Data Granularity	Parklands path route with associated status updated annually.	75a18689-6915-47ab-90c7-66fd64e40b89	active
b1601476-d2b5-42a0-89c1-54b2ef77e35e	a3a87b53-3971-4876-95a0-aac2add781af	Geospatial Coverage	Adelaide and North Adelaide	75a18689-6915-47ab-90c7-66fd64e40b89	active
4fdf9fa4-0b10-4fe2-83eb-02a1e679c4b9	a3a87b53-3971-4876-95a0-aac2add781af	Temporal Coverage	Current	75a18689-6915-47ab-90c7-66fd64e40b89	active
b9d3489d-779f-47b6-8dde-3630275fe49f	b3238d77-5866-434a-8360-fb9a22c001cf	Update Frequency	Annually	76254d03-88b1-4d1a-b9af-b80838769051	active
d5c007f9-8704-41cf-8ca4-f4cec5bbbb35	b3238d77-5866-434a-8360-fb9a22c001cf	Data Granularity	Provides BBQ data with its GPS coordinate and type of BBQ e.g. Christie 2 plate bbq, green 2 plate bbq. 	76254d03-88b1-4d1a-b9af-b80838769051	active
f61a692c-ebd2-4e4e-896f-f898264ef282	b3238d77-5866-434a-8360-fb9a22c001cf	Geospatial Coverage	Adelaide and North Adelaide	76254d03-88b1-4d1a-b9af-b80838769051	active
56aafc39-373d-407a-9112-28f35fc69469	b3238d77-5866-434a-8360-fb9a22c001cf	Temporal Coverage	Current	76254d03-88b1-4d1a-b9af-b80838769051	active
c1cbb2c3-5047-4448-860e-1b2b90c33de8	2f8d50dd-da9f-4c71-b278-8d787c1114fd	Update Frequency	Periodically when historic photos of Adelaide are digitised by Adelaide City Council Archives and added to the collection.  Last updated in May 2014.	ff3e9568-c3de-4bc0-b00e-57fd58621ccc	active
61741fc9-5e40-4696-8f76-f50200130630	2f8d50dd-da9f-4c71-b278-8d787c1114fd	Data Granularity	Contains link to each referenced photo in JPEG format	ff3e9568-c3de-4bc0-b00e-57fd58621ccc	active
5ecc2256-2ed6-4227-9545-91d334e0e55f	2f8d50dd-da9f-4c71-b278-8d787c1114fd	Geospatial Coverage	Adelaide and North Adelaide	ff3e9568-c3de-4bc0-b00e-57fd58621ccc	active
74c58de9-83fb-4803-b50b-d024eb1e9808	2f8d50dd-da9f-4c71-b278-8d787c1114fd	Temporal Coverage	Current	ff3e9568-c3de-4bc0-b00e-57fd58621ccc	active
cf7f4aaf-aa0f-4757-a389-c062bbd90420	4ca19b06-a079-4a21-a452-2b56fba257d7	Update Frequency	Annually	c90dae9d-3fdc-4909-bd5b-c972c7e8a7fe	active
48bb621f-21bc-44ab-9db5-b1a8418efe31	4ca19b06-a079-4a21-a452-2b56fba257d7	Data Granularity	Provides seat data illustrating GPS location and the seat type.	c90dae9d-3fdc-4909-bd5b-c972c7e8a7fe	active
d0b67e10-9b2e-4fac-a921-159806d5263c	4ca19b06-a079-4a21-a452-2b56fba257d7	Geospatial Coverage	Adelaide and North Adelaide	c90dae9d-3fdc-4909-bd5b-c972c7e8a7fe	active
fcad5d99-53c7-4ed1-b0a8-d5a550595889	4ca19b06-a079-4a21-a452-2b56fba257d7	Temporal Coverage	Current	c90dae9d-3fdc-4909-bd5b-c972c7e8a7fe	active
49366298-0050-4d6a-9313-47b9aff3548f	8b6bb491-d9e3-48dc-8230-08a24de1773e	Update Frequency	Annually	5b6baad2-cef9-4d5f-91a5-e952fb9cc8ca	active
e09f8ce9-770b-4831-9d55-1a225a8e5845	8b6bb491-d9e3-48dc-8230-08a24de1773e	Data Granularity	Illustrates parkland parks, its number associated to the parklands pocket guide map and its traditional aboriginal name updated annually.	5b6baad2-cef9-4d5f-91a5-e952fb9cc8ca	active
c8877896-4b10-4de5-b9ad-88b49ccf5aaf	8b6bb491-d9e3-48dc-8230-08a24de1773e	Geospatial Coverage	Adelaide and North Adelaide	5b6baad2-cef9-4d5f-91a5-e952fb9cc8ca	active
ed3b0b41-eb87-4bdc-83c6-0a85cbfaeb9b	8b6bb491-d9e3-48dc-8230-08a24de1773e	Temporal Coverage	Current	5b6baad2-cef9-4d5f-91a5-e952fb9cc8ca	active
0cc0503e-5845-46d7-9d06-373c44ce967f	2b292e74-0e72-421f-be81-a3c7d9438ffa	Update Frequency	Annually	b65da817-4231-487a-bf93-ad617051fc5d	active
d962affb-055e-4fbf-9a64-edd881255de4	2b292e74-0e72-421f-be81-a3c7d9438ffa	Data Granularity		b65da817-4231-487a-bf93-ad617051fc5d	active
b013c17f-4e3d-400c-9c39-e26413f22f04	2b292e74-0e72-421f-be81-a3c7d9438ffa	Geospatial Coverage	South Australia	b65da817-4231-487a-bf93-ad617051fc5d	active
a31b5bb7-4562-4442-a911-23ad46ebf7b8	2b292e74-0e72-421f-be81-a3c7d9438ffa	Temporal Coverage	Current	b65da817-4231-487a-bf93-ad617051fc5d	active
24bb0cd3-d40f-4e9e-b839-e91ea2c7669e	97f60b3e-9b50-4cc2-9960-73288d076c51	Update Frequency	Once off	eab0f98a-0236-4ac4-985f-5a479fa7d4fe	active
4ba73854-0389-4fd0-a462-f2bc26c173f0	97f60b3e-9b50-4cc2-9960-73288d076c51	Data Granularity	N/A	eab0f98a-0236-4ac4-985f-5a479fa7d4fe	active
9f1ff414-2e4a-46e3-a6ea-3661f1f38822	97f60b3e-9b50-4cc2-9960-73288d076c51	Geospatial Coverage	South Australia	eab0f98a-0236-4ac4-985f-5a479fa7d4fe	active
f1757314-9053-4085-b0e2-164d806c4a13	97f60b3e-9b50-4cc2-9960-73288d076c51	Temporal Coverage	1856-1887	eab0f98a-0236-4ac4-985f-5a479fa7d4fe	active
fd434419-1183-46ff-86a6-867bba280a01	54c50844-6653-4704-8dc8-5f5c8f5f14eb	Update Frequency	Once off	c327709b-7717-463c-9727-bbedfb2ff002	active
8c1e7006-4d89-46ce-a17d-2555477bb9db	54c50844-6653-4704-8dc8-5f5c8f5f14eb	Data Granularity	N/A	c327709b-7717-463c-9727-bbedfb2ff002	active
3da99c0b-052f-4d80-bf68-c636644a6ba1	54c50844-6653-4704-8dc8-5f5c8f5f14eb	Geospatial Coverage	South Australia	c327709b-7717-463c-9727-bbedfb2ff002	active
03fc163c-eb7f-4b5d-9c42-0446d1f1fff8	54c50844-6653-4704-8dc8-5f5c8f5f14eb	Temporal Coverage	1850-1920	c327709b-7717-463c-9727-bbedfb2ff002	active
b953d829-e847-4882-979c-af770435da5a	28baf505-4c5f-4e45-9fae-2605ee1cf7c1	Update Frequency	Once off	c46be6e9-edaa-4ec0-b67a-ef4b86072e88	active
a75a166d-e8f3-40e1-bdde-57de2412088a	28baf505-4c5f-4e45-9fae-2605ee1cf7c1	Data Granularity	N/A	c46be6e9-edaa-4ec0-b67a-ef4b86072e88	active
91b29ef5-ea3a-414a-9f95-b1f7f174e26d	28baf505-4c5f-4e45-9fae-2605ee1cf7c1	Geospatial Coverage	South Australia	c46be6e9-edaa-4ec0-b67a-ef4b86072e88	active
acab472d-65c3-4c60-8f9a-bf37a1c89244	28baf505-4c5f-4e45-9fae-2605ee1cf7c1	Temporal Coverage	1865-1902	c46be6e9-edaa-4ec0-b67a-ef4b86072e88	active
dc563b2a-c17b-4793-adea-d24c259f9279	d2633f93-d2e9-4d32-acb8-2c3883db8651	Update Frequency	Once off	295def00-a11d-45b3-a3f0-007988413777	active
f411052e-cbb2-4e4a-a4bc-678b7c77173c	d2633f93-d2e9-4d32-acb8-2c3883db8651	Data Granularity	N/A	295def00-a11d-45b3-a3f0-007988413777	active
edb0e643-00b8-4598-96d2-aed06a21a4d0	d2633f93-d2e9-4d32-acb8-2c3883db8651	Geospatial Coverage	South Australia	295def00-a11d-45b3-a3f0-007988413777	active
f9c60f39-6819-4f13-b67f-c00a3547979d	d2633f93-d2e9-4d32-acb8-2c3883db8651	Temporal Coverage	1879-2012	295def00-a11d-45b3-a3f0-007988413777	active
6c34b1ff-4395-425b-bdb0-448dd9928642	0e4a82b7-b1d9-47d8-8c74-3cb2ac296661	Update Frequency	Annually	2403b251-e6e2-4558-a7db-ed16fbbee40d	active
3680f792-689b-427f-a75a-2dd9d3ffd046	0e4a82b7-b1d9-47d8-8c74-3cb2ac296661	Data Granularity	N/A	2403b251-e6e2-4558-a7db-ed16fbbee40d	active
7a2818dd-4ce5-4204-a11a-33d9284ec805	0e4a82b7-b1d9-47d8-8c74-3cb2ac296661	Geospatial Coverage	South Australia	2403b251-e6e2-4558-a7db-ed16fbbee40d	active
61c986e7-3b1e-4f17-9a91-964876e9b74a	0e4a82b7-b1d9-47d8-8c74-3cb2ac296661	Temporal Coverage	1847-1940	2403b251-e6e2-4558-a7db-ed16fbbee40d	active
20b21f92-32ef-4277-b4a6-50969bb527ed	08119936-12ac-40d9-85ec-75fafcd60156	Last Update	19/11/2013	97fe8786-bbbc-4761-bcc0-669fdab69f38	deleted
c0700840-63ab-4030-bdbc-d01d19afa875	08119936-12ac-40d9-85ec-75fafcd60156	Data Location	Linked	97fe8786-bbbc-4761-bcc0-669fdab69f38	deleted
c950563a-bf22-4609-90ac-51a2718fe188	08119936-12ac-40d9-85ec-75fafcd60156	Update Frequency	Once off	97fe8786-bbbc-4761-bcc0-669fdab69f38	active
7ea00f6f-d3a2-4179-a4e6-21a34a962d7b	08119936-12ac-40d9-85ec-75fafcd60156	Temporal Coverage	1926-1975	97fe8786-bbbc-4761-bcc0-669fdab69f38	active
0271d672-bbb5-41a6-bdcc-8508b46d2751	08119936-12ac-40d9-85ec-75fafcd60156	Data Granularity	N/A	97fe8786-bbbc-4761-bcc0-669fdab69f38	active
66b4194b-a283-4f40-af83-5028a54a04e7	08119936-12ac-40d9-85ec-75fafcd60156	Geospatial Coverage	Australia, England	97fe8786-bbbc-4761-bcc0-669fdab69f38	active
d6423d51-f782-4663-8bc0-75c36866cf2e	dad92d3b-c6cd-4f88-b2ac-2f6aa3ea46e3	Update Frequency	Annually	09725c68-5b25-4632-a891-fee31f33acd1	active
d7af719e-d15a-4e9a-a69e-f141c2afe005	dad92d3b-c6cd-4f88-b2ac-2f6aa3ea46e3	Data Granularity		09725c68-5b25-4632-a891-fee31f33acd1	active
a8ae9f8b-15a0-4806-a68d-300355ef1c59	dad92d3b-c6cd-4f88-b2ac-2f6aa3ea46e3	Geospatial Coverage		09725c68-5b25-4632-a891-fee31f33acd1	active
b82fcdc0-e021-4aa4-8f6f-28ff446c550b	dad92d3b-c6cd-4f88-b2ac-2f6aa3ea46e3	Temporal Coverage	as at 6th June 2014	09725c68-5b25-4632-a891-fee31f33acd1	active
468fc6ff-e40d-4962-88ba-cfd6de817599	f4bb2023-b68f-4868-b0c9-b23a6d69045a	Update Frequency	Ad-hoc	03720d08-3dd3-4b06-8a3f-b5b4e1251c06	active
f7b8412c-64b4-4b6f-b2b7-84707ee7e8ea	f4bb2023-b68f-4868-b0c9-b23a6d69045a	Data Granularity	Regional	03720d08-3dd3-4b06-8a3f-b5b4e1251c06	active
be4e4a8e-6b1d-4faf-92e2-1ee448d7f4a9	f4bb2023-b68f-4868-b0c9-b23a6d69045a	Geospatial Coverage	Australia	03720d08-3dd3-4b06-8a3f-b5b4e1251c06	active
0d16e4ab-c4d8-4a6c-be5a-c6b70e6773fb	f4bb2023-b68f-4868-b0c9-b23a6d69045a	Temporal Coverage	2000 and 2010	03720d08-3dd3-4b06-8a3f-b5b4e1251c06	active
f59dc2e0-316c-4514-a4a4-70afd0241ef4	53e0a256-d7e9-4500-af06-38b84d66abde	Update Frequency	Ad-hoc	524b276f-369c-48c7-8ad6-83ca5069725c	active
15d406a4-9b69-4ca3-8dee-617744614bbb	53e0a256-d7e9-4500-af06-38b84d66abde	Data Granularity	Regional	524b276f-369c-48c7-8ad6-83ca5069725c	active
a17dd506-d1f9-4c24-b9a8-a388daf8a83d	53e0a256-d7e9-4500-af06-38b84d66abde	Geospatial Coverage	Australia	524b276f-369c-48c7-8ad6-83ca5069725c	active
a9adf3b3-f810-4a66-a032-c69dfa29cebf	53e0a256-d7e9-4500-af06-38b84d66abde	Temporal Coverage	1999-2008	524b276f-369c-48c7-8ad6-83ca5069725c	active
4de9d51b-57f6-4d91-b39a-616022913260	4cb3fb7f-67d3-44c8-b08f-3c891d009859	Update Frequency	Ad-hoc	ee9cef4c-eaaf-4cba-97b0-61f0842c00e7	active
1a683138-bd31-4a8f-ae57-befcedefc1dc	4cb3fb7f-67d3-44c8-b08f-3c891d009859	Data Granularity	Country	ee9cef4c-eaaf-4cba-97b0-61f0842c00e7	active
09cb7187-4205-40e8-a24f-fedb0b33ceda	4cb3fb7f-67d3-44c8-b08f-3c891d009859	Geospatial Coverage	Global	ee9cef4c-eaaf-4cba-97b0-61f0842c00e7	active
0207f5b4-2b89-4bea-9886-acdee35f6b48	4cb3fb7f-67d3-44c8-b08f-3c891d009859	Temporal Coverage	1961-2009	ee9cef4c-eaaf-4cba-97b0-61f0842c00e7	active
e83e19cd-c715-488b-a056-bcf3905485e7	b1b64b79-e634-4c79-a52f-1680b3ef5c9c	Update Frequency	Annually	1bf9af93-0675-45de-8ec2-9ebb9a32eb05	active
4ae3c3ad-5f9e-4433-a5b9-5b70ae7a9fe1	b1b64b79-e634-4c79-a52f-1680b3ef5c9c	Data Granularity	Postcode	1bf9af93-0675-45de-8ec2-9ebb9a32eb05	active
d2ae4494-6c56-488e-b1b6-9423f129379d	b1b64b79-e634-4c79-a52f-1680b3ef5c9c	Geospatial Coverage	South Australia	1bf9af93-0675-45de-8ec2-9ebb9a32eb05	active
40665d5b-9571-46af-bfb0-cfe4ae9258b1	b1b64b79-e634-4c79-a52f-1680b3ef5c9c	Temporal Coverage	Current	1bf9af93-0675-45de-8ec2-9ebb9a32eb05	active
5e3fc975-ab6e-4315-8ed8-f32446cb2b6b	f2204ad8-f815-4241-8344-7ce28a7f9906	Update Frequency	Annually	2fa0bb40-55ab-4b9f-8c86-735dffa32cfc	active
c0c4b4ee-8863-415d-8039-2e65f52fade5	f2204ad8-f815-4241-8344-7ce28a7f9906	Data Granularity	Attribute level	2fa0bb40-55ab-4b9f-8c86-735dffa32cfc	active
b99745e1-7e09-4b4d-a6cf-e546cb22004f	f2204ad8-f815-4241-8344-7ce28a7f9906	Geospatial Coverage	South Australia and jurisdictional waters	2fa0bb40-55ab-4b9f-8c86-735dffa32cfc	active
12a12809-71bc-46a6-97c6-03f74be3cf23	f2204ad8-f815-4241-8344-7ce28a7f9906	Temporal Coverage	From 29th November 2007 to Current	2fa0bb40-55ab-4b9f-8c86-735dffa32cfc	active
2566007c-9207-4c9d-8224-dcee213274ec	00468af7-ef81-46f3-9d77-d0cdeae6df62	Update Frequency	Annually	8ce4e6f8-84ea-4dca-8bc5-3330c0d80299	active
26d3c830-9eb0-4523-8014-9d8f877af865	00468af7-ef81-46f3-9d77-d0cdeae6df62	Data Granularity	Attribute level	8ce4e6f8-84ea-4dca-8bc5-3330c0d80299	active
fc2d1854-24ac-404d-9d4e-6980635c073e	00468af7-ef81-46f3-9d77-d0cdeae6df62	Geospatial Coverage	South Australia and jurisdictional waters	8ce4e6f8-84ea-4dca-8bc5-3330c0d80299	active
93f2c940-a754-4afe-90c8-fcf1b49d5b86	00468af7-ef81-46f3-9d77-d0cdeae6df62	Temporal Coverage	From 29th November 2007 to June 2014	8ce4e6f8-84ea-4dca-8bc5-3330c0d80299	active
2b21f0d0-51f9-45cc-8d34-ca0be0b2e895	37c8fd28-8db8-4d4b-8b85-3bdbae7b2f3d	Update Frequency	Daily on the website	f2017c5c-652e-4a8c-b6b4-4c4887851c3a	active
9e6a438a-4b46-41b4-98a6-83ca0c9eefeb	37c8fd28-8db8-4d4b-8b85-3bdbae7b2f3d	Data Granularity		f2017c5c-652e-4a8c-b6b4-4c4887851c3a	active
327ce3d7-a876-484d-9263-48e6403712c7	37c8fd28-8db8-4d4b-8b85-3bdbae7b2f3d	Geospatial Coverage	Mount Gambier or South Australia	f2017c5c-652e-4a8c-b6b4-4c4887851c3a	active
8ae55dac-c832-42aa-81f4-4376ce3034f0	37c8fd28-8db8-4d4b-8b85-3bdbae7b2f3d	Temporal Coverage	Dataset Timespan	f2017c5c-652e-4a8c-b6b4-4c4887851c3a	active
51a9095a-c03a-43f0-968a-9100f96c1ca6	123073c1-5f3c-4f28-a4db-54705a40c7e0	Update Frequency	Daily on the website	f18d41d2-6d46-4363-9f01-b84c9834f3e8	active
443b1bff-509d-4846-95c9-eea0b47ee9f3	123073c1-5f3c-4f28-a4db-54705a40c7e0	Data Granularity	Frequency of water sampling varies between wells	f18d41d2-6d46-4363-9f01-b84c9834f3e8	active
26882d84-0a3f-4247-91f0-505935d50841	123073c1-5f3c-4f28-a4db-54705a40c7e0	Geospatial Coverage	Mount Gambier Local Government Area, South Australia	f18d41d2-6d46-4363-9f01-b84c9834f3e8	active
20ef64fe-1204-486b-acf6-ac1b41316c9a	123073c1-5f3c-4f28-a4db-54705a40c7e0	Temporal Coverage	Various periodic water sampling	f18d41d2-6d46-4363-9f01-b84c9834f3e8	active
776772df-1c60-41cb-89d4-376cff12aa0f	3755e524-fc7b-48ab-a9c1-f9f35a26e315	Update Frequency	Annually	15949eb4-b07a-426b-bf81-feeb19ba96a5	active
22a935c1-cc2f-431b-a5f8-1d196bdf0f61	3755e524-fc7b-48ab-a9c1-f9f35a26e315	Data Granularity	Various periodic monitoring cycles	15949eb4-b07a-426b-bf81-feeb19ba96a5	active
7b04f5a8-8c3e-4cff-a881-34dddac1381f	3755e524-fc7b-48ab-a9c1-f9f35a26e315	Geospatial Coverage	Great Artesian Basin, Far North, South Australia	15949eb4-b07a-426b-bf81-feeb19ba96a5	active
0281d718-3e0e-4582-8329-1a196bf60102	3755e524-fc7b-48ab-a9c1-f9f35a26e315	Temporal Coverage	Well construction to last water chemistry sampling and testing	15949eb4-b07a-426b-bf81-feeb19ba96a5	active
5c6b4995-f230-4133-b0db-a61f3fff5faa	c62d0989-33bd-4423-ac8f-53377891714f	Update Frequency	Recorded hourly; data presented as daily mean on the website	b6507508-835c-4dbc-8c6c-7f92a54bc028	active
0c5ac59d-a8dc-4d99-b27d-a66836c7e99f	c62d0989-33bd-4423-ac8f-53377891714f	Data Granularity		b6507508-835c-4dbc-8c6c-7f92a54bc028	active
1eb1bd02-cb12-46a0-aa36-ccf3e5ee68d3	c62d0989-33bd-4423-ac8f-53377891714f	Geospatial Coverage	Mt Gambier, South Australia	b6507508-835c-4dbc-8c6c-7f92a54bc028	active
9dd5fff2-41cb-4065-ad7d-b56d95285571	c62d0989-33bd-4423-ac8f-53377891714f	Temporal Coverage	Current	b6507508-835c-4dbc-8c6c-7f92a54bc028	active
499312c0-0101-4141-822d-bd3f9b478faa	6c73c59c-0101-4df0-bbdd-d38936bff19a	Update Frequency	Hourly as daily means, on the website	d8a1c36d-7dfe-4d17-b0ff-89fc71492d0c	active
3b8e902c-4735-4c00-874d-a7ea4435a536	6c73c59c-0101-4df0-bbdd-d38936bff19a	Data Granularity	Daily By Location	d8a1c36d-7dfe-4d17-b0ff-89fc71492d0c	active
22d6b3bb-0123-4f20-97a9-89e61c04bc29	6c73c59c-0101-4df0-bbdd-d38936bff19a	Geospatial Coverage	Lock 9 on the River Murray to Wellington, South Australia	d8a1c36d-7dfe-4d17-b0ff-89fc71492d0c	active
10424885-d65b-47a3-b652-768e50361723	6c73c59c-0101-4df0-bbdd-d38936bff19a	Temporal Coverage	365 days to current date	d8a1c36d-7dfe-4d17-b0ff-89fc71492d0c	active
dff9f14c-8ffc-4fd7-bb0d-eba3d34fd16b	c2192907-c5e2-42ec-9cbd-41f6123030d9	Update Frequency	Daily on the website	8eaf4443-79ea-4d98-8d68-b48200588039	active
2e2e22ec-b8e3-42fc-a1e5-ef592ee34fcd	c2192907-c5e2-42ec-9cbd-41f6123030d9	Data Granularity	Frequency of water level readings varies between wells	8eaf4443-79ea-4d98-8d68-b48200588039	active
ba572da0-1558-4e3d-9fa0-eb44edf0594c	c2192907-c5e2-42ec-9cbd-41f6123030d9	Geospatial Coverage	Drawn box from Naracoorte to Millicent, South Australia	8eaf4443-79ea-4d98-8d68-b48200588039	active
2a5ad327-32e2-4526-94b8-899727036321	c2192907-c5e2-42ec-9cbd-41f6123030d9	Temporal Coverage	Various periodic water sampling	8eaf4443-79ea-4d98-8d68-b48200588039	active
295708a1-4e73-4aaa-a7dd-718156b70497	4666f1a7-cde4-40d0-85ef-f7ec2aec7ca9	Update Frequency	Daily on the website	a12c9464-fb4d-4e75-816b-c042b7e3d229	active
000fd0b0-ca5a-4e9e-a495-79d6f9a16234	4666f1a7-cde4-40d0-85ef-f7ec2aec7ca9	Data Granularity	Frequency of water sampling varies between wells	a12c9464-fb4d-4e75-816b-c042b7e3d229	active
55061cd8-b4ac-414e-a446-54b50cacca15	4666f1a7-cde4-40d0-85ef-f7ec2aec7ca9	Geospatial Coverage	Drawn box from Naracoorte to Millicent, South Australia	a12c9464-fb4d-4e75-816b-c042b7e3d229	active
ada19dd9-cf92-44b3-8749-1a11b5b149d4	4666f1a7-cde4-40d0-85ef-f7ec2aec7ca9	Temporal Coverage	Various periodic water sampling	a12c9464-fb4d-4e75-816b-c042b7e3d229	active
9a58b0e8-f354-4cae-afb5-050c9dfcacc0	9afa8373-7fd1-4ad9-86a2-b680476df232	Update Frequency	Hourly on the website	4f635a01-a9cc-41d6-a94d-98483ab918b5	active
4f4a50bb-f7a8-483c-b844-50c6fd0827af	9afa8373-7fd1-4ad9-86a2-b680476df232	Data Granularity	Hourly tidal observations	4f635a01-a9cc-41d6-a94d-98483ab918b5	active
1bd83324-f5a2-4678-ac44-e78d0b9f4cbc	9afa8373-7fd1-4ad9-86a2-b680476df232	Geospatial Coverage	Tauwitchere Barrage, Coorong, South Australia	4f635a01-a9cc-41d6-a94d-98483ab918b5	active
fab396b0-31dc-4b82-a880-8ec167f4ef3c	9afa8373-7fd1-4ad9-86a2-b680476df232	Temporal Coverage	365 days to current date	4f635a01-a9cc-41d6-a94d-98483ab918b5	active
3d77e01a-2018-4739-87ff-9b3a89d7fd34	07b0857c-7d28-4fe5-aed8-146a7cf6b717	Update Frequency	Daily	7ecd33fd-de09-459b-b158-521033fb10f5	active
e156f134-7cbf-4486-b697-97cd0742dcba	07b0857c-7d28-4fe5-aed8-146a7cf6b717	Data Granularity		7ecd33fd-de09-459b-b158-521033fb10f5	active
c3597822-f98a-490d-af64-bb5aa4bf481c	07b0857c-7d28-4fe5-aed8-146a7cf6b717	Geospatial Coverage	South Australia	7ecd33fd-de09-459b-b158-521033fb10f5	active
fb62221a-9ec0-470c-bef7-77522902c8f7	07b0857c-7d28-4fe5-aed8-146a7cf6b717	Temporal Coverage	Current	7ecd33fd-de09-459b-b158-521033fb10f5	active
c2bdd046-f4d1-41bf-b26a-b4b93099dba2	e10d41fb-f1e6-4161-9f9a-f2386d9417bb	Update Frequency	Monthly	4a0b5cd2-8d5b-4044-a97a-9d8d8a51ce47	active
9bb55c1e-7837-4439-988d-2efbd12985b1	e10d41fb-f1e6-4161-9f9a-f2386d9417bb	Data Granularity	Data is typically updated on a catchment, basin or administrative region basis and frequency ranges from annually for high rainfall areas through to five yearly or more for arid regions. 	4a0b5cd2-8d5b-4044-a97a-9d8d8a51ce47	active
9623f98e-7af4-4603-8f19-a2016808d181	e10d41fb-f1e6-4161-9f9a-f2386d9417bb	Geospatial Coverage	South Australia	4a0b5cd2-8d5b-4044-a97a-9d8d8a51ce47	active
da9fa54c-c9e1-421f-9a9d-a210b7b211a8	e10d41fb-f1e6-4161-9f9a-f2386d9417bb	Temporal Coverage	Current	4a0b5cd2-8d5b-4044-a97a-9d8d8a51ce47	active
6ae5ebbb-3480-495d-8d81-f1fec438b589	e0f40ff2-8ba2-43dd-a129-84e7c19e654c	Update Frequency	Monthly	72e94ea0-5f49-4a3b-b3d4-d9079ec80e00	active
2c25676a-ff17-4da9-a34a-c59625a498dc	e0f40ff2-8ba2-43dd-a129-84e7c19e654c	Data Granularity	Data is typically updated on a catchment, basin or administrative region basis and frequency ranges from annually for high rainfall areas through to five yearly or more for arid regions.	72e94ea0-5f49-4a3b-b3d4-d9079ec80e00	active
2d301d13-69f3-41a4-a084-de4136baeb48	e0f40ff2-8ba2-43dd-a129-84e7c19e654c	Geospatial Coverage	South Australia	72e94ea0-5f49-4a3b-b3d4-d9079ec80e00	active
7b567e50-4bc8-4284-b0d6-4062321e5666	e0f40ff2-8ba2-43dd-a129-84e7c19e654c	Temporal Coverage	Current	72e94ea0-5f49-4a3b-b3d4-d9079ec80e00	active
a1d37d96-f460-4c03-b150-2be906fa042e	35381991-7dc3-42cc-b742-1c8dedc3dfa0	Last Update 	December 2011	45a52d25-77ec-4123-90d4-0fdc413e55c8	active
47ea8b8a-61f2-459b-9875-b41cd82c12d8	921d83cc-bf41-48da-9781-07a8af8e3007	Update Frequency		08b7a777-34f9-48ff-94f7-117c81327a5b	active
f824eb22-ca2d-4327-9ff8-ad288d9faf0f	921d83cc-bf41-48da-9781-07a8af8e3007	Temporal Coverage	Current	08b7a777-34f9-48ff-94f7-117c81327a5b	active
7c5332d2-4d68-43a4-bdf2-a43eeef1a99e	f33c5b36-a450-4755-837c-6e0cf289e20e	Update Frequency	Ad-hoc	12d276d8-8635-4fcc-acae-88a8c78977ed	active
804028bd-ee84-41e4-b755-29b302165b2f	6c32ef31-aa23-4377-926b-bb9fa4038f89	Update Frequency	Ad-hoc	4c0aa4b8-c456-4214-b48c-d88ae4da051b	active
3e234bee-39bd-4b02-b8ce-17aaf649f151	3666bf95-528f-4cef-a955-1e35a89855a9	Update Frequency	Ad Hoc	f1e62db9-3b99-44a4-8c46-9d472b53e169	active
624a239f-7978-4152-a2f1-fc6b9e4564eb	978b650a-ba51-48d2-87c2-7ad20892f4ec	Last Updated	May 2011	52931619-548a-4717-8362-edc322d35028	active
4196832e-9e31-4358-bada-4d61449d4751	8766ff8d-8883-48fb-9104-948ee31e2c95	Last Updated	2009	d85bc1d0-f5bb-49be-b970-24108547de96	active
615789c0-f013-4e6f-8c74-915cfac837e6	7cd90f98-1d89-4921-8373-151f4ad5d1a1	Update Frequency	Once off	4b13433c-9629-4927-9e3f-4a7d55c0bbc7	active
9b0dc624-4387-42df-9c9c-c5eec60b9558	7cd90f98-1d89-4921-8373-151f4ad5d1a1	Data Granularity	N/A	4b13433c-9629-4927-9e3f-4a7d55c0bbc7	active
028a3a2a-24fc-4dc2-954d-0112df65658c	7cd90f98-1d89-4921-8373-151f4ad5d1a1	Geospatial Coverage	South Australia	4b13433c-9629-4927-9e3f-4a7d55c0bbc7	active
7c385604-746b-4a31-897c-98125f2c8675	7cd90f98-1d89-4921-8373-151f4ad5d1a1	Temporal Coverage	1836-2010	4b13433c-9629-4927-9e3f-4a7d55c0bbc7	active
3fff4500-a4ba-45ab-a337-287428c784fa	02f2e8e0-f843-4a37-9e0a-eeb4d366991c	Update Frequency	Once off	b225fc1e-096a-4064-b284-51a871f02ca4	active
b3a24af3-9622-4d80-9775-edc5b85079ac	02f2e8e0-f843-4a37-9e0a-eeb4d366991c	Data Granularity	N/A	b225fc1e-096a-4064-b284-51a871f02ca4	active
b4f618a2-4190-4103-bcb4-d8b4a08f6e2b	02f2e8e0-f843-4a37-9e0a-eeb4d366991c	Geospatial Coverage	South Australia	b225fc1e-096a-4064-b284-51a871f02ca4	active
cf1a3d8d-8a41-4502-98f1-c53870b04514	02f2e8e0-f843-4a37-9e0a-eeb4d366991c	Temporal Coverage	1852-1927	b225fc1e-096a-4064-b284-51a871f02ca4	active
72359bc6-0033-4d8e-8562-379afd1bcf97	a3fe22b1-0807-4409-bdab-46dbbad6c300	Update Frequency	Once off	b6b6d390-48d2-475c-b8a1-c50c1772fbaa	active
deefd29e-e60d-4ece-8171-9ed972b9ccf7	a3fe22b1-0807-4409-bdab-46dbbad6c300	Data Granularity	N/A	b6b6d390-48d2-475c-b8a1-c50c1772fbaa	active
3fb7f080-7ccb-4e7c-a510-e2fff4611b97	a3fe22b1-0807-4409-bdab-46dbbad6c300	Geospatial Coverage	South Australia, Egypt, Turkey, Dardanelles, France belgium	b6b6d390-48d2-475c-b8a1-c50c1772fbaa	active
031265f6-7985-4b7a-a5ff-8dfdf7fd6dff	a3fe22b1-0807-4409-bdab-46dbbad6c300	Temporal Coverage	1915-1919	b6b6d390-48d2-475c-b8a1-c50c1772fbaa	active
2e5ba475-3098-4d75-9391-e733f329d8c5	11ed7815-8efa-4e72-a932-aea9f00e3d4f	Update Frequency	Once off	a3266bee-bdda-48d2-98a5-01ed1b497d38	active
6638907e-a46e-4ea4-8c0b-c0b494b1da7c	11ed7815-8efa-4e72-a932-aea9f00e3d4f	Data Granularity	N/A	a3266bee-bdda-48d2-98a5-01ed1b497d38	active
0d4a5ca2-70aa-429d-acd9-f71120f21256	11ed7815-8efa-4e72-a932-aea9f00e3d4f	Geospatial Coverage	South Australia, Egypt, Turkey, Dardanelles, France belgium	a3266bee-bdda-48d2-98a5-01ed1b497d38	active
c4d1c95e-1eed-44c1-9dc2-10dc04c35262	11ed7815-8efa-4e72-a932-aea9f00e3d4f	Temporal Coverage	1915-1919	a3266bee-bdda-48d2-98a5-01ed1b497d38	active
a263556d-ae94-49c9-972e-b107641ffc62	167684de-6a7a-4957-9bb7-b14c26660127	Update Frequency	Once off	108045d3-b7cb-4b45-80bc-3081d22bae03	active
110715a0-ccb1-4387-9512-cca4b259763a	167684de-6a7a-4957-9bb7-b14c26660127	Data Granularity	N/A	108045d3-b7cb-4b45-80bc-3081d22bae03	active
a5b6e9a8-2f24-42f7-bc3b-93bd2d62b677	167684de-6a7a-4957-9bb7-b14c26660127	Geospatial Coverage	South Australia	108045d3-b7cb-4b45-80bc-3081d22bae03	active
17470235-9706-41ab-b69c-dec2c425e39a	167684de-6a7a-4957-9bb7-b14c26660127	Temporal Coverage	1815-1951	108045d3-b7cb-4b45-80bc-3081d22bae03	active
b9c01fa7-c4cc-4b8a-8d9f-1f734c90b5d6	fdb37fa4-83e9-4daf-8ad0-66a63d8c7c88	Update Frequency	Once off	7b803e1c-7772-4f94-95b9-4cdc004673cd	active
1217f24a-6e68-4262-be05-fdb9bfbc66b5	fdb37fa4-83e9-4daf-8ad0-66a63d8c7c88	Data Granularity	N/A	7b803e1c-7772-4f94-95b9-4cdc004673cd	active
ef011169-d9a2-4ec0-9320-3bf8eac51624	fdb37fa4-83e9-4daf-8ad0-66a63d8c7c88	Geospatial Coverage	South Australia	7b803e1c-7772-4f94-95b9-4cdc004673cd	active
5e078d85-36c0-49dc-90f3-10d89e6311df	fdb37fa4-83e9-4daf-8ad0-66a63d8c7c88	Temporal Coverage	1815-1951	7b803e1c-7772-4f94-95b9-4cdc004673cd	active
bca68360-6982-486e-8a50-850c9532d507	70a74bde-2be4-4e1c-92b8-7c2e8be53e20	Update Frequency	Once off	2e703f0b-00bf-4fde-876a-a55e1d19a42c	active
bf8f52b3-28c6-44d1-ab75-3c7ca2b9cb80	70a74bde-2be4-4e1c-92b8-7c2e8be53e20	Data Granularity	N/A	2e703f0b-00bf-4fde-876a-a55e1d19a42c	active
09b7a613-01bb-4653-9246-80683ed89dac	70a74bde-2be4-4e1c-92b8-7c2e8be53e20	Geospatial Coverage	South Australia	2e703f0b-00bf-4fde-876a-a55e1d19a42c	active
c8399417-dd45-4ffb-9cec-ee960447d15d	70a74bde-2be4-4e1c-92b8-7c2e8be53e20	Temporal Coverage	1846-1975	2e703f0b-00bf-4fde-876a-a55e1d19a42c	active
9e0fc6b0-4b0f-4707-a3ad-946b749f41c3	02ae1642-b8cc-4c98-a7d7-6e2c7e1ec7cb	Update Frequency	Once off	1042da93-8381-49f1-a691-14e2f3f40f6a	active
7baceb98-1664-4991-8bb3-39b871ad8ab2	02ae1642-b8cc-4c98-a7d7-6e2c7e1ec7cb	Data Granularity	N/A	1042da93-8381-49f1-a691-14e2f3f40f6a	active
bf2409a6-f72c-4173-9330-cb3ebccd471d	02ae1642-b8cc-4c98-a7d7-6e2c7e1ec7cb	Geospatial Coverage	Murray Bridge	1042da93-8381-49f1-a691-14e2f3f40f6a	active
5f6493f9-f3ef-4ad7-96f3-3d8aeadecbce	02ae1642-b8cc-4c98-a7d7-6e2c7e1ec7cb	Temporal Coverage	1870-1975	1042da93-8381-49f1-a691-14e2f3f40f6a	active
0a165bea-7b46-485b-9496-8dbfd365ef36	2b0e3d83-159f-4118-a7e2-9612367372ed	Update Frequency	Ad-hoc	e8fb61f3-795d-47e3-bca7-f2c9a9a83857	active
e4e94956-0ed5-4c41-a389-9c7acaff23a3	2b0e3d83-159f-4118-a7e2-9612367372ed	Data Granularity	N/A	e8fb61f3-795d-47e3-bca7-f2c9a9a83857	active
916a9ab6-d23f-4c49-82dd-630e24365338	2b0e3d83-159f-4118-a7e2-9612367372ed	Geospatial Coverage	Adelaide	e8fb61f3-795d-47e3-bca7-f2c9a9a83857	active
b4ec17ee-2a2f-47a5-846f-dc1ed00c5c80	2b0e3d83-159f-4118-a7e2-9612367372ed	Temporal Coverage	1846-1966	e8fb61f3-795d-47e3-bca7-f2c9a9a83857	active
e2abb82f-c457-4d6a-891e-a40e82624c71	a8332257-a1db-47f6-a138-930b715f57d4	Update Frequency	Annually	5cd8a610-cfb4-4875-ac2c-19eabacb738c	active
be709483-fce6-4493-b4b7-cb6dfa609e56	a8332257-a1db-47f6-a138-930b715f57d4	Data Granularity	Annual facility data provided to Commonwealth and reviewed by SA EPA	5cd8a610-cfb4-4875-ac2c-19eabacb738c	active
a408e430-5308-47f4-be1b-b1bced18bcb4	a8332257-a1db-47f6-a138-930b715f57d4	Geospatial Coverage	South Australia	5cd8a610-cfb4-4875-ac2c-19eabacb738c	active
3b007100-4559-46d4-b93b-681fd0250726	a8332257-a1db-47f6-a138-930b715f57d4	Temporal Coverage	2012-2013	5cd8a610-cfb4-4875-ac2c-19eabacb738c	active
e270fb0d-f548-42bf-a94f-3b74382f928c	05994de3-25c2-4378-bb0a-62e02097d130	Update Frequency	Annually	4ae6b6f2-106f-4a8b-b365-b50d67a20b95	active
d85501ef-7940-4a5f-86b6-86f4b3b2253b	05994de3-25c2-4378-bb0a-62e02097d130	Data Granularity	AHECC 8 digit trade data	4ae6b6f2-106f-4a8b-b365-b50d67a20b95	active
8821b569-0bfa-4d40-941e-b6363ec245ef	05994de3-25c2-4378-bb0a-62e02097d130	Geospatial Coverage	Australia & South Australia	4ae6b6f2-106f-4a8b-b365-b50d67a20b95	active
2eda0740-bc47-48c4-ab3b-44cb527f6cf5	05994de3-25c2-4378-bb0a-62e02097d130	Temporal Coverage	2012-13	4ae6b6f2-106f-4a8b-b365-b50d67a20b95	active
0dbd2273-e845-4d22-b0a0-24cf17142d5e	c1a77b0e-84df-4ac7-9f4d-bf1f6b92d265	Update Frequency	Annually	7d610700-af7d-4c4d-9009-33ef31086254	active
0f03e4f9-372b-4993-974e-bac52c2d55e9	c1a77b0e-84df-4ac7-9f4d-bf1f6b92d265	Data Granularity	Breakdowns by age, sex and other demographic variables	7d610700-af7d-4c4d-9009-33ef31086254	active
7157f5cc-dae9-42bf-9bea-967df1c637d1	c1a77b0e-84df-4ac7-9f4d-bf1f6b92d265	Geospatial Coverage	State as a whole, and large geographical areas such as Local Health Networks and Medicare Locals	7d610700-af7d-4c4d-9009-33ef31086254	active
d69e8bb9-aae6-4dda-82c8-758fe9a316f8	c1a77b0e-84df-4ac7-9f4d-bf1f6b92d265	Temporal Coverage	2003 to 2013	7d610700-af7d-4c4d-9009-33ef31086254	active
ffb4b92a-78b8-4d3a-8b30-c995984f852d	a9077319-d3b7-4f52-b9b7-04cb786ccca1	Update Frequency	Once off	d0cf0cd3-85cf-408c-adbf-67329b41e112	active
77632ddc-f33e-4c82-816d-f8d82a2ba92f	a9077319-d3b7-4f52-b9b7-04cb786ccca1	Data Granularity	Monthly	d0cf0cd3-85cf-408c-adbf-67329b41e112	active
44321cc9-e708-412f-82e6-2d24e2a76f28	a9077319-d3b7-4f52-b9b7-04cb786ccca1	Geospatial Coverage	N/A	d0cf0cd3-85cf-408c-adbf-67329b41e112	active
9c8c1a0d-a33b-45c8-8cd6-8c5c274a3b91	a9077319-d3b7-4f52-b9b7-04cb786ccca1	Temporal Coverage	2013	d0cf0cd3-85cf-408c-adbf-67329b41e112	active
3ce1e96b-0f27-4403-a797-0e3b2de64fd8	7f64127e-792f-4d33-ba4d-9aa02c451c5a	Update Frequency	Annually	1e983a5f-9549-4917-b27e-9da9727a9581	active
fdec02cc-a4b1-4620-8171-63f57cc41560	7f64127e-792f-4d33-ba4d-9aa02c451c5a	Data Granularity	AHECC 8 digit trade data	1e983a5f-9549-4917-b27e-9da9727a9581	active
58fd8314-7316-44be-8523-b3f81457adcb	7f64127e-792f-4d33-ba4d-9aa02c451c5a	Geospatial Coverage	Australia & South Australia	1e983a5f-9549-4917-b27e-9da9727a9581	active
b42a977d-9394-4d15-9045-977ea447d6b3	063ff486-6828-41f0-a814-0901137d0923	Update Frequency	Annually	9236ea58-f52d-4461-a91e-b240e5e0dc08	active
35b9ba08-8422-4803-be53-0f44d2dd289f	063ff486-6828-41f0-a814-0901137d0923	Data Granularity	AHECC 8 digit trade data	9236ea58-f52d-4461-a91e-b240e5e0dc08	active
9040359c-e9e5-441e-82da-d194a4715163	063ff486-6828-41f0-a814-0901137d0923	Geospatial Coverage	Australia & South Australia	9236ea58-f52d-4461-a91e-b240e5e0dc08	active
ee20d848-aaa7-4464-9bab-b5ab206473e4	063ff486-6828-41f0-a814-0901137d0923	Temporal Coverage	2009-10	9236ea58-f52d-4461-a91e-b240e5e0dc08	active
bfb6ce58-34d6-4681-8d55-2e28dd27c1ef	dc662085-924d-4b6d-8043-8c6327f1caaa	Update Frequency	Annually	57ba1e31-98e4-4aa9-8800-224eb21c53e8	active
2e230867-62c7-4888-81b4-6b7413b8cc55	dc662085-924d-4b6d-8043-8c6327f1caaa	Data Granularity	AHECC 8 digit trade data	57ba1e31-98e4-4aa9-8800-224eb21c53e8	active
4eab1c01-5670-457c-8cf1-a3f062adfe0c	dc662085-924d-4b6d-8043-8c6327f1caaa	Geospatial Coverage	Australia & South Australia	57ba1e31-98e4-4aa9-8800-224eb21c53e8	active
4ee93292-e445-45cd-8475-6a25e95db0d1	dc662085-924d-4b6d-8043-8c6327f1caaa	Temporal Coverage	2010-11	57ba1e31-98e4-4aa9-8800-224eb21c53e8	active
8b0cf2c7-d6df-47da-b8e1-f919a133caa7	f1b1cd4f-4d2d-416b-94d2-9695474f8a44	Update Frequency	Annually	6e299be4-ab7a-4e4f-a2c9-b7ce2604f869	active
e8bb6191-008b-4b80-a5b4-a016e7454ea4	f1b1cd4f-4d2d-416b-94d2-9695474f8a44	Data Granularity	AHECC 8 digit trade data	6e299be4-ab7a-4e4f-a2c9-b7ce2604f869	active
a68778b1-53b2-4c09-a675-c8ee978ae43c	f1b1cd4f-4d2d-416b-94d2-9695474f8a44	Geospatial Coverage	Australia & South Australia	6e299be4-ab7a-4e4f-a2c9-b7ce2604f869	active
394d6e84-6568-4399-b484-9b1dbf45ee23	f1b1cd4f-4d2d-416b-94d2-9695474f8a44	Temporal Coverage	2011-12	6e299be4-ab7a-4e4f-a2c9-b7ce2604f869	active
771df584-99f1-4189-b744-bf8b1ac6425d	7f64127e-792f-4d33-ba4d-9aa02c451c5a	Temporal Coverage	2008-09	ca74a4f1-c185-4693-8586-6533f7ba9634	active
e62b8706-3634-48cc-bebf-fd1a48e0adec	75621bd4-10a8-4dc8-bbd1-0b2ac316615b	Update Frequency	As changed by agreement between the Minister for Education and schools	78706af2-5b43-47bb-96cd-30f33b13fa50	active
9704eb0d-7bf8-4913-ac54-98100eb28cfd	75621bd4-10a8-4dc8-bbd1-0b2ac316615b	Data Granularity		78706af2-5b43-47bb-96cd-30f33b13fa50	active
e8492feb-c8c5-4c33-8126-4cbdb9f0ebd1	75621bd4-10a8-4dc8-bbd1-0b2ac316615b	Geospatial Coverage	South Australia – Projection GDA94	78706af2-5b43-47bb-96cd-30f33b13fa50	active
430d256f-6f46-4eda-adcf-9c9ed32ea6f1	75621bd4-10a8-4dc8-bbd1-0b2ac316615b	Temporal Coverage	Current unless otherwise indicated by the name of the file e.g. 2015, 2014	78706af2-5b43-47bb-96cd-30f33b13fa50	active
fbc56c16-5049-4311-8149-a29fedc9209f	615badd8-2946-4e1a-ae63-92fba8f2ee1e	Update Frequency	Annually	5bd3fb7c-7192-4c35-8ad6-730c7dd40f9c	active
aa10b064-0082-4d31-b6ea-38ffdf6b6568	615badd8-2946-4e1a-ae63-92fba8f2ee1e	Data Granularity	Individual site level	5bd3fb7c-7192-4c35-8ad6-730c7dd40f9c	active
3effc5e9-0cab-44ad-926b-51e6c80043dc	615badd8-2946-4e1a-ae63-92fba8f2ee1e	Geospatial Coverage	South Australia	5bd3fb7c-7192-4c35-8ad6-730c7dd40f9c	active
e948e69c-fc0c-44a4-994b-719cb029497a	615badd8-2946-4e1a-ae63-92fba8f2ee1e	Temporal Coverage	as at 31 March 2014	5bd3fb7c-7192-4c35-8ad6-730c7dd40f9c	active
ae690633-f62a-404e-aae6-737060882892	26c9ae64-e71d-425d-83d3-0a300e8d9430	Update Frequency	Annually	2a73de53-38d8-4d91-8f49-e96866af5b64	active
7da58192-8e8a-4b04-959b-5cefc00d340c	26c9ae64-e71d-425d-83d3-0a300e8d9430	Data Granularity	Data is a snapshot of the First Friday in August each year. 	2a73de53-38d8-4d91-8f49-e96866af5b64	active
3b18e4b4-d3ac-4aec-ae1a-3818a6a3b7fb	26c9ae64-e71d-425d-83d3-0a300e8d9430	Geospatial Coverage	South Australia	2a73de53-38d8-4d91-8f49-e96866af5b64	active
7c80ac19-c940-47a2-8fd4-6cf602b19c31	26c9ae64-e71d-425d-83d3-0a300e8d9430	Temporal Coverage	Friday 2 August, 2013	2a73de53-38d8-4d91-8f49-e96866af5b64	active
c19cf399-b237-431f-adf6-625f290d4b97	6beff3e5-897c-40b4-967a-49e4b6d531d6	Update Frequency	Quarterly	51de0c8a-dfe0-424a-98db-d9e1a9275358	active
3f313e9e-54e4-40a2-aa3f-220f6f497d5e	6beff3e5-897c-40b4-967a-49e4b6d531d6	Data Granularity	Data is collected based on a 2 week reference period	51de0c8a-dfe0-424a-98db-d9e1a9275358	active
e34b5d11-0eb4-4e9c-9e98-526d7c50542b	6beff3e5-897c-40b4-967a-49e4b6d531d6	Geospatial Coverage	South Australia	51de0c8a-dfe0-424a-98db-d9e1a9275358	active
4e677e40-39f2-4bc6-8de7-7d251ee9a681	6beff3e5-897c-40b4-967a-49e4b6d531d6	Temporal Coverage	2013	51de0c8a-dfe0-424a-98db-d9e1a9275358	active
6ee07876-af6a-479e-a9a0-d4e997bb7631	8d65c278-b1e0-44f2-8545-e908681fe2e4	Update Frequency	Annually	415344ab-6b45-4068-a71c-d064f97c0e7c	active
d16a7a76-0506-458b-a996-50742f7f25d7	8d65c278-b1e0-44f2-8545-e908681fe2e4	Data Granularity	10 minute averaged data	415344ab-6b45-4068-a71c-d064f97c0e7c	active
a2d343b3-240b-47ca-a03d-3de7d506dd63	8d65c278-b1e0-44f2-8545-e908681fe2e4	Geospatial Coverage	North western  Adelaide Region	415344ab-6b45-4068-a71c-d064f97c0e7c	active
0eebedcb-45bd-4907-934f-3071d71dbd4d	8d65c278-b1e0-44f2-8545-e908681fe2e4	Temporal Coverage	2013	415344ab-6b45-4068-a71c-d064f97c0e7c	active
df2ca1f9-6fc8-4289-966f-0254bfb4430c	4472c207-358b-4668-b6b9-3f7fd626ae75	Update Frequency	Annually	c18dce26-6766-4d5f-8593-d3c5a29348dd	active
a1569ab5-833e-4967-a7c8-fd48ac127b47	4472c207-358b-4668-b6b9-3f7fd626ae75	Data Granularity	10 minute averaged data	c18dce26-6766-4d5f-8593-d3c5a29348dd	active
a76d01d5-29ff-470b-810e-9990b794aeca	4472c207-358b-4668-b6b9-3f7fd626ae75	Geospatial Coverage	Southern  Adelaide Region	c18dce26-6766-4d5f-8593-d3c5a29348dd	active
55e5d877-b9d0-4178-85b7-9f4be3d94177	4472c207-358b-4668-b6b9-3f7fd626ae75	Temporal Coverage	2013	c18dce26-6766-4d5f-8593-d3c5a29348dd	active
967492b3-8d61-43f7-892e-91daf7054d49	8676857e-b031-4b67-9b86-bc2c92e7f4aa	Update Frequency	Annually	7dd83df2-8106-4eab-b26a-c68f0d6216c9	active
df53309f-3229-45a9-bc68-88354e3a6a33	8676857e-b031-4b67-9b86-bc2c92e7f4aa	Data Granularity	10 minute averaged data	7dd83df2-8106-4eab-b26a-c68f0d6216c9	active
b080dd50-1dae-4f56-b4d3-5a7c0ef98e4e	8676857e-b031-4b67-9b86-bc2c92e7f4aa	Geospatial Coverage	Southern  Adelaide Region	7dd83df2-8106-4eab-b26a-c68f0d6216c9	active
99825fee-44a1-4271-8a2d-335cd4e3b609	8676857e-b031-4b67-9b86-bc2c92e7f4aa	Temporal Coverage	2013	7dd83df2-8106-4eab-b26a-c68f0d6216c9	active
2210b153-703c-4700-abe4-2bb50415cf64	1deb4bec-b83c-487a-a0d4-a0002e618068	Update Frequency	Annually	291eb0b8-be1b-4311-b4b1-c4095ff8b153	active
cf9dec95-83f0-4520-bbe4-c6f5de2e94e4	1deb4bec-b83c-487a-a0d4-a0002e618068	Data Granularity	10 minute averaged data	291eb0b8-be1b-4311-b4b1-c4095ff8b153	active
03f8c99f-aca2-4960-80f5-2fccdf1a570f	1deb4bec-b83c-487a-a0d4-a0002e618068	Geospatial Coverage	Northern Adelaide Region	291eb0b8-be1b-4311-b4b1-c4095ff8b153	active
eec8ce4b-5581-4890-98ff-99947ff6965b	1deb4bec-b83c-487a-a0d4-a0002e618068	Temporal Coverage	2013	291eb0b8-be1b-4311-b4b1-c4095ff8b153	active
930d385b-945d-4305-bf06-5c4d2987be36	57f10148-cf98-47e0-9ed6-405c9d29545d	Data Location	Hosted	e6a48e8d-f122-4ceb-b33c-002c01e9a13f	active
2304c08f-0510-406b-8d66-2d6c64ce6a7e	57f10148-cf98-47e0-9ed6-405c9d29545d	Update Frequency	Annually	e6a48e8d-f122-4ceb-b33c-002c01e9a13f	active
976b2242-c86b-4ef6-b90e-b09bc4de05d4	57f10148-cf98-47e0-9ed6-405c9d29545d	Data Granularity	10 minute averaged data	e6a48e8d-f122-4ceb-b33c-002c01e9a13f	active
303f88d1-30f4-4a1f-a93f-8c59ecc13846	57f10148-cf98-47e0-9ed6-405c9d29545d	Geospatial Coverage	Northern Adelaide Region	e6a48e8d-f122-4ceb-b33c-002c01e9a13f	active
5b9a0cd9-d444-4d93-82c1-a3d7f7f35f61	57f10148-cf98-47e0-9ed6-405c9d29545d	Temporal Coverage	2013	e6a48e8d-f122-4ceb-b33c-002c01e9a13f	active
00d806e8-34a1-448d-b50a-120006edb12d	6ecc169e-f81b-4b23-9f82-d1782e92693b	Data Location	Hosted	11525995-90e8-4604-8535-bbb07f6b0887	active
46b31069-507d-4436-842d-e215a78e0049	6ecc169e-f81b-4b23-9f82-d1782e92693b	Update Frequency	Annually	11525995-90e8-4604-8535-bbb07f6b0887	active
680cf6ca-fae6-4f25-94d4-b1a30dfc1117	6ecc169e-f81b-4b23-9f82-d1782e92693b	Data Granularity	10 minute averaged data	11525995-90e8-4604-8535-bbb07f6b0887	active
71865cbc-c6d5-4664-b16d-8fcbe803e696	6ecc169e-f81b-4b23-9f82-d1782e92693b	Geospatial Coverage	Eastern Adelaide Region	11525995-90e8-4604-8535-bbb07f6b0887	active
4de2c25d-7f93-4d7e-a12a-efb5698980ea	6ecc169e-f81b-4b23-9f82-d1782e92693b	Temporal Coverage	2013	11525995-90e8-4604-8535-bbb07f6b0887	active
a447f83f-639b-4bf6-b5a6-fc00407f8b32	3ba1c4dd-e52f-4c28-858a-21284c3ee458	Data Location	Hosted	85096f9c-9b6c-4bed-abce-7bd8e2b72007	active
d8ae41b2-4a94-4a70-9551-dd76ec433fa0	3ba1c4dd-e52f-4c28-858a-21284c3ee458	Update Frequency	Annually	85096f9c-9b6c-4bed-abce-7bd8e2b72007	active
2f863d9d-205c-4ebf-b9f7-3232afbede9f	3ba1c4dd-e52f-4c28-858a-21284c3ee458	Data Granularity	10 minute averaged data	85096f9c-9b6c-4bed-abce-7bd8e2b72007	active
eb756281-2d87-4ed2-9785-d537059cf424	3ba1c4dd-e52f-4c28-858a-21284c3ee458	Geospatial Coverage	Eastern Adelaide Region	85096f9c-9b6c-4bed-abce-7bd8e2b72007	active
0d2a66a4-a460-4238-99eb-9f2062390d44	3ba1c4dd-e52f-4c28-858a-21284c3ee458	Temporal Coverage	2013	85096f9c-9b6c-4bed-abce-7bd8e2b72007	active
b7808a02-6402-40d0-a9e5-7bf859938251	29f1664d-5911-49f5-b0bb-272d9eef9c32	Data Location	Hosted	5b102c10-1d2b-47b0-acf7-b7104128f9aa	active
5332641a-aac6-4a23-bb5d-4f626d288e3a	29f1664d-5911-49f5-b0bb-272d9eef9c32	Update Frequency	Annually	5b102c10-1d2b-47b0-acf7-b7104128f9aa	active
b13cd442-e88c-4b8e-b954-f18ee8f57bd4	29f1664d-5911-49f5-b0bb-272d9eef9c32	Data Granularity	10 minute averaged data	5b102c10-1d2b-47b0-acf7-b7104128f9aa	active
14fb484b-3334-480d-9eb6-304e25d7e789	29f1664d-5911-49f5-b0bb-272d9eef9c32	Geospatial Coverage	Western Adelaide Region	5b102c10-1d2b-47b0-acf7-b7104128f9aa	active
515f783d-aa32-4312-9f2d-1e202d3bd861	29f1664d-5911-49f5-b0bb-272d9eef9c32	Temporal Coverage	2013	5b102c10-1d2b-47b0-acf7-b7104128f9aa	active
61653ad4-c747-4ea0-ba0c-43087e8524d8	b46ea120-ed9c-484e-9473-bb5cbe8fd1c8	Data Location	Hosted	87b750ea-b196-47f4-a2da-adf811b6db96	active
5810daf6-14e8-45ea-b740-415f918999ad	b46ea120-ed9c-484e-9473-bb5cbe8fd1c8	Update Frequency	Annually	87b750ea-b196-47f4-a2da-adf811b6db96	active
482cff31-4aab-40b2-9554-aad78dbf9305	b46ea120-ed9c-484e-9473-bb5cbe8fd1c8	Data Granularity	10 minute averaged data	87b750ea-b196-47f4-a2da-adf811b6db96	active
536eba95-d865-4881-827d-efd8b1f73fe1	b46ea120-ed9c-484e-9473-bb5cbe8fd1c8	Geospatial Coverage	Western Adelaide Region	87b750ea-b196-47f4-a2da-adf811b6db96	active
db9f2b98-cbd7-4c45-b3e7-4d82851baafe	b46ea120-ed9c-484e-9473-bb5cbe8fd1c8	Temporal Coverage	2013	87b750ea-b196-47f4-a2da-adf811b6db96	active
4bbff93f-153a-48f4-a6da-f970917603c3	999c056f-e04a-444b-95dc-329d7d10dc46	Data Location	Hosted	8eb57ce0-0048-4877-adfd-1f6c22fe0621	active
9d33f46a-6a23-4b1f-b3ff-f1cadf740b1e	999c056f-e04a-444b-95dc-329d7d10dc46	Update Frequency	Annually	8eb57ce0-0048-4877-adfd-1f6c22fe0621	active
d3526117-e2fa-42bf-b7ef-c66d680b2d91	999c056f-e04a-444b-95dc-329d7d10dc46	Data Granularity	10 minute averaged data	8eb57ce0-0048-4877-adfd-1f6c22fe0621	active
e9c3a277-341e-4817-873e-9f27ace7010e	999c056f-e04a-444b-95dc-329d7d10dc46	Geospatial Coverage	North Western Adelaide Region	8eb57ce0-0048-4877-adfd-1f6c22fe0621	active
d009d98e-482e-4e03-810e-f084ca5f38cb	999c056f-e04a-444b-95dc-329d7d10dc46	Temporal Coverage	2013	8eb57ce0-0048-4877-adfd-1f6c22fe0621	active
94aa64b1-9af8-4f28-8975-1de1fabf7d0a	5a8050ca-da03-4ab4-b174-52fde6b33d01	Data Location	Hosted	5f239a0c-f540-4eb9-8473-647a181cbb4a	active
b275f942-92fb-4d91-b6cf-57344b71946e	5a8050ca-da03-4ab4-b174-52fde6b33d01	Update Frequency	Annually	5f239a0c-f540-4eb9-8473-647a181cbb4a	active
8648107a-f226-4bd3-a4d5-411925e89c3a	5a8050ca-da03-4ab4-b174-52fde6b33d01	Data Granularity	10 minute averaged data	5f239a0c-f540-4eb9-8473-647a181cbb4a	active
37e5ab9f-04b2-487d-a0dc-bb19410415c8	5a8050ca-da03-4ab4-b174-52fde6b33d01	Geospatial Coverage	North western  Adelaide Region	5f239a0c-f540-4eb9-8473-647a181cbb4a	active
354ecffc-1f56-4d93-9d75-fe4c60068eb3	5a8050ca-da03-4ab4-b174-52fde6b33d01	Temporal Coverage	2013	5f239a0c-f540-4eb9-8473-647a181cbb4a	active
9a86760c-421d-4856-83f5-94d2fc98b38c	13cad712-44e6-4b6e-82f7-7260619bb061	Data Location	Hosted	fcc913f9-a02e-4768-b107-8808c92bab95	active
34b6114f-60a4-46a3-8a3a-4a6c410821ca	13cad712-44e6-4b6e-82f7-7260619bb061	Update Frequency	Annually	fcc913f9-a02e-4768-b107-8808c92bab95	active
e34d9b91-c05d-4f28-912b-644c696a7ed5	13cad712-44e6-4b6e-82f7-7260619bb061	Data Granularity	10 minute averaged data	fcc913f9-a02e-4768-b107-8808c92bab95	active
10073886-f4b4-47f9-965e-28c17ea4d2d7	13cad712-44e6-4b6e-82f7-7260619bb061	Geospatial Coverage	North Eastern Adelaide Region	fcc913f9-a02e-4768-b107-8808c92bab95	active
95f79d38-fb0a-4749-abcf-32104498ec39	13cad712-44e6-4b6e-82f7-7260619bb061	Temporal Coverage	2013	fcc913f9-a02e-4768-b107-8808c92bab95	active
690b02b1-84bb-4f12-9d9f-2832cc663038	23ee994a-4d9e-4d40-bdd0-6bf4c949c0ee	Data Location	Hosted	e887c389-33d4-45db-ba93-3c55b0f35171	active
4f90e658-1419-4a7c-be87-52c49fefe39f	23ee994a-4d9e-4d40-bdd0-6bf4c949c0ee	Update Frequency	Annually	e887c389-33d4-45db-ba93-3c55b0f35171	active
3f2954be-05a7-40dc-bc7c-10cfeff6bd99	23ee994a-4d9e-4d40-bdd0-6bf4c949c0ee	Data Granularity	10 minute averaged data	e887c389-33d4-45db-ba93-3c55b0f35171	active
23d256eb-8fac-45d0-8042-d9c75d842d25	23ee994a-4d9e-4d40-bdd0-6bf4c949c0ee	Geospatial Coverage	Spencer Gulf Region	e887c389-33d4-45db-ba93-3c55b0f35171	active
e45d290c-372b-4872-923c-bea4e642dc77	23ee994a-4d9e-4d40-bdd0-6bf4c949c0ee	Temporal Coverage	2013	e887c389-33d4-45db-ba93-3c55b0f35171	active
c6482c07-9b0d-4848-ab55-f1f8f9512d31	d618faaa-c14c-4014-afde-5929b0a96eef	Data Location	Hosted	57c9f810-0ce8-4317-8e68-8147da4783c0	active
edfc2152-1195-4b3d-a4c9-91ad1229075d	d618faaa-c14c-4014-afde-5929b0a96eef	Update Frequency	Annually	57c9f810-0ce8-4317-8e68-8147da4783c0	active
6b40ef71-88d3-4a5e-b2c9-8c2c25b7bdc1	d618faaa-c14c-4014-afde-5929b0a96eef	Data Granularity	10 minute averaged data	57c9f810-0ce8-4317-8e68-8147da4783c0	active
0d256823-49ea-4ffe-84cd-b9a1d268304d	d618faaa-c14c-4014-afde-5929b0a96eef	Geospatial Coverage	Spencer Gulf Region	57c9f810-0ce8-4317-8e68-8147da4783c0	active
d7f093e0-466d-43c7-afee-9428bbb59583	d618faaa-c14c-4014-afde-5929b0a96eef	Temporal Coverage	2013	57c9f810-0ce8-4317-8e68-8147da4783c0	active
9a25f52a-2a63-4e2d-8842-cf2d5237c672	0c085f98-5cc4-41f0-9eb9-5be42df73cdb	Data Location	Hosted	5c259e90-bff5-477d-af6e-083ee44adcc4	active
0d66c034-0220-4023-a521-2bdfb1417064	0c085f98-5cc4-41f0-9eb9-5be42df73cdb	Update Frequency	Annually	5c259e90-bff5-477d-af6e-083ee44adcc4	active
474b4a15-bf8d-4eba-8cdc-dd52e01761ac	0c085f98-5cc4-41f0-9eb9-5be42df73cdb	Data Granularity	10 minute averaged data	5c259e90-bff5-477d-af6e-083ee44adcc4	active
322cbfaf-6abc-4c47-b4e7-301f5df7de69	0c085f98-5cc4-41f0-9eb9-5be42df73cdb	Geospatial Coverage	Spencer Gulf Region	5c259e90-bff5-477d-af6e-083ee44adcc4	active
1f10dea4-4173-44f5-bc02-214d47d5bba8	0c085f98-5cc4-41f0-9eb9-5be42df73cdb	Temporal Coverage	2013	5c259e90-bff5-477d-af6e-083ee44adcc4	active
9c940b4e-50b6-462e-86e6-aa42480d8719	a29987d5-d3ac-4935-90c3-6871cbdbafde	Data Location	Hosted	d07eda54-c4da-4491-9e24-7619739431d9	active
abd75ef2-0a44-4bc2-9403-2484a450cb4d	a29987d5-d3ac-4935-90c3-6871cbdbafde	Update Frequency	Annually	d07eda54-c4da-4491-9e24-7619739431d9	active
c153870e-71ec-408d-b09b-8495431588ea	a29987d5-d3ac-4935-90c3-6871cbdbafde	Data Granularity	10 minute averaged data	d07eda54-c4da-4491-9e24-7619739431d9	active
a49d3967-1b23-4f7c-af9a-75277407aa3b	a29987d5-d3ac-4935-90c3-6871cbdbafde	Geospatial Coverage	Spencer Gulf Region	d07eda54-c4da-4491-9e24-7619739431d9	active
2d194548-04d9-46c2-84a0-78c0510686fe	a29987d5-d3ac-4935-90c3-6871cbdbafde	Temporal Coverage	2013	d07eda54-c4da-4491-9e24-7619739431d9	active
f43c8fa2-b251-4d22-891d-f74ce51217fb	c2b6d9a4-9b7e-42bd-9cba-856320e2e139	Data Location	Hosted or Linked	a9b74787-a3ca-4d34-bf79-0d08673636a0	active
a2a3cd69-8b5d-4786-8b56-1e1c88afe206	c2b6d9a4-9b7e-42bd-9cba-856320e2e139	Update Frequency	Once-off	a9b74787-a3ca-4d34-bf79-0d08673636a0	active
52a2d72e-b709-4a01-b41b-492c9f88ae1d	c2b6d9a4-9b7e-42bd-9cba-856320e2e139	Data Granularity	N/A	a9b74787-a3ca-4d34-bf79-0d08673636a0	active
9f11d3e5-d806-4f48-9541-6a5331289776	c2b6d9a4-9b7e-42bd-9cba-856320e2e139	Geospatial Coverage	Partial coverage of the northern area of South Adelaide, City of Adelaide, South Australia	a9b74787-a3ca-4d34-bf79-0d08673636a0	active
937a0e81-f697-4d64-a9cd-13e34c0d9fe0	c2b6d9a4-9b7e-42bd-9cba-856320e2e139	Temporal Coverage	1911-1914	a9b74787-a3ca-4d34-bf79-0d08673636a0	active
7054c393-e4db-45d2-af98-5654b4d17842	2e0da08c-6d18-4469-ad77-d9b266e30f0c	Data Location	Hosted or Linked	337e0a68-7271-49aa-9706-91f3d1f0e7f9	active
c4bbaf38-c76a-4d0e-a86f-31fddb2f3ea5	2e0da08c-6d18-4469-ad77-d9b266e30f0c	Update Frequency	Once-off	337e0a68-7271-49aa-9706-91f3d1f0e7f9	active
cb427555-cd1c-455a-ad80-8dd59e812848	2e0da08c-6d18-4469-ad77-d9b266e30f0c	Data Granularity	N/A	337e0a68-7271-49aa-9706-91f3d1f0e7f9	active
1f056e6c-047a-4d4c-8a07-20ae29e4a33d	2e0da08c-6d18-4469-ad77-d9b266e30f0c	Geospatial Coverage	Partial coverage of South Australia, including Adelaide and greater Adelaide regions, Fleurieu Peninsula, lower River Murray and lakes area and part Coorong, top of Spencer Gulf, and Pimba & Yandandarre Ridge regions in northern South Australia	337e0a68-7271-49aa-9706-91f3d1f0e7f9	active
735d4363-5757-4646-b3c4-90423d480532	2e0da08c-6d18-4469-ad77-d9b266e30f0c	Temporal Coverage	1914-1958	337e0a68-7271-49aa-9706-91f3d1f0e7f9	active
3450d005-d6b6-4cde-af9e-ffe5391fd9d8	2bf90e40-45bc-447b-8423-a122d682a9d9	Data Location	Hosted or Linked	f223f2dc-f623-47f9-bde6-83d94a1435f3	active
e999d257-d1db-4fd1-a12b-0f235e322cc4	2bf90e40-45bc-447b-8423-a122d682a9d9	Update Frequency	Once-off	f223f2dc-f623-47f9-bde6-83d94a1435f3	active
8b86313a-317a-4930-830e-50a7e4d31171	2bf90e40-45bc-447b-8423-a122d682a9d9	Data Granularity	N/A	f223f2dc-f623-47f9-bde6-83d94a1435f3	active
b0cf2684-1d66-461f-9451-dc04d3730edc	2bf90e40-45bc-447b-8423-a122d682a9d9	Geospatial Coverage	River Murray, South Australia from Swan Reach to boundary of State, 153 to 405 ¾ miles from Murray mouth	f223f2dc-f623-47f9-bde6-83d94a1435f3	active
5b4d188d-cfb4-47fc-af39-50e58460d333	2bf90e40-45bc-447b-8423-a122d682a9d9	Temporal Coverage	1910	f223f2dc-f623-47f9-bde6-83d94a1435f3	active
ff09ce32-0a39-41d7-827c-53a1ecefd9de	8166ee0e-85e0-4d05-9916-dd092e401644	Update Frequency	Ad-hoc	a5398d2a-cc61-4c52-82ab-bde5d407c254	active
66b60920-4faf-4ee8-b3ae-dde1315e908f	8166ee0e-85e0-4d05-9916-dd092e401644	Data Granularity	Entire Waite Arboretum	a5398d2a-cc61-4c52-82ab-bde5d407c254	active
c041d103-6612-4d97-8713-01848db192ef	8166ee0e-85e0-4d05-9916-dd092e401644	Geospatial Coverage	Arboretum boundary	a5398d2a-cc61-4c52-82ab-bde5d407c254	active
519bcee5-594d-45c5-a3d2-2a9711a39efe	8166ee0e-85e0-4d05-9916-dd092e401644	Temporal Coverage	June 2014	a5398d2a-cc61-4c52-82ab-bde5d407c254	active
f6121fb7-2971-46d1-a74f-2680a1c77c78	dfdf19f5-a6c4-4192-9c97-21b445407d83	Update Frequency	Ad-hoc	f725a636-7988-4d89-93bb-9f2a9b64e98d	active
7e1fa318-365e-48af-87e9-75527d31da4a	dfdf19f5-a6c4-4192-9c97-21b445407d83	Data Granularity	Entire Waite Arboretum	f725a636-7988-4d89-93bb-9f2a9b64e98d	active
1e5331e0-83bc-4273-b044-9d4040b51d94	dfdf19f5-a6c4-4192-9c97-21b445407d83	Geospatial Coverage	Arboretum boundary	f725a636-7988-4d89-93bb-9f2a9b64e98d	active
4079ef1a-b06c-4ab5-a84d-8a0006d65c01	dfdf19f5-a6c4-4192-9c97-21b445407d83	Temporal Coverage	June 2014	f725a636-7988-4d89-93bb-9f2a9b64e98d	active
b76cbaa7-affa-4809-8ac6-19cc75389d21	31a58078-8a02-43d5-b71a-c5c9cc47764f	Update Frequency	Annually	3c717612-25af-40d1-b772-ab1aa189bb7e	active
ca7031d8-676d-4581-b4a5-bd7ac0f8f349	31a58078-8a02-43d5-b71a-c5c9cc47764f	Geospatial Coverage	South Australia	3c717612-25af-40d1-b772-ab1aa189bb7e	active
19c79f3e-203e-4fc2-b9da-99287812a14a	31a58078-8a02-43d5-b71a-c5c9cc47764f	Temporal Coverage	1 May 2009 - 30 May 2014	3c717612-25af-40d1-b772-ab1aa189bb7e	active
c413fab0-35c7-4fd0-a90e-4c20ce19a727	8b8040ac-c71c-4c9b-b361-be84b4cd3dc6	Update Frequency	Monthly	5642f4c7-a7f6-446b-b1e5-ab78ab8a0f86	active
96458146-3eb0-43f4-a764-7a795e4c47d3	8b8040ac-c71c-4c9b-b361-be84b4cd3dc6	Geospatial Coverage	City of Adelaide	5642f4c7-a7f6-446b-b1e5-ab78ab8a0f86	active
06483133-989d-4cdd-a10a-e097dcee93df	8b8040ac-c71c-4c9b-b361-be84b4cd3dc6	Temporal Coverage	June 2014	5642f4c7-a7f6-446b-b1e5-ab78ab8a0f86	active
1e304c08-8f32-45de-b295-c221c85ddc0e	b69f5a2f-c949-4dc8-9cf1-3f79a4271bf7	Update Frequency	API	73fed971-928a-4456-8231-9ce392d51eaa	active
4866065e-d9b9-4156-b093-ee6c90bbad35	b69f5a2f-c949-4dc8-9cf1-3f79a4271bf7	Geospatial Coverage	Statewide	73fed971-928a-4456-8231-9ce392d51eaa	active
37c65460-8dbc-4d5d-a26a-10bdbf30cddf	880ee9d8-15f2-4902-a024-f4dc106a2322	Data Location	Hosted	dc9dff2c-b06d-452e-971b-9671c87a4710	active
f27f081a-ffbf-4d6b-8e2f-bc380a47bd6d	880ee9d8-15f2-4902-a024-f4dc106a2322	Update Frequency	Annually	dc9dff2c-b06d-452e-971b-9671c87a4710	active
f84f9c94-dcaa-401f-889d-723ec163a4c0	880ee9d8-15f2-4902-a024-f4dc106a2322	Data Granularity	Property Level	dc9dff2c-b06d-452e-971b-9671c87a4710	active
9d457292-42ce-4e13-b4a0-5172ad4bd890	880ee9d8-15f2-4902-a024-f4dc106a2322	Geospatial Coverage	South Australia	dc9dff2c-b06d-452e-971b-9671c87a4710	active
80c77251-1ec9-4a79-9459-379431577487	880ee9d8-15f2-4902-a024-f4dc106a2322	Temporal Coverage	2014	dc9dff2c-b06d-452e-971b-9671c87a4710	active
79ca0a72-9173-47b5-a31a-00c32c5abf72	09630f9e-b9a9-48df-a28f-c5f6f3ca270e	Data Location	Hosted	a75f053d-3b42-4bd8-8dc7-d00e1570d9b5	active
073093e4-1a39-44f3-aa94-067e9ed4481f	09630f9e-b9a9-48df-a28f-c5f6f3ca270e	Update Frequency	Annually	a75f053d-3b42-4bd8-8dc7-d00e1570d9b5	active
2878134f-2434-4c5b-9c91-edaba4d4ea56	09630f9e-b9a9-48df-a28f-c5f6f3ca270e	Data Granularity	Property Level	a75f053d-3b42-4bd8-8dc7-d00e1570d9b5	active
576509df-f374-4708-9169-b14fd758fa2c	09630f9e-b9a9-48df-a28f-c5f6f3ca270e	Geospatial Coverage	South Australia	a75f053d-3b42-4bd8-8dc7-d00e1570d9b5	active
274e6236-000d-44fe-a105-10094ff8ed85	09630f9e-b9a9-48df-a28f-c5f6f3ca270e	Temporal Coverage	2014	a75f053d-3b42-4bd8-8dc7-d00e1570d9b5	active
819bad8f-ca0d-4e29-8fe9-3d14c43df00d	2ca0daa6-479b-4bf9-af03-20c7917f2438	Update Frequency	Annually	0096cd4f-06a0-4231-8e24-99cc7b164563	active
970faf9a-e027-4bf9-be04-125a1160f4a8	2ca0daa6-479b-4bf9-af03-20c7917f2438	Data Granularity	State Region	0096cd4f-06a0-4231-8e24-99cc7b164563	active
75fdacc5-f13b-4f1c-ae39-7cddad5bced2	2ca0daa6-479b-4bf9-af03-20c7917f2438	Geospatial Coverage	South Australia	0096cd4f-06a0-4231-8e24-99cc7b164563	active
681be5b4-71e3-4e3d-9a6b-0c0aa7f78fb6	2ca0daa6-479b-4bf9-af03-20c7917f2438	Temporal Coverage	2014	0096cd4f-06a0-4231-8e24-99cc7b164563	active
ce8c1b9e-6e80-4f82-b508-9d4dcdbd2d67	5f0ba9f3-2a9a-46a6-b27d-079ca7db2f3e	Data Location	Hosted	b00a16f9-7671-469a-afb2-60f21db87dcd	active
ef3f8bda-20c9-4005-83c9-d1e06d923579	5f0ba9f3-2a9a-46a6-b27d-079ca7db2f3e	Update Frequency	Annually	b00a16f9-7671-469a-afb2-60f21db87dcd	active
815e54a9-8cf8-41eb-9116-fa601ff3cffb	5f0ba9f3-2a9a-46a6-b27d-079ca7db2f3e	Data Granularity	State Region	b00a16f9-7671-469a-afb2-60f21db87dcd	active
f357b07d-0b85-40d0-9311-d2807b71dcac	5f0ba9f3-2a9a-46a6-b27d-079ca7db2f3e	Geospatial Coverage	South Australia	b00a16f9-7671-469a-afb2-60f21db87dcd	active
e1167b60-4f19-4ad7-b36e-3e5acdc414db	5f0ba9f3-2a9a-46a6-b27d-079ca7db2f3e	Temporal Coverage	2014	b00a16f9-7671-469a-afb2-60f21db87dcd	active
bbe5b514-c571-4100-8e48-5f3a08423eda	9c2a4a32-038d-4c8f-98c7-7f59e001d213	Data Granularity	Property Level	7456bc1b-96e6-4b3c-90bb-82a886a8f73f	active
682661c4-6eac-4f7e-875f-e7a56a2d51dc	9c2a4a32-038d-4c8f-98c7-7f59e001d213	Data Status	Active	7456bc1b-96e6-4b3c-90bb-82a886a8f73f	active
05c8ba04-d3df-4ae3-9b79-47a8ca627765	9c2a4a32-038d-4c8f-98c7-7f59e001d213	Geospatial Coverage	South Australia	7456bc1b-96e6-4b3c-90bb-82a886a8f73f	active
25c23bc1-96bc-4ec0-87c5-045e8163c2ae	9c2a4a32-038d-4c8f-98c7-7f59e001d213	Update Frequency	Annually	7456bc1b-96e6-4b3c-90bb-82a886a8f73f	active
e77b8060-6583-4fac-a139-95b0c868adbe	9c2a4a32-038d-4c8f-98c7-7f59e001d213	Temporal Coverage	2014	7456bc1b-96e6-4b3c-90bb-82a886a8f73f	active
c295a7a0-4539-4cf3-a803-142046ced605	9c2a4a32-038d-4c8f-98c7-7f59e001d213	Data Location	Hosted	7456bc1b-96e6-4b3c-90bb-82a886a8f73f	active
1c4981c6-dd0b-4bae-86cd-e95b9a812cee	78f36e27-d711-4088-a7f2-e18b360ed107	Data Location	Hosted	04001e39-43c5-4c42-88d6-3f7701011504	active
d47eb2e0-50da-4f71-9396-cfb7941f31e8	78f36e27-d711-4088-a7f2-e18b360ed107	Update Frequency	Annually	04001e39-43c5-4c42-88d6-3f7701011504	active
dca8293e-f2b1-4e79-839c-0e6a38f99231	78f36e27-d711-4088-a7f2-e18b360ed107	Data Granularity	State Region	04001e39-43c5-4c42-88d6-3f7701011504	active
4c121dcc-4404-4923-9174-fc9b57594217	78f36e27-d711-4088-a7f2-e18b360ed107	Geospatial Coverage	South Australia	04001e39-43c5-4c42-88d6-3f7701011504	active
fb4054eb-ec86-405f-8bd2-55de9875cac8	78f36e27-d711-4088-a7f2-e18b360ed107	Temporal Coverage	2014	04001e39-43c5-4c42-88d6-3f7701011504	active
5835e7f0-d9b5-40db-b2b7-0760a233f757	aae05f90-6ead-4d51-849d-367dbb66e011	Data Location	Hosted	83b927f8-8b57-44fa-913b-050d184b2364	active
4de3a1df-4250-4702-a6ae-957558d76cce	aae05f90-6ead-4d51-849d-367dbb66e011	Update Frequency	Annually	83b927f8-8b57-44fa-913b-050d184b2364	active
f3f65470-9c9d-4dcd-9755-bb6db7cd1a9e	aae05f90-6ead-4d51-849d-367dbb66e011	Data Granularity	State Region	83b927f8-8b57-44fa-913b-050d184b2364	active
d394fead-f190-421d-a40e-64a140cb1bd5	aae05f90-6ead-4d51-849d-367dbb66e011	Geospatial Coverage	South Australia	83b927f8-8b57-44fa-913b-050d184b2364	active
1158b6b4-7925-4491-a005-89e702aebe1d	aae05f90-6ead-4d51-849d-367dbb66e011	Temporal Coverage	2014	83b927f8-8b57-44fa-913b-050d184b2364	active
2668405b-3a0a-4567-bc94-06d3b44d8c21	5c4723d1-dc6e-47b3-9850-125f07e9c2bd	Data Granularity	Property Level	187d9061-1698-4376-9f83-be62f16dc286	active
ef9d3387-1ffc-4f62-a0cb-5ea996dc7f25	5c4723d1-dc6e-47b3-9850-125f07e9c2bd	Data Status	Active	187d9061-1698-4376-9f83-be62f16dc286	active
abb50b1f-600b-4af4-8631-a4f733fff354	5c4723d1-dc6e-47b3-9850-125f07e9c2bd	Geospatial Coverage	South Australia	187d9061-1698-4376-9f83-be62f16dc286	active
00eddfdc-9fe2-4475-a2e8-233d4c8013c8	5c4723d1-dc6e-47b3-9850-125f07e9c2bd	Update Frequency	Annually	187d9061-1698-4376-9f83-be62f16dc286	active
75f2bcd6-5f7f-46b0-bb1a-288dc9b5530e	5c4723d1-dc6e-47b3-9850-125f07e9c2bd	Temporal Coverage	2014	187d9061-1698-4376-9f83-be62f16dc286	active
d2257b6a-848d-4e1f-9c9a-8722d5184ff5	5c4723d1-dc6e-47b3-9850-125f07e9c2bd	Data Location	Hosted	187d9061-1698-4376-9f83-be62f16dc286	active
0fffead5-8c1d-4074-90b5-ebd8620c12b9	6761afa6-f411-43b1-b35b-e704309cd0d3	Update Frequency	Following Census	e863d0a3-aeab-4722-833b-24a1e97f603e	active
740f2612-4abf-42a8-a481-0a353cae7f3f	6761afa6-f411-43b1-b35b-e704309cd0d3	Data Granularity	N/A	e863d0a3-aeab-4722-833b-24a1e97f603e	active
d694ab2c-fd74-4be5-a54a-65ed23a32f19	6761afa6-f411-43b1-b35b-e704309cd0d3	Geospatial Coverage	Adelaide Hills	e863d0a3-aeab-4722-833b-24a1e97f603e	active
dcd80e71-86b5-4e5d-82a9-c7de2367ca7b	cb34dc2c-43e8-4228-a7f7-90e33aa75a5e	Data Location	Hosted	8fc64bae-58a7-4bd1-b556-81f7773f23cd	active
d8fd5aab-aa53-4e46-96b6-d93d385a2d55	cb34dc2c-43e8-4228-a7f7-90e33aa75a5e	Update Frequency	Following Census	8fc64bae-58a7-4bd1-b556-81f7773f23cd	active
ee72fdac-c905-4257-9096-e4dbcf96bd86	cb34dc2c-43e8-4228-a7f7-90e33aa75a5e	Geospatial Coverage	Yorke & Mid North	8fc64bae-58a7-4bd1-b556-81f7773f23cd	active
5f1943c9-5ac9-4df6-9caa-1831833ec664	cb34dc2c-43e8-4228-a7f7-90e33aa75a5e	Temporal Coverage	2011-12	8fc64bae-58a7-4bd1-b556-81f7773f23cd	active
b072041d-17cc-493f-a696-9bf3d5b6896a	2d79159a-a4f9-4465-88e2-999bfe3af0d7	Data Granularity	N/A	3b92f495-b11a-430b-aa4a-a5cd3e3d844c	active
be896fa8-dfb8-4bde-bf74-9797f2581c29	2d79159a-a4f9-4465-88e2-999bfe3af0d7	Data Status	Active	3b92f495-b11a-430b-aa4a-a5cd3e3d844c	active
6e854fd1-625d-4650-a755-f003fdd38c27	2d79159a-a4f9-4465-88e2-999bfe3af0d7	Geospatial Coverage	Barossa	3b92f495-b11a-430b-aa4a-a5cd3e3d844c	active
5173eccf-e22d-4842-924c-d3d1e6a53c1b	2d79159a-a4f9-4465-88e2-999bfe3af0d7	Update Frequency	Following Census	3b92f495-b11a-430b-aa4a-a5cd3e3d844c	active
248c5ed1-c015-4267-8685-aa609b1dabda	2d79159a-a4f9-4465-88e2-999bfe3af0d7	Temporal Coverage	2011-12	3b92f495-b11a-430b-aa4a-a5cd3e3d844c	active
ee791b6b-acab-4f62-967c-f49d22e78386	2d79159a-a4f9-4465-88e2-999bfe3af0d7	Data Location	Hosted	3b92f495-b11a-430b-aa4a-a5cd3e3d844c	active
78405edd-f26f-4703-a03a-1aae86cf8e86	cb34dc2c-43e8-4228-a7f7-90e33aa75a5e	Data Granularity	N/A	0a670566-69f5-4cbd-9908-892abf8a257d	active
2cc8e177-d3c7-4065-be46-b7062a3a72b3	cb34dc2c-43e8-4228-a7f7-90e33aa75a5e	Data Status	N/A	fad4a9af-eef3-48c8-a355-410a14d9440b	active
1a9d737a-8420-4fcd-b8f1-f6a66bb8dd4f	df2fb8ac-7756-4060-aea0-65080826ee4a	Update Frequency	Following Census	11a30cc8-9365-4629-acfb-05373fae1ef2	active
8ec6d526-18d8-4c9f-bfd4-72333e4b09e6	df2fb8ac-7756-4060-aea0-65080826ee4a	Data Location	Hosted	11a30cc8-9365-4629-acfb-05373fae1ef2	active
2dd95a8a-da5a-4f18-9051-72d47e5fe961	df2fb8ac-7756-4060-aea0-65080826ee4a	Temporal Coverage	2011-12	11a30cc8-9365-4629-acfb-05373fae1ef2	active
7c0f4b06-249a-4eac-9031-0976a928ec7d	df2fb8ac-7756-4060-aea0-65080826ee4a	Data Granularity	N/A	11a30cc8-9365-4629-acfb-05373fae1ef2	active
c942b9f2-7dfb-4127-b0c1-38535c3e6922	df2fb8ac-7756-4060-aea0-65080826ee4a	Data Status	Active	11a30cc8-9365-4629-acfb-05373fae1ef2	active
28d17fb7-6481-4f10-a8f9-ccacc2a741d5	df2fb8ac-7756-4060-aea0-65080826ee4a	Geospatial Coverage	Eastern Adelaide	11a30cc8-9365-4629-acfb-05373fae1ef2	active
d2756481-d661-4d55-8f83-34aea3b964ec	c0714dc2-df24-4277-a82d-dbaf710363fc	Data Granularity	N/A	1cc19e9c-8945-433b-9dac-eabf4f3ec0ea	active
4603dddc-fd6d-4459-b8a8-e2a4ad894023	c0714dc2-df24-4277-a82d-dbaf710363fc	Data Status	Active	1cc19e9c-8945-433b-9dac-eabf4f3ec0ea	active
f82197c7-0eaf-4300-b212-cc9d2a1630d3	c0714dc2-df24-4277-a82d-dbaf710363fc	Geospatial Coverage	Eyre & Western	1cc19e9c-8945-433b-9dac-eabf4f3ec0ea	active
fac58ccf-09b2-424d-ae08-45a134ba466a	c0714dc2-df24-4277-a82d-dbaf710363fc	Update Frequency	Following Census	1cc19e9c-8945-433b-9dac-eabf4f3ec0ea	active
2373dc44-f235-4e44-8dd7-b1d14b4c07f2	c0714dc2-df24-4277-a82d-dbaf710363fc	Temporal Coverage	2011-12	1cc19e9c-8945-433b-9dac-eabf4f3ec0ea	active
a9b7b01f-3148-4fdf-962b-2f50b41eca8b	c0714dc2-df24-4277-a82d-dbaf710363fc	Data Location	Hosted	1cc19e9c-8945-433b-9dac-eabf4f3ec0ea	active
fce25805-5cd2-4a90-9807-ca78993a0662	9d0e3f21-28fd-4a26-b314-9bcd6a93f0ff	Data Granularity	N/A	d153106e-5617-4d72-83f1-be645e69fd14	active
cc65dc7e-4d6f-4429-9feb-77380a19d142	9d0e3f21-28fd-4a26-b314-9bcd6a93f0ff	Data Status	Active	d153106e-5617-4d72-83f1-be645e69fd14	active
f834878e-3588-478b-a12e-f70878c7316a	9d0e3f21-28fd-4a26-b314-9bcd6a93f0ff	Geospatial Coverage	Far North	d153106e-5617-4d72-83f1-be645e69fd14	active
1a757ce2-a9f5-49c3-9411-b3aeffe70335	9d0e3f21-28fd-4a26-b314-9bcd6a93f0ff	Update Frequency	Following Census	d153106e-5617-4d72-83f1-be645e69fd14	active
3157149f-3d59-4f48-8fad-142a9c8fce92	9d0e3f21-28fd-4a26-b314-9bcd6a93f0ff	Temporal Coverage	2011-12	d153106e-5617-4d72-83f1-be645e69fd14	active
2e562e7d-7409-4cd0-a46d-13006d072b90	9d0e3f21-28fd-4a26-b314-9bcd6a93f0ff	Data Location	Hosted	d153106e-5617-4d72-83f1-be645e69fd14	active
70d699f9-1ec9-4cbd-a0c6-e4d509acc833	9f391f78-0871-4cdb-8718-3d3627739b18	Data Granularity	N/A	565ee9ad-cf68-41d2-ab29-f915ae9e1983	active
2c5fba23-b995-4aa9-a844-1b32d7882336	9f391f78-0871-4cdb-8718-3d3627739b18	Data Status	Active	565ee9ad-cf68-41d2-ab29-f915ae9e1983	active
7c699050-6bd4-47f9-a660-dcf2f2355eee	9f391f78-0871-4cdb-8718-3d3627739b18	Geospatial Coverage	Fleurieu & KI	565ee9ad-cf68-41d2-ab29-f915ae9e1983	active
594d7320-8ffc-4537-8766-11d81dc5eceb	9f391f78-0871-4cdb-8718-3d3627739b18	Update Frequency	Following Census	565ee9ad-cf68-41d2-ab29-f915ae9e1983	active
f543e50b-63be-43a6-bfca-f6f79082c948	9f391f78-0871-4cdb-8718-3d3627739b18	Temporal Coverage	2011-12	565ee9ad-cf68-41d2-ab29-f915ae9e1983	active
2be7af8d-cbbf-48f8-94d3-d1b13f33abd3	9f391f78-0871-4cdb-8718-3d3627739b18	Data Location	Hosted	565ee9ad-cf68-41d2-ab29-f915ae9e1983	active
53d673bc-20ab-4750-8831-018e432e06ba	b7a2a07f-7c77-4eb8-8475-f49aa07cd147	Data Granularity	N/A	74d4b032-4bab-457a-a08e-08e592907dc9	active
5e6d649b-4de2-4aaa-b3e6-8328bd4c4d92	b7a2a07f-7c77-4eb8-8475-f49aa07cd147	Data Status	Active	74d4b032-4bab-457a-a08e-08e592907dc9	active
ab5de70b-f646-4aba-aa03-66f310e3caee	b7a2a07f-7c77-4eb8-8475-f49aa07cd147	Geospatial Coverage	Limestone Coast	74d4b032-4bab-457a-a08e-08e592907dc9	active
2d40de5f-351b-494b-af33-31e19081ac9e	b7a2a07f-7c77-4eb8-8475-f49aa07cd147	Update Frequency	Following Census	74d4b032-4bab-457a-a08e-08e592907dc9	active
74eb57a3-243b-428b-a266-a089909d6e9b	b7a2a07f-7c77-4eb8-8475-f49aa07cd147	Temporal Coverage	2011-12	74d4b032-4bab-457a-a08e-08e592907dc9	active
ed0efbaf-a259-48ae-a1ca-0f4bb7a25444	b7a2a07f-7c77-4eb8-8475-f49aa07cd147	Data Location	Hosted	74d4b032-4bab-457a-a08e-08e592907dc9	active
9c5d0dba-ad14-4f7e-909b-90db8e416589	b117944b-2ff8-4b28-811e-7c7fb32b2fc3	Data Granularity	Daily	0b178e30-134b-4c18-a575-5b2665cf4e3a	active
04028e98-1042-4c1d-bad4-f58b984d781d	b117944b-2ff8-4b28-811e-7c7fb32b2fc3	Data Status	Active	0b178e30-134b-4c18-a575-5b2665cf4e3a	active
ad9a0baa-cf15-4dcd-9278-74ac3cd6a356	b117944b-2ff8-4b28-811e-7c7fb32b2fc3	Geospatial Coverage	South Australia	0b178e30-134b-4c18-a575-5b2665cf4e3a	active
2a78a229-e87f-4678-a8bd-660fd1dbb55c	b117944b-2ff8-4b28-811e-7c7fb32b2fc3	Update Frequency	Annually	0b178e30-134b-4c18-a575-5b2665cf4e3a	active
14ac4cad-7627-4718-9af7-1b590dae69e4	b117944b-2ff8-4b28-811e-7c7fb32b2fc3	Temporal Coverage	2009-14	0b178e30-134b-4c18-a575-5b2665cf4e3a	active
d737572b-f611-439f-91ba-38da5bd3a0cf	b117944b-2ff8-4b28-811e-7c7fb32b2fc3	Data Location	Hosted	0b178e30-134b-4c18-a575-5b2665cf4e3a	active
a69113b2-b1a8-4cf5-8ceb-ea54020ac196	a0b6e2c3-189e-4ce7-a6b6-348aa0028cab	Data Granularity	N/A	c74e17e9-74e8-4b60-a1d2-3f18fdee357f	active
e65de9ec-cd49-4e7d-a946-55a0217edf10	a0b6e2c3-189e-4ce7-a6b6-348aa0028cab	Data Status	Active	c74e17e9-74e8-4b60-a1d2-3f18fdee357f	active
5106e908-c9f1-4493-82f1-3563ca41af8d	a0b6e2c3-189e-4ce7-a6b6-348aa0028cab	Geospatial Coverage	Murray & Mallee	c74e17e9-74e8-4b60-a1d2-3f18fdee357f	active
919b1085-dff6-40ff-b464-a3a3da1400b1	a0b6e2c3-189e-4ce7-a6b6-348aa0028cab	Update Frequency	Following Census	c74e17e9-74e8-4b60-a1d2-3f18fdee357f	active
1ee2ef83-15a6-4509-8474-300e52a80edd	a0b6e2c3-189e-4ce7-a6b6-348aa0028cab	Temporal Coverage	2011-12	c74e17e9-74e8-4b60-a1d2-3f18fdee357f	active
792ea4e5-ca3a-49a7-abe8-f474b08e8483	a0b6e2c3-189e-4ce7-a6b6-348aa0028cab	Data Location	Hosted	c74e17e9-74e8-4b60-a1d2-3f18fdee357f	active
51916256-234a-4436-b2f9-88e01a78cf04	36dddae1-7b87-41d8-a4a0-4eed92fa6faf	Data Granularity	N/A	57443a06-03de-4fb1-8cfc-266db23381c3	active
6018d7ab-8fec-4157-9e30-57029c205947	36dddae1-7b87-41d8-a4a0-4eed92fa6faf	Data Status	Active	57443a06-03de-4fb1-8cfc-266db23381c3	active
b25cb9a2-1db2-4ab1-8d2a-0dcca97b4e22	36dddae1-7b87-41d8-a4a0-4eed92fa6faf	Geospatial Coverage	Northern Adelaide	57443a06-03de-4fb1-8cfc-266db23381c3	active
506414d3-c45b-469d-b885-cedb88dada9d	36dddae1-7b87-41d8-a4a0-4eed92fa6faf	Update Frequency	Following Census	57443a06-03de-4fb1-8cfc-266db23381c3	active
0787d141-e4e1-434c-9a1a-cdbe23617e84	36dddae1-7b87-41d8-a4a0-4eed92fa6faf	Temporal Coverage	2011-12	57443a06-03de-4fb1-8cfc-266db23381c3	active
f3cd2a12-f2bf-402a-a2a5-bc4ae6dabc57	36dddae1-7b87-41d8-a4a0-4eed92fa6faf	Data Location	Hosted	57443a06-03de-4fb1-8cfc-266db23381c3	active
a2a27928-14f1-41cb-8de6-431c9b9edd29	a88326a5-93e4-4244-99fb-68f2b11e49c7	Data Granularity	N/A	eeb8f213-e235-4165-85c2-78f6d41563fc	active
719236ad-d1c3-4a0f-a5be-4ee2e19c1fea	a88326a5-93e4-4244-99fb-68f2b11e49c7	Data Status	Active	eeb8f213-e235-4165-85c2-78f6d41563fc	active
e3d31d72-4c38-4306-a7b3-e41527a46747	a88326a5-93e4-4244-99fb-68f2b11e49c7	Geospatial Coverage	South Australia	eeb8f213-e235-4165-85c2-78f6d41563fc	active
b5e792cf-845d-465e-81de-78fa5bb8dad6	a88326a5-93e4-4244-99fb-68f2b11e49c7	Update Frequency	Following Census	eeb8f213-e235-4165-85c2-78f6d41563fc	active
09b615f8-5182-4439-9606-8ba03e832bc6	a88326a5-93e4-4244-99fb-68f2b11e49c7	Temporal Coverage	2011-12	eeb8f213-e235-4165-85c2-78f6d41563fc	active
ff759d57-c863-4568-898e-6252cb1e9fa3	a88326a5-93e4-4244-99fb-68f2b11e49c7	Data Location	Hosted	eeb8f213-e235-4165-85c2-78f6d41563fc	active
4b07482c-ffe0-4212-bfda-1e04860baa37	c1ee506e-432e-4d89-8cc8-77a5572a3544	Data Granularity	N/A	e8d774de-1205-4f07-906a-333aefd4a9a3	active
f82b2ffe-bcaa-45ed-9fa0-778e2b71fe1c	c1ee506e-432e-4d89-8cc8-77a5572a3544	Data Status	Active	e8d774de-1205-4f07-906a-333aefd4a9a3	active
825689e9-23aa-42d8-b018-fdedd5324e38	c1ee506e-432e-4d89-8cc8-77a5572a3544	Geospatial Coverage	Southern Adelaide	e8d774de-1205-4f07-906a-333aefd4a9a3	active
395df392-c920-4d0d-a01c-68c049c6f852	c1ee506e-432e-4d89-8cc8-77a5572a3544	Update Frequency	Following Census	e8d774de-1205-4f07-906a-333aefd4a9a3	active
a2a41e44-3a71-4bed-8fb9-56f16347c09b	c1ee506e-432e-4d89-8cc8-77a5572a3544	Temporal Coverage	2011-12	e8d774de-1205-4f07-906a-333aefd4a9a3	active
b6ffaeff-7d77-4164-a7f4-13fe3b6f59a9	c1ee506e-432e-4d89-8cc8-77a5572a3544	Data Location	Hosted	e8d774de-1205-4f07-906a-333aefd4a9a3	active
b3f96567-095a-4c3a-a79e-55061ddab134	8b48d402-899c-46fc-8b2e-6628a3f0dad4	Data Granularity	N/A	9b2772fd-ab26-421b-99c3-d153067fae10	active
06270e77-663d-46f4-9628-21f6de72fcc5	8b48d402-899c-46fc-8b2e-6628a3f0dad4	Data Status	Active	9b2772fd-ab26-421b-99c3-d153067fae10	active
6c529623-d4bb-48a9-8db4-95bf825e99ea	8b48d402-899c-46fc-8b2e-6628a3f0dad4	Geospatial Coverage	Western Adelaide	9b2772fd-ab26-421b-99c3-d153067fae10	active
3fe7eb2d-ccc3-4f97-8a7a-1daf293204d1	8b48d402-899c-46fc-8b2e-6628a3f0dad4	Update Frequency	Following Census	9b2772fd-ab26-421b-99c3-d153067fae10	active
879008e8-f79b-4da4-85a3-331d0d737d96	8b48d402-899c-46fc-8b2e-6628a3f0dad4	Temporal Coverage	2011-12	9b2772fd-ab26-421b-99c3-d153067fae10	active
c93f9cee-ce28-40a9-bb8a-9fcbd3562cd7	8b48d402-899c-46fc-8b2e-6628a3f0dad4	Data Location	Hosted	9b2772fd-ab26-421b-99c3-d153067fae10	active
a37fc933-a3bf-4724-968b-b1ca4a2dec32	0811fefc-637d-4542-a5d3-1a69ce5a5c21	Data Granularity	Emergency service locations by land parcel location	9df87f60-d877-4736-b1d4-899980886f96	active
23bae8c2-e465-4c20-9250-f70abff1732e	0811fefc-637d-4542-a5d3-1a69ce5a5c21	Data Status	Active	9df87f60-d877-4736-b1d4-899980886f96	active
7a0246ca-d891-4e2f-a4ad-144b86020152	0811fefc-637d-4542-a5d3-1a69ce5a5c21	Geospatial Coverage	South Australia	9df87f60-d877-4736-b1d4-899980886f96	active
1b2b583a-7168-4098-8bfb-0bda6150b7f7	0811fefc-637d-4542-a5d3-1a69ce5a5c21	Update Frequency	Ad-hoc	9df87f60-d877-4736-b1d4-899980886f96	active
b0a03dce-7548-46e8-89f9-b11664561557	0811fefc-637d-4542-a5d3-1a69ce5a5c21	Temporal Coverage	2012-June 2014	9df87f60-d877-4736-b1d4-899980886f96	active
cf588e4e-138c-46da-9d3d-dd7654f73e44	0811fefc-637d-4542-a5d3-1a69ce5a5c21	Data Location	Hosted	9df87f60-d877-4736-b1d4-899980886f96	active
e19ee125-3c6a-48e4-bd05-1dc777e4f3f6	c4c7be62-7dba-43c1-afc3-856d684fa247	Data Status	Active	71870207-f12b-409d-bda4-875de0ce62ae	active
3a3f81bc-e975-468d-ae77-55103300526c	c4c7be62-7dba-43c1-afc3-856d684fa247	Geospatial Coverage	South Australia	71870207-f12b-409d-bda4-875de0ce62ae	active
678a466d-2a47-4572-af81-4131b4b5856b	c4c7be62-7dba-43c1-afc3-856d684fa247	Update Frequency	Annually	71870207-f12b-409d-bda4-875de0ce62ae	active
84d7927e-c7d7-46c5-a6f8-7ffe6888d03c	c4c7be62-7dba-43c1-afc3-856d684fa247	Temporal Coverage	2009-14	71870207-f12b-409d-bda4-875de0ce62ae	active
31cc181d-33d8-4bfb-913f-e765131b5f3c	c4c7be62-7dba-43c1-afc3-856d684fa247	Data Location	Hosted	71870207-f12b-409d-bda4-875de0ce62ae	active
a35da3ba-2182-43f0-b85f-59abd9249593	c4c7be62-7dba-43c1-afc3-856d684fa247	Data Granularity	Yearly	62c75cf8-d610-444f-9400-ae5b0702062d	active
ab9912f7-1339-40bb-8d97-a275d33b910a	3622df16-089c-4fdb-9e97-f64637c7669d	Data Granularity	Annually	bfa4b77f-6d36-4848-aea7-a5bbf14546ac	active
4554eb97-b1f6-407a-8051-d828fd9d5a26	3622df16-089c-4fdb-9e97-f64637c7669d	Data Status	 Active	bfa4b77f-6d36-4848-aea7-a5bbf14546ac	active
4204720d-3d85-47da-8874-3fa5d680ed09	3622df16-089c-4fdb-9e97-f64637c7669d	Geospatial Coverage	South Australia	bfa4b77f-6d36-4848-aea7-a5bbf14546ac	active
1a9e3846-3bcd-4f97-9f61-d34bb5e3589a	3622df16-089c-4fdb-9e97-f64637c7669d	Update Frequency	Annually	bfa4b77f-6d36-4848-aea7-a5bbf14546ac	active
d37808bd-af1a-4ef8-89ac-8a3ea265c256	3622df16-089c-4fdb-9e97-f64637c7669d	Temporal Coverage	2010-2014	bfa4b77f-6d36-4848-aea7-a5bbf14546ac	active
eb2c7a64-82cf-4df7-9ad3-ab8a13c9b9e7	3622df16-089c-4fdb-9e97-f64637c7669d	Data Location	Hosted	bfa4b77f-6d36-4848-aea7-a5bbf14546ac	active
271d16b7-335d-47d9-b571-62279e10e0fe	19e266ca-9ad1-481d-b8a3-3fcd714be326	Update Frequency	Daily	9a06880a-85e7-4e59-b381-502162d17339	active
21dae8a4-e2a8-43b5-9c52-164e69562b92	0aff4e2e-5599-46fa-ba22-dba13e07dcb1	Update Frequency	Daily	feff1a97-844e-4bef-a156-a4ad8d5306f9	active
3959be2a-71d9-4b4d-9ac4-92b120d7501f	e0f76a9c-1e75-4532-9990-2c7b10093612	Update Frequency	Daily	10d66b79-44d3-4336-b77c-1a6b7f7dc800	active
5eeea6c8-e82c-4dfd-80ae-89e8933e9604	515e3edb-9228-4c81-9015-51bb416bc349	Update Frequency	Daily	ddd6d5bd-8e1d-40fe-b969-d64b89451a5b	active
94e89210-faf6-4a63-aa60-cf581ac9c248	b584938f-3f3a-4821-93b9-e44adf8e6884	Data Granularity	One time point – 2007	57985bcf-cc7a-469c-90b4-bf8a42ecc5b5	active
e4e8fd62-b0e9-431d-b034-0f620ed52202	b584938f-3f3a-4821-93b9-e44adf8e6884	Data Status	Inactive	57985bcf-cc7a-469c-90b4-bf8a42ecc5b5	active
96915729-3a86-4388-9262-8c5155b76ad7	b584938f-3f3a-4821-93b9-e44adf8e6884	Geospatial Coverage	Local Government Areas across metropolitan Adelaide and larger regional areas	57985bcf-cc7a-469c-90b4-bf8a42ecc5b5	active
b59d72d6-cd28-4b4b-9859-f457a7bf474f	b584938f-3f3a-4821-93b9-e44adf8e6884	Update Frequency	Once-off study 	57985bcf-cc7a-469c-90b4-bf8a42ecc5b5	active
d510dd71-a405-4bd2-a55d-47a7965fbb5a	b584938f-3f3a-4821-93b9-e44adf8e6884	Temporal Coverage	2007	57985bcf-cc7a-469c-90b4-bf8a42ecc5b5	active
69043c03-2d40-4d06-9c88-a9e2b0a44b70	b584938f-3f3a-4821-93b9-e44adf8e6884	Data Location	South Australia	57985bcf-cc7a-469c-90b4-bf8a42ecc5b5	active
f81cb45b-2753-4166-ad87-d1f131d63088	37933eb0-100e-4c43-9832-35ababa726e9	Update Frequency	Daily	1cb71064-5259-4c9a-adbc-9cf23d8af71b	active
c37965f8-d63f-4eb3-9ca2-960ff0c1ed57	de39e54a-c9d7-47d2-9325-418808201326	Data Granularity	One time point – 2013	d093a97f-d070-49dd-9625-c023aa03caef	active
a713a1b1-b283-450b-bfa7-9c28d60f91b2	de39e54a-c9d7-47d2-9325-418808201326	Data Status	Inactive	d093a97f-d070-49dd-9625-c023aa03caef	active
e70a6b9a-09b3-492a-a144-9d0f7ef794f2	de39e54a-c9d7-47d2-9325-418808201326	Geospatial Coverage	Local Government Areas across metropolitan Adelaide and larger regional areas	d093a97f-d070-49dd-9625-c023aa03caef	active
c59ad61b-ca0c-4860-af5e-b91ed15f23f7	de39e54a-c9d7-47d2-9325-418808201326	Update Frequency	Once-off study	d093a97f-d070-49dd-9625-c023aa03caef	active
4cd3713e-0dcd-49d6-ae69-d4d1a83ae3d3	de39e54a-c9d7-47d2-9325-418808201326	Temporal Coverage	2013	d093a97f-d070-49dd-9625-c023aa03caef	active
439d0287-c092-4ed2-8180-156c231e8a4d	de39e54a-c9d7-47d2-9325-418808201326	Data Location	South Australia	d093a97f-d070-49dd-9625-c023aa03caef	active
b4d72865-2b60-42bb-952f-9b0a31387baf	e98ead99-1bbd-427a-8aa5-208d8e860360	Data Granularity	n/a	cf7c788f-b313-43f1-8b20-de17bf2b9fa7	active
d72c3b3d-dfd4-4ea8-b299-49de338adbb4	e98ead99-1bbd-427a-8aa5-208d8e860360	Data Status	Active	cf7c788f-b313-43f1-8b20-de17bf2b9fa7	active
994af068-af24-4519-b16f-3b6f95f36dac	e98ead99-1bbd-427a-8aa5-208d8e860360	Geospatial Coverage	South Australia	cf7c788f-b313-43f1-8b20-de17bf2b9fa7	active
6d040491-b106-4ea3-999c-41ebe282d662	e98ead99-1bbd-427a-8aa5-208d8e860360	Update Frequency	Annually	cf7c788f-b313-43f1-8b20-de17bf2b9fa7	active
f1189557-b8dc-4a31-8765-975d26d4d874	e98ead99-1bbd-427a-8aa5-208d8e860360	Temporal Coverage	2011-2012	cf7c788f-b313-43f1-8b20-de17bf2b9fa7	active
27c2bd7b-dd27-466b-b606-6dc566be4ae2	e98ead99-1bbd-427a-8aa5-208d8e860360	Data Location	South Australia	cf7c788f-b313-43f1-8b20-de17bf2b9fa7	active
9e09d3c6-9665-4b50-9a21-d9dcb79d3a82	6e6f2473-40d9-4f46-a3dd-18cd5b3da889	Update Frequency	Daily	1cddd99d-927b-4cfa-bb69-83349db2f9f6	active
446dfa27-99a2-40e9-a9da-c04f1ab8b9f2	25e3e0bc-23bf-445c-993b-565857e669b8	Data Granularity	n/a	17115bf6-ac61-4b50-b5c3-cd305407252e	active
86d1b6ca-21a5-471c-84cd-ac025ba1d678	25e3e0bc-23bf-445c-993b-565857e669b8	Data Status	Active	17115bf6-ac61-4b50-b5c3-cd305407252e	active
f15a8c8d-219e-4464-a9cc-af6a47cc5200	25e3e0bc-23bf-445c-993b-565857e669b8	Geospatial Coverage	South Australia	17115bf6-ac61-4b50-b5c3-cd305407252e	active
6e36efe9-f814-4fa8-a210-dcf2bbd06780	25e3e0bc-23bf-445c-993b-565857e669b8	Update Frequency	Annually	17115bf6-ac61-4b50-b5c3-cd305407252e	active
4a400e90-766a-42fc-bd66-f63b7897f64e	25e3e0bc-23bf-445c-993b-565857e669b8	Temporal Coverage	2012-2013	17115bf6-ac61-4b50-b5c3-cd305407252e	active
659e087a-815d-4e41-bfb0-e39917bb9dae	25e3e0bc-23bf-445c-993b-565857e669b8	Data Location	South Australia	17115bf6-ac61-4b50-b5c3-cd305407252e	active
e9c16d83-8c94-40c3-85a9-7cf1a3e6320a	a66a6e64-e38d-4f34-af4d-41d556d8daa6	Update Frequency	Daily	bb4148e1-0dcb-4b63-a08f-673aced8c3de	active
226451b0-b9f4-416d-bff2-ae2df6c8eafc	4b3ef678-2b77-452a-9d31-e06c5c14350a	Update Frequency	Daily	982a8d57-8065-4b0b-972e-bc7f4f994eec	active
c909ebf0-9e2c-4f89-a012-4883145d4428	685fe0a0-f030-4a6c-a593-f7d4cdc102af	Update Frequency	Daily	6e94a6b3-2282-4d2e-aaed-52aef100481e	active
4c9ed7d3-3734-4218-a068-8d3679808840	1bfdf821-9785-409e-954a-e903b4ae7720	Update Frequency	Daily	fdc41f3b-6f04-407e-b694-3b818a1a4ded	active
f8f93ff3-1199-4b9a-8205-a6c4178f81ca	a21e9c5d-b7d6-4476-909b-9bed0e3ae2a1	Update Frequency	Daily	7ab867c0-d014-4154-b683-76af21d38559	active
a2f65345-ce57-4e69-a5cc-cd97b8a2e37d	6579e818-e701-4b51-8f97-f1b0e633b24c	Update Frequency	Daily	4405f01b-371f-48ea-8bba-e900f91fdd96	active
fa07848a-dd3b-4204-83cf-82724f48f62c	3a6206db-9ca3-4071-b719-041fb8d83741	Update Frequency	Daily	07c6e75b-4763-4d95-a3a1-6c59773725b1	active
aef73a01-0271-4747-b977-0d03e87c41d0	1d753d8e-99b0-4619-932c-b0d05bd02975	Update Frequency	Daily	3ff14bd8-cbfd-4171-8f09-5fb468da0bbd	active
e4ef5506-95b9-4379-95f7-de1d2398fdf5	32330768-38e3-47bc-9eff-5d1a1ea1f793	Update Frequency	Daily	3bb9bdfe-b1be-4369-a870-e32f090ba5df	active
710648d3-cdc3-4c54-b31e-26d6af020a6c	f29caf79-1bd5-45b2-9ebb-e5dd1712e7db	Update Frequency	Daily	52651b11-d24c-4129-b5a9-98ca26c34309	active
9a949fa0-43f9-44bb-9509-7366ddb2303e	82230a54-2a9a-4a43-8536-1a0279846fcc	Update Frequency	Daily	18df9d19-de6b-44fb-a96d-7dc9b103ecf6	active
67ebe5de-b094-4c9d-9a4a-04f4b8c36fb1	407b76e9-76c8-4c73-aada-2523ee015583	Update Frequency	Daily	7caed3a8-232b-48ab-9678-9a67f09bd447	active
98ad3f80-f300-41ad-ae69-17f51b132901	125528b7-b1f7-4fa0-a867-6ff30cab5392	Update Frequency	Daily	a7ad95eb-7985-4265-a121-91e149210838	active
b4439097-5827-49d1-862a-728b5d65e327	8287f2fc-a88e-4e91-8155-817c18887f25	Update Frequency	Daily	336217a0-8ea8-434d-bc52-40a6905195bd	active
1004ffc3-f6af-4980-8524-3ac581f04732	73ae668b-b62b-46bf-adec-dc4ab58d3c48	Update Frequency	Daily	71b67f64-da65-448a-b43b-38854e80b763	active
78559eb0-666f-433f-ab2b-804e8a69fb94	c73ccd15-e1ca-49c5-b26d-4908f73150c1	Update Frequency	Daily	7d12b60e-c0d3-4162-bfbb-c69093a7eb30	active
7842cd51-5a36-4732-b65f-73fb2b490700	aec1b1be-f4cb-42cf-909e-decea32638b8	Update Frequency	Daily	8e435433-e2f7-4d0b-b481-44d981dd1357	active
c04f601f-ed80-41c6-bb1c-cff1810b28ec	643964b8-2711-41ef-8a93-277a84164351	Update Frequency	Daily	5732a8a4-e3b4-4b6d-8c2c-cb9022702338	active
f34e24bb-e3ab-4474-8e0d-b59192be80e1	dc47d809-7de7-4a15-b109-84a9675a0636	Update Frequency	Daily	84d07827-4f58-4552-bd72-a0c4d6593beb	active
da359c40-43c5-47d3-a53d-88bb843d9671	8f34a5cf-d488-4a0b-b2a8-82c97fc760b9	Update Frequency	Daily	27d10efc-17be-43f9-bad7-7efbe9094b11	active
17fabf99-9376-4d41-8f53-1988aeaff423	aa1aff67-ae25-4163-a7ea-ab5d618585b2	Update Frequency	Daily	a958caac-d543-4ef2-ba6c-9a67a34233a6	active
6007e826-1e8a-4375-b81c-814f181b8dbe	c4771bc6-6da6-4eee-ace8-a88360ea447a	Update Frequency	Daily	1736cb6b-c578-41d9-9f82-b247b7d981c8	active
87c3a44a-323d-4bb0-a5b9-72b3a4f539ae	46bc7aa1-5a93-4bcd-9a45-f37a8d5547ae	Update Frequency	Daily	b6cd69b8-0acc-497c-90ca-94fb771d512c	active
4de2a21c-c7f2-4ef5-a3bf-7be0f59a6790	53e87968-8f37-452a-820a-aab79d9d0f49	Data Granularity	N/A	a5240083-5706-489a-bd8f-eb5602ebd801	active
48b5bc36-4ef8-49fc-9382-6f1542e802ce	53e87968-8f37-452a-820a-aab79d9d0f49	Data Status	Active	a5240083-5706-489a-bd8f-eb5602ebd801	active
ce99dd20-1e02-48f9-8fa3-06105529f644	53e87968-8f37-452a-820a-aab79d9d0f49	Geospatial Coverage	South Australia	a5240083-5706-489a-bd8f-eb5602ebd801	active
e016895e-695c-41d2-9e74-1735fc49df9f	53e87968-8f37-452a-820a-aab79d9d0f49	Update Frequency	Annually	a5240083-5706-489a-bd8f-eb5602ebd801	active
8adb2070-03b8-400a-8056-e950842837f5	53e87968-8f37-452a-820a-aab79d9d0f49	Temporal Coverage	2011-12	a5240083-5706-489a-bd8f-eb5602ebd801	active
46b8b8c0-ae27-4fca-a07d-c687407e3a7c	53e87968-8f37-452a-820a-aab79d9d0f49	Data Location	Hosted	a5240083-5706-489a-bd8f-eb5602ebd801	active
49be3124-560f-4296-baf4-63787bf4df6b	9321792a-9adc-456e-86ed-41778d4c3add	Data Granularity	N/A	dc094180-56e4-4c2e-9dc7-c02ddacaa600	active
f6711d57-6779-4198-b6cf-031b0cfe5300	9321792a-9adc-456e-86ed-41778d4c3add	Data Status	Active	dc094180-56e4-4c2e-9dc7-c02ddacaa600	active
a2e10e85-4df7-4ec5-a973-d1a3ba5e79b9	9321792a-9adc-456e-86ed-41778d4c3add	Geospatial Coverage	South Australia	dc094180-56e4-4c2e-9dc7-c02ddacaa600	active
7b12dbe7-d56b-45a2-8241-08a5b4e096b1	9321792a-9adc-456e-86ed-41778d4c3add	Update Frequency	Annually	dc094180-56e4-4c2e-9dc7-c02ddacaa600	active
c371c5de-39b2-4738-b635-6e38b21c9b61	9321792a-9adc-456e-86ed-41778d4c3add	Temporal Coverage	2012-13	dc094180-56e4-4c2e-9dc7-c02ddacaa600	active
0870c11b-20ee-4b37-95f5-3524f447d369	9321792a-9adc-456e-86ed-41778d4c3add	Data Location	Hosted	dc094180-56e4-4c2e-9dc7-c02ddacaa600	active
d85cb002-a186-4808-a15e-f82fe5175d11	4f0afb46-fbf9-4462-b21b-3229da6bd525	Data Granularity	N/A	678dbd26-76dc-41b2-97c2-9b1c7d44d42a	active
b450fdda-a1d0-428a-bfe6-b40db9f92b93	4f0afb46-fbf9-4462-b21b-3229da6bd525	Data Status	Active	678dbd26-76dc-41b2-97c2-9b1c7d44d42a	active
c431ccec-93df-4898-9b67-fda15c1fa456	4f0afb46-fbf9-4462-b21b-3229da6bd525	Geospatial Coverage	South Australia	678dbd26-76dc-41b2-97c2-9b1c7d44d42a	active
8b35204d-0e38-4dd8-8d5b-ceeec0430055	4f0afb46-fbf9-4462-b21b-3229da6bd525	Update Frequency	Annually	678dbd26-76dc-41b2-97c2-9b1c7d44d42a	active
ce9c9c7a-4953-45ab-80eb-25fca763fbaa	4f0afb46-fbf9-4462-b21b-3229da6bd525	Temporal Coverage	2011-12	678dbd26-76dc-41b2-97c2-9b1c7d44d42a	active
931c1467-e70a-4571-9c24-90ae17aa70db	4f0afb46-fbf9-4462-b21b-3229da6bd525	Data Location	Hosted	678dbd26-76dc-41b2-97c2-9b1c7d44d42a	active
ee1690aa-8276-46bd-b02f-a03e063acbfa	3856680a-d402-4678-bc97-ccc856f10936	Update Frequency	Daily	44b3e5b3-acfe-45eb-ab17-3f3b5d69f7c7	active
59615823-0c11-4c97-8a6d-0df64c39488c	ddaf72fe-8023-46b0-9aaa-b865d1371634	Data Granularity	N/A	9d39b698-de4f-4dd5-8fd1-1d764053f882	active
75f500a5-c104-4d80-9625-cf98d6c9902d	ddaf72fe-8023-46b0-9aaa-b865d1371634	Data Status	Active	9d39b698-de4f-4dd5-8fd1-1d764053f882	active
22c11bf1-4193-4cc1-b18f-ae9ad92e3322	ddaf72fe-8023-46b0-9aaa-b865d1371634	Geospatial Coverage	South Australia	9d39b698-de4f-4dd5-8fd1-1d764053f882	active
be8c7cef-696d-46e3-9280-d708e5def32d	ddaf72fe-8023-46b0-9aaa-b865d1371634	Update Frequency	Annually	9d39b698-de4f-4dd5-8fd1-1d764053f882	active
539f290b-cb40-427b-906f-c2ee523680b0	ddaf72fe-8023-46b0-9aaa-b865d1371634	Temporal Coverage	2012-13	9d39b698-de4f-4dd5-8fd1-1d764053f882	active
e0e5403e-2181-44bf-9c07-78cb15d6dd79	ddaf72fe-8023-46b0-9aaa-b865d1371634	Data Location	Hosted	9d39b698-de4f-4dd5-8fd1-1d764053f882	active
d3479ce6-0604-4b89-a8f1-eddd993add62	2a672fc9-9178-4079-9f91-bd51adb27e09	Update Frequency	Daily	5c3b21f9-03d0-49f6-b9ba-75bb864dc260	active
be93712c-6648-47b5-a183-fbea7f8017a7	372a5f3d-52ad-4a13-bc28-d7d8c45a87c5	Update Frequency	Daily	03cf7d8f-7c68-42a7-a519-93033761c3c5	active
423b460d-0f97-4817-8b26-770b655f447f	6d3100cd-1051-4b7d-9cdc-f44e53663861	Update Frequency	Daily	79b5dd5a-a857-448e-87cd-2a295dc11c39	active
aab0bff2-7db3-4e9e-98cd-8735b2210e4b	b9d535a5-06d8-477e-a7b9-1d0b509c6707	Update Frequency	Daily	472beeac-2e28-4fbe-afc9-d7a823ac98c0	active
d83f8a22-bdf3-4756-be8d-208742106956	549f8969-8809-45d3-862b-5112b6908c16	Update Frequency	Daily	278e3f8a-064b-499c-99a2-aed33e473a3d	active
42f48e92-e461-4579-8eba-75b202a25a97	351a45df-ba35-4689-ad7c-b312889150b0	Update Frequency	Daily	1ac9eb77-52c2-4bbc-ac42-7c7d0ff2f744	active
70d8a4dd-09eb-4ef8-889e-c953947abafc	e506d838-f004-4f29-9fa9-6dfc405ed461	Update Frequency	Daily	77c0b3ce-e531-46f9-b0ca-f18b6cb63165	active
037e98d9-d2c7-4c6d-8cad-e5aa91865ba2	ed8512c5-f97a-4832-9600-3e1f31d6f828	Update Frequency	Daily	a047ae41-57bc-4ad6-a55e-cb8391a146e7	active
22f15e77-4c5c-49a5-be04-25f0b830a1eb	47c449da-02f6-401f-96dd-6c6361063582	Update Frequency	Daily	da128abf-e84b-4197-a459-2f2dee43dfaf	active
615585c0-24a1-4777-9196-527a43b90b9e	7a4cded5-df88-4011-9594-8089046249f2	Update Frequency	Daily	d9dc52d1-50cc-47bb-bfb1-7962630b4b51	active
c8aa1663-5688-4e02-af50-4408dcbf2a71	59b8332c-00c7-41d6-83cb-ddb337dd94a9	Update Frequency	Daily	ee58e737-33ba-4cc4-b255-160e94e7ce2d	active
2e66629b-9faa-4973-9325-b30dff990c27	1a6455df-e2e3-41a6-a913-59ab78efb28a	Update Frequency	Daily	836121ca-4dc5-41e3-b8d0-7e0fc29888fb	active
b2627a84-cef6-415d-acff-6db6f49ef4e0	a5bfa273-6c42-47c0-b296-dfb9cdadfb1b	Update Frequency	Daily	ca43f4b0-c889-46ce-b86c-1fa3c4d787da	active
495091e5-5e2c-4037-9ea5-b342de0086a9	bf4ff02b-ac11-4bd9-8c1a-482a75be63b1	Update Frequency	Daily	8acb2393-50c0-4f5d-be2d-98ecf26fe055	active
e966cc9c-a31c-425a-b0e8-866ed2462b7d	c4aa41bd-b63e-4d95-9c49-ea2d774c6c8a	Update Frequency	Daily	ac63ce85-efd8-4eaf-9da0-6ce465d619fd	active
96dd3c1b-f13c-45f2-93ae-7d8f69a2dca0	a28f8a1b-3074-4d7c-b8f1-14690fc81caa	Update Frequency	Daily	fe1d9441-28cd-4dd6-9a16-b0afa34e1385	active
1cbc1397-0747-4bb2-84f8-f29080c686c4	3e7b3597-20f8-40ec-9e01-e7bba2383ed5	Update Frequency	Daily	75ea78f7-de00-44ad-b694-edd4041c69a5	active
78257b41-98ae-4895-8a5d-88f0df776edc	bee847fb-5e51-4d7d-a7aa-508a10cee996	Update Frequency	Daily	208dc9c0-ac06-4764-a425-453251f1a192	active
ee5947a6-ccda-4b62-8497-6f320664e160	7d61bd9c-c5ea-493f-8eb2-7299d494ce84	Update Frequency	Daily	a5a53e7e-ba33-44c6-acaa-ddc22f8d7091	active
c6fba0ae-89ba-409d-b0b3-2f003a37911e	bb93b833-80f7-4bee-8abb-7a5307eac4e6	Update Frequency	Daily	37b76513-930c-41eb-9438-b0487b59626c	active
fcb378e7-a720-462a-a29c-195a26950133	a30630d5-d607-45a7-a654-51c7b52063bd	Update Frequency	Daily	4b529ca3-3b84-494c-b3a7-2f0a3c9702dd	active
f434aa5b-782e-4695-9f19-856b3eb7a1c5	b09e463d-c0e9-488f-9518-d0391d93da8e	Update Frequency	Daily	f1a7e14d-ffc4-4673-b58d-ac7673db5278	active
c26c218d-e035-4e34-ac7c-db00b590a01b	c51e3035-99cf-45d9-951e-2662e4658230	Update Frequency	Daily	4669134f-066b-46f9-b40e-684a0c6f7b01	active
9755d71b-4f63-4db2-b636-05c5ccb3f56b	6e46eaed-9e0a-4ab2-b373-c8e44dfd4f54	Update Frequency	Daily	bc5820cb-732e-4197-8aef-b2a852a30331	active
5052c4e0-5d51-49bd-97a6-95579f514fcc	c20b3410-586b-403c-842c-3473a02d0900	Update Frequency	Daily	9c177323-c224-4801-82a5-bed73ee31c4a	active
0701ec0a-b239-4b84-8fe7-a38afc9acbf2	baef652a-8571-476f-b21b-a811d82e39d0	Data Granularity	N/A	6364c20c-82a5-4679-943e-96a67c3745c8	active
80742a1c-21b2-426d-a51f-a299d46cf164	baef652a-8571-476f-b21b-a811d82e39d0	Data Status	N/A	6364c20c-82a5-4679-943e-96a67c3745c8	active
c3c1a6ee-da6e-4cf4-84f1-dd6194fd94bc	baef652a-8571-476f-b21b-a811d82e39d0	Geospatial Coverage	South Australia	6364c20c-82a5-4679-943e-96a67c3745c8	active
82464c22-6604-476d-bee2-35a3645a0df4	baef652a-8571-476f-b21b-a811d82e39d0	Update Frequency	Annually	6364c20c-82a5-4679-943e-96a67c3745c8	active
9e5065ee-10a5-4267-9e59-20f6fa234529	baef652a-8571-476f-b21b-a811d82e39d0	Temporal Coverage	2007-2011	6364c20c-82a5-4679-943e-96a67c3745c8	active
9740f77e-f3d1-4acd-9362-7928b9535a70	baef652a-8571-476f-b21b-a811d82e39d0	Data Location	Linked	6364c20c-82a5-4679-943e-96a67c3745c8	active
896b4103-bd4f-4e5a-af2f-0f59dfec2318	43b62c81-5f75-4c13-8360-814ec49a531f	Data Granularity	N/A	fa0baa03-d590-4d30-818e-0794736e8477	active
aeb6eccd-e29e-4c50-a725-64bc862d3ac6	43b62c81-5f75-4c13-8360-814ec49a531f	Data Status	N/A	fa0baa03-d590-4d30-818e-0794736e8477	active
450728d8-041c-44b4-89b6-349cf6e38062	43b62c81-5f75-4c13-8360-814ec49a531f	Geospatial Coverage	South Australia	fa0baa03-d590-4d30-818e-0794736e8477	active
59a19036-403e-48ae-8ac2-7e9ff74d990e	43b62c81-5f75-4c13-8360-814ec49a531f	Update Frequency	Annually	fa0baa03-d590-4d30-818e-0794736e8477	active
9039867d-8869-46f5-b918-775f1dc1b4db	43b62c81-5f75-4c13-8360-814ec49a531f	Temporal Coverage	2007-2011	fa0baa03-d590-4d30-818e-0794736e8477	active
18691084-5aed-47ad-8832-a6c411f3f99c	43b62c81-5f75-4c13-8360-814ec49a531f	Data Location	Linked	fa0baa03-d590-4d30-818e-0794736e8477	active
366af480-62f6-4c15-b5bd-4a4e4196adc1	179bd871-6585-488d-a0b1-fd483db57e11	Data Granularity	N/A	55a483f5-3a5b-4fd6-b9c3-743bd046dcb9	active
dac7acb7-fc98-4c73-9d04-875060c102c7	179bd871-6585-488d-a0b1-fd483db57e11	Data Status	N/A	55a483f5-3a5b-4fd6-b9c3-743bd046dcb9	active
c9bfa5cf-51e6-45cb-b488-d6d3f6958b22	179bd871-6585-488d-a0b1-fd483db57e11	Update Frequency	Annually	55a483f5-3a5b-4fd6-b9c3-743bd046dcb9	active
bf2aefc5-dc4a-42f5-aa13-4beec657fe81	179bd871-6585-488d-a0b1-fd483db57e11	Temporal Coverage	2007-2011	55a483f5-3a5b-4fd6-b9c3-743bd046dcb9	active
211a1c79-eb33-414f-87df-d4db5f4b4e9e	35a8d264-5fd6-4451-a8bc-71e46f2a5142	Update Frequency	Annually	d4729bca-4fd3-4693-9563-b37e50a1849f	active
d6e64c87-4b08-4a32-a2ab-3fc778510f6c	c56c892a-9179-4eb1-8a0d-35e5f9f58ec5	Data Granularity	N/A	b55431b5-ff3c-4344-9be7-76877279fb47	active
58d2071a-e612-480f-84da-6256659bb39d	c56c892a-9179-4eb1-8a0d-35e5f9f58ec5	Data Status	N/A	b55431b5-ff3c-4344-9be7-76877279fb47	active
ff613cbc-efe3-42ba-bea5-f959ece256ff	c56c892a-9179-4eb1-8a0d-35e5f9f58ec5	Update Frequency	Annually	b55431b5-ff3c-4344-9be7-76877279fb47	active
0067ff0f-3efd-4588-beeb-126acb926066	c56c892a-9179-4eb1-8a0d-35e5f9f58ec5	Temporal Coverage	2007-2011	b55431b5-ff3c-4344-9be7-76877279fb47	active
0be2c167-3cb5-4cfe-80b6-62bd2094abfa	198567b3-64fb-4415-b945-0329269b30d3	Data Granularity	N/A	237d3368-1e58-4bb7-a197-e56b7aa70e1f	active
321ee325-ad7e-42fb-8f2c-f8bb8fc67050	198567b3-64fb-4415-b945-0329269b30d3	Data Status	N/A	237d3368-1e58-4bb7-a197-e56b7aa70e1f	active
4c6c6a73-a62f-4451-8612-d3388086cd8e	198567b3-64fb-4415-b945-0329269b30d3	Geospatial Coverage	South Australia	237d3368-1e58-4bb7-a197-e56b7aa70e1f	active
1798dff1-5fd0-4294-8b79-c362bda380da	198567b3-64fb-4415-b945-0329269b30d3	Update Frequency	Annually	237d3368-1e58-4bb7-a197-e56b7aa70e1f	active
c34ed0e6-0dc4-4e42-8353-e7c4e330e3aa	198567b3-64fb-4415-b945-0329269b30d3	Temporal Coverage	2007-2011	237d3368-1e58-4bb7-a197-e56b7aa70e1f	active
3f6cf248-2864-4809-8cfb-8d4f9ed1e2ba	198567b3-64fb-4415-b945-0329269b30d3	Data Location	Linked	237d3368-1e58-4bb7-a197-e56b7aa70e1f	active
3a781f39-b169-4021-b339-0a21ba2e9a0f	662b5c78-476e-4f38-a645-c527e3d56458	Temporal Coverage	2007-2011	aabc29a7-e16f-4527-a749-8da83a0d2f08	active
bf50e413-256a-4859-be66-312d3e7dd32b	662b5c78-476e-4f38-a645-c527e3d56458	Data Granularity	N/A	aabc29a7-e16f-4527-a749-8da83a0d2f08	active
9dffe1a3-888f-4367-a202-39f390c904d2	662b5c78-476e-4f38-a645-c527e3d56458	Data Status	N/A	aabc29a7-e16f-4527-a749-8da83a0d2f08	active
1f51758a-bc1f-44c5-ab9e-6edf35473469	7358f6f6-befd-43e4-8ef5-7a6882044312	Temporal Coverage	2007-2011	8b816cef-4b6d-46a8-ba18-07ca0698f8cd	active
5c1ebc74-4640-4bf3-8b00-6178a025f510	7358f6f6-befd-43e4-8ef5-7a6882044312	Data Status	N/A	8b816cef-4b6d-46a8-ba18-07ca0698f8cd	active
b99637c7-ec0c-4e28-8465-4233ed14a6a9	7358f6f6-befd-43e4-8ef5-7a6882044312	Data Granularity	N/A	0e14bec5-9b3c-4e50-95ed-a460ed01a9a3	active
64231e21-6eb6-4daf-a2dd-554b9643a74d	7358f6f6-befd-43e4-8ef5-7a6882044312	Geospatial Coverage	Port Adelaide Enfield	8ff8b49a-9817-4bef-a35e-01d015414447	active
cd7e8bf6-af56-4a87-a6a0-b218ea8149a5	c56c892a-9179-4eb1-8a0d-35e5f9f58ec5	Geospatial Coverage	Port Lincoln	74cdbb83-77c3-42b8-9aed-f3671ad29beb	active
5bb333bc-4318-417e-8be2-4ff2b3f631e8	1cb42bb7-4e3c-4ce6-8561-9e8b838e712a	Data Location	City of Salisbury	ed81cefd-9eeb-485a-81be-69fb0a5b21ba	active
452f8493-42e4-4633-b2e2-5c9c9b351b44	1cb42bb7-4e3c-4ce6-8561-9e8b838e712a	Update Frequency	Annually	ed81cefd-9eeb-485a-81be-69fb0a5b21ba	active
eb39737b-0327-40c6-a911-43fc1911ce75	76230080-1b6f-419a-adba-99cc723a2314	Data Status	N/A	a225ddeb-4338-463d-9552-643430c45437	active
7b757b71-0f59-4873-b797-a3e7dd43b822	179bd871-6585-488d-a0b1-fd483db57e11	Geospatial Coverage	Port Pirie City and Dists	e6b37d85-e7fb-4eb4-b410-42795a2f1e66	active
b3e089ee-f8b4-4f85-8f6a-4923fa5219f0	662b5c78-476e-4f38-a645-c527e3d56458	Geospatial Coverage	Port Augusta	d4e3c7b7-3ac1-4c43-90c4-a74f67c20f3a	active
6398f3f3-1899-43a9-a79e-9e506f5f89c7	c56c892a-9179-4eb1-8a0d-35e5f9f58ec5	Data Location	Linked	f767f968-33aa-43a3-b433-e52dea0531e3	active
5d1b0950-ad95-497f-9fed-ab2022b012f7	662b5c78-476e-4f38-a645-c527e3d56458	Data Location	Link	39ce33ad-3e18-49c2-b789-2926116871ca	active
23a14faf-e3f5-43af-bd5b-2eec770f0adf	179bd871-6585-488d-a0b1-fd483db57e11	Data Location	Linked	10c53961-3fc7-413d-b16b-26e01ba71d46	active
7627e1a7-3b01-464c-bd05-52835b16d3b0	7358f6f6-befd-43e4-8ef5-7a6882044312	 Data Location	Linked	1979860c-fe71-4895-9d38-b8ea45a81447	active
e1f6a9a2-8769-401a-b1ab-9971b32bdd6f	1cb42bb7-4e3c-4ce6-8561-9e8b838e712a	Geospatial Coverage	City of Salisbury LGA	ed81cefd-9eeb-485a-81be-69fb0a5b21ba	active
d35127e7-f8b7-4e7a-91e9-34ae8707e4b8	b43228eb-b344-434e-8f81-6fa27fd7748c	Data Granularity	N/A	1b78f4c6-0b4c-4412-b104-d74dea1c84a1	active
d9788367-08f6-4a52-98e1-13ee1b56c80b	b43228eb-b344-434e-8f81-6fa27fd7748c	Data Status	N/A	1b78f4c6-0b4c-4412-b104-d74dea1c84a1	active
abf8b20b-6f75-4506-9291-123f679c0453	b43228eb-b344-434e-8f81-6fa27fd7748c	Geospatial Coverage	Prospect (C) Local Government Area	1b78f4c6-0b4c-4412-b104-d74dea1c84a1	active
2914bae7-0b5d-43a9-8f60-6e50838f0a9a	b43228eb-b344-434e-8f81-6fa27fd7748c	Update Frequency	Annually	1b78f4c6-0b4c-4412-b104-d74dea1c84a1	active
0e6d4d4a-f469-43fd-9f37-82a1813f98fc	b43228eb-b344-434e-8f81-6fa27fd7748c	Temporal Coverage	2007-2011	1b78f4c6-0b4c-4412-b104-d74dea1c84a1	active
7392571f-098e-4ab3-9267-8a09a1d230fd	b43228eb-b344-434e-8f81-6fa27fd7748c	Data Location	Linked	1b78f4c6-0b4c-4412-b104-d74dea1c84a1	active
5fdac737-cfcf-4075-b6d2-0df828d04c60	35a8d264-5fd6-4451-a8bc-71e46f2a5142	Data Location	City of Salisbury	a90e31f9-97d9-46d8-9984-fcc3b24e07ad	active
7a9959f2-c384-48cc-bfc4-6a40a979d03d	35a8d264-5fd6-4451-a8bc-71e46f2a5142	Geospatial Coverage	City of Salisbury LGA	a90e31f9-97d9-46d8-9984-fcc3b24e07ad	active
c7e2794a-8376-42aa-9d32-d9db9f3e4454	df32548e-b5cd-4259-8b02-5459a02006e5	Temporal Coverage	2007-2011	2159a50f-39a1-4499-9ef9-88bde44b89d9	active
b2a3fc0c-439c-4e74-8aba-605fb49365c8	df32548e-b5cd-4259-8b02-5459a02006e5	Data Granularity	Playford	2159a50f-39a1-4499-9ef9-88bde44b89d9	active
bc76e307-a180-4777-a3e8-de02311cd979	df32548e-b5cd-4259-8b02-5459a02006e5	Data Status	N/A	2159a50f-39a1-4499-9ef9-88bde44b89d9	active
cd0c8e8a-edd6-40e5-8eaa-a783ebcdac12	df32548e-b5cd-4259-8b02-5459a02006e5	Geospatial Coverage	Playford	2159a50f-39a1-4499-9ef9-88bde44b89d9	active
9b9eb383-c5e6-47ff-9738-77b6b6b6ab01	22eb0215-3470-4b00-ae74-3abe9fed9c7c	Data Granularity	N/A	a50f4c1f-a61e-43ba-9b21-577f7739f0ec	active
c0376554-330d-407c-9106-1b2091407f01	22eb0215-3470-4b00-ae74-3abe9fed9c7c	Data Status	N/A	a50f4c1f-a61e-43ba-9b21-577f7739f0ec	active
0dcf97b9-110e-44cb-b29d-3c5ac7fd2b22	22eb0215-3470-4b00-ae74-3abe9fed9c7c	Geospatial Coverage	Adelaide (C) Local Government Area	a50f4c1f-a61e-43ba-9b21-577f7739f0ec	active
8ed73531-49db-483a-8d8d-0313e03643f2	22eb0215-3470-4b00-ae74-3abe9fed9c7c	Update Frequency	Annually	a50f4c1f-a61e-43ba-9b21-577f7739f0ec	active
7add4c04-ddd4-46d0-b58e-4b6759670bd7	22eb0215-3470-4b00-ae74-3abe9fed9c7c	Temporal Coverage	2007-2011	a50f4c1f-a61e-43ba-9b21-577f7739f0ec	active
a70afa3d-2317-4dd2-9047-f3008ef25aa3	22eb0215-3470-4b00-ae74-3abe9fed9c7c	Data Location	Linked	a50f4c1f-a61e-43ba-9b21-577f7739f0ec	active
f3a65ff6-7b3b-4da2-9067-16271831aa2b	ca86b64e-3651-45bf-98ad-01a3c1a9a55f	Data Granularity	N/A	fca86f92-9e28-45bf-b93a-8abb4f8672ba	active
47baf4d2-8cba-45cf-9717-74c138c7609f	ca86b64e-3651-45bf-98ad-01a3c1a9a55f	Data Status	N/A	fca86f92-9e28-45bf-b93a-8abb4f8672ba	active
2d8a61dc-9fa2-4691-a847-0f86510deae7	ca86b64e-3651-45bf-98ad-01a3c1a9a55f	Geospatial Coverage	Renmark Paringa (DC) Local Government Area	fca86f92-9e28-45bf-b93a-8abb4f8672ba	active
1cc30dec-07a9-43ec-9634-7015ac71ce18	ca86b64e-3651-45bf-98ad-01a3c1a9a55f	Update Frequency	Annually	fca86f92-9e28-45bf-b93a-8abb4f8672ba	active
f015d7c2-c642-4fa8-b913-619295b46f5e	ca86b64e-3651-45bf-98ad-01a3c1a9a55f	Temporal Coverage	2007-2011	fca86f92-9e28-45bf-b93a-8abb4f8672ba	active
6241601d-e66d-4cd1-8aee-1edfa57e3f1c	ca86b64e-3651-45bf-98ad-01a3c1a9a55f	Data Location	Linked	fca86f92-9e28-45bf-b93a-8abb4f8672ba	active
cfa14e45-cf4c-46bd-937e-dbd84ec7c5fc	edc0307a-ec97-4797-bf50-57be8f1f9357	Temporal Coverage	2007-2011	f5074a8a-3fe3-494b-bc38-39a3e1ac3947	active
f4fa6a19-3d96-405b-88d4-f07b4fd37bd3	edc0307a-ec97-4797-bf50-57be8f1f9357	Data Granularity	N/A	f5074a8a-3fe3-494b-bc38-39a3e1ac3947	active
841fefcb-30be-473b-bb37-4958d8bed793	edc0307a-ec97-4797-bf50-57be8f1f9357	Data Status	N/A	f5074a8a-3fe3-494b-bc38-39a3e1ac3947	active
ef483469-15e6-4891-9c64-410c5ba2b9e1	edc0307a-ec97-4797-bf50-57be8f1f9357	Geospatial Coverage	Peterborough	f5074a8a-3fe3-494b-bc38-39a3e1ac3947	active
9aa43133-573d-4187-b37f-b0c8e38fcdcc	a521bbf5-e65b-4b86-8047-fc2424c18f88	Data Granularity	N/A	02f88c70-c18a-4189-8125-b45a791b6739	active
292e678d-f7a5-4ad8-a18b-2860130b68ae	a521bbf5-e65b-4b86-8047-fc2424c18f88	Data Status	N/A	02f88c70-c18a-4189-8125-b45a791b6739	active
458d023c-d5e6-451c-bb3d-566a9cadf7bc	a521bbf5-e65b-4b86-8047-fc2424c18f88	Geospatial Coverage	Robe (DC) Local Government Area	02f88c70-c18a-4189-8125-b45a791b6739	active
2a1a5ad6-0117-4105-8652-ca566859db99	a521bbf5-e65b-4b86-8047-fc2424c18f88	Update Frequency	Annually	02f88c70-c18a-4189-8125-b45a791b6739	active
94b03943-1816-4b8f-b2f0-cc23cc1b28e2	a521bbf5-e65b-4b86-8047-fc2424c18f88	Temporal Coverage	2007-2011	02f88c70-c18a-4189-8125-b45a791b6739	active
cecaa995-1232-4cbb-8532-e6a445484aa7	a521bbf5-e65b-4b86-8047-fc2424c18f88	Data Location	Linked	02f88c70-c18a-4189-8125-b45a791b6739	active
995cb742-7076-46db-b35e-675b5a5fe735	2a0d6531-6a1e-496d-b287-c7548125a183	Temporal Coverage	2007-2011	3ddb2236-4054-45ca-b0ca-1f3a79574cc3	active
2add1b1c-8ee3-4dc6-9979-3d0fa0e8a89a	2a0d6531-6a1e-496d-b287-c7548125a183	Data Granularity	N/A	3ddb2236-4054-45ca-b0ca-1f3a79574cc3	active
4c6f71f7-b999-4c8a-acbe-d5bb8368e619	2a0d6531-6a1e-496d-b287-c7548125a183	Data Status	N/A	3ddb2236-4054-45ca-b0ca-1f3a79574cc3	active
5c732b63-c017-41cb-84ca-ae0a29796164	2a0d6531-6a1e-496d-b287-c7548125a183	Geospatial Coverage	Orroroo Carrieton	3ddb2236-4054-45ca-b0ca-1f3a79574cc3	active
9a60bf6c-6522-475d-831c-8378cfb635c4	9d95d06d-a34d-46a0-822f-7437b4162bc3	Data Location	City of Salisbury	2c9356ff-9687-4252-9fdb-7c602f91b258	active
04107620-164f-44f3-ac92-f96d907ec070	9d95d06d-a34d-46a0-822f-7437b4162bc3	Update Frequency	Annually	2c9356ff-9687-4252-9fdb-7c602f91b258	active
8129b12c-68da-47fa-8431-afcf3740dfd1	9d95d06d-a34d-46a0-822f-7437b4162bc3	Geospatial Coverage	City of Salisbury LGA	2c9356ff-9687-4252-9fdb-7c602f91b258	active
010997e7-1439-4903-8aa9-1bdfb8933c52	264ea2ff-b0f1-497e-b9c5-3e664207ecf5	Data Location	City of Salisbury	0be46d44-7912-4b81-a6ac-2203849d1057	active
d62fe8f6-7d4c-4532-bbae-caadcd96c0d8	df32548e-b5cd-4259-8b02-5459a02006e5	Data Location	Linked	c63d3554-f830-4949-9ad7-6603ce7861c1	active
4bec3628-fcfd-4dbc-b72d-957f0c3f0e3b	4bed6b48-075c-4869-b312-a3528689e1e0	Temporal Coverage	2007-2011	64f2b4b0-e1d1-4cc0-995d-4d13923df310	active
d8b090d5-d89c-4667-a805-20cb34750ff4	4bed6b48-075c-4869-b312-a3528689e1e0	Data Granularity	N/A	64f2b4b0-e1d1-4cc0-995d-4d13923df310	active
05b86242-b713-4c59-b1f6-e5b3d5d7e46a	4bed6b48-075c-4869-b312-a3528689e1e0	Data Status	N/A	64f2b4b0-e1d1-4cc0-995d-4d13923df310	active
ee2f1656-d7fe-428f-ac5a-346c20c86ea7	4bed6b48-075c-4869-b312-a3528689e1e0	Geospatial Coverage	Onkaparinga	64f2b4b0-e1d1-4cc0-995d-4d13923df310	active
b9b12e6a-ef18-40f7-b205-673288c4e031	2a9a66b7-7d65-47a5-9f7f-61fe3de91052	Data		3f15b9d3-11a1-45dd-af8e-55803d08c77b	deleted
4ba28fbf-3a3a-44e8-aa75-c1401c393512	2a9a66b7-7d65-47a5-9f7f-61fe3de91052	Data Granularity	N/A	3f15b9d3-11a1-45dd-af8e-55803d08c77b	active
dae5665d-fde4-407f-b3ad-fa189141502c	2a9a66b7-7d65-47a5-9f7f-61fe3de91052	Data Status	N/A	3f15b9d3-11a1-45dd-af8e-55803d08c77b	active
dd5fe279-808f-477d-923a-febaa60e3cfa	2a9a66b7-7d65-47a5-9f7f-61fe3de91052	Geospatial Coverage	Roxby Downs (M) Local Government Area	3f15b9d3-11a1-45dd-af8e-55803d08c77b	active
b62939a7-c8d0-49dc-9fdc-bc1dc7e1a808	2a9a66b7-7d65-47a5-9f7f-61fe3de91052	Update Frequency	Annually	3f15b9d3-11a1-45dd-af8e-55803d08c77b	active
ab881e83-7ed4-47e4-ac62-fa602f94cde2	2a9a66b7-7d65-47a5-9f7f-61fe3de91052	Temporal Coverage	2007-2011	3f15b9d3-11a1-45dd-af8e-55803d08c77b	active
3f76f517-d5a8-4da5-b7df-22bbf58ca327	2a9a66b7-7d65-47a5-9f7f-61fe3de91052	Data Location	Linked	3f15b9d3-11a1-45dd-af8e-55803d08c77b	active
4e9bfad7-dc80-4459-ac66-04428a527803	4f9cce24-1ed0-40cb-9e9b-bd49ad8b17cf	Data Granularity	N/A	68605461-2aa4-45a3-a56e-e670ce6062e8	active
a6c7af46-e6f9-48d9-92ef-ced4776180fd	4f9cce24-1ed0-40cb-9e9b-bd49ad8b17cf	Data Status	N/A	68605461-2aa4-45a3-a56e-e670ce6062e8	active
20c0779f-7a87-45a8-9e01-9767c49e8e9c	4f9cce24-1ed0-40cb-9e9b-bd49ad8b17cf	Geospatial Coverage	Adelaide Hills (DC) Local Government Area	68605461-2aa4-45a3-a56e-e670ce6062e8	active
caff90f2-74ec-4776-8814-15662d4b6c19	4f9cce24-1ed0-40cb-9e9b-bd49ad8b17cf	Update Frequency	Annually	68605461-2aa4-45a3-a56e-e670ce6062e8	active
fc3cf1ef-e79e-420d-beae-b051c998c753	4f9cce24-1ed0-40cb-9e9b-bd49ad8b17cf	Temporal Coverage	2007-2011	68605461-2aa4-45a3-a56e-e670ce6062e8	active
aa9ac20b-ee51-4b0e-ba29-32f5dc78581c	4f9cce24-1ed0-40cb-9e9b-bd49ad8b17cf	Data Location	Linked	68605461-2aa4-45a3-a56e-e670ce6062e8	active
2ecec115-e14e-4adb-9566-c67f17075ed5	6f6886f3-ccb3-41cb-91db-d3dcc0cd0cfa	Data Location	City of Salisbury	2e338c2b-4f7f-4851-958e-9d8a2fd78f78	active
3fb5df92-f79d-4157-b843-c234a162f9e1	6f6886f3-ccb3-41cb-91db-d3dcc0cd0cfa	Update Frequency	Annually	2e338c2b-4f7f-4851-958e-9d8a2fd78f78	active
e2274542-054a-4b18-b558-46ffc227d4fa	6f6886f3-ccb3-41cb-91db-d3dcc0cd0cfa	Geospatial Coverage	City of Salisbury LGA	2e338c2b-4f7f-4851-958e-9d8a2fd78f78	active
2e50d7bb-e4d9-409d-98bc-11f2b97e3d2c	710ae662-88c9-46d2-ad15-5bb48e0a1bc8	Data Granularity	N/A	c7210aaf-b55a-4617-9890-d3efca528269	active
228c68d9-c12b-4535-8cf4-c3fa0f73cc9f	710ae662-88c9-46d2-ad15-5bb48e0a1bc8	Data Status	N/A	c7210aaf-b55a-4617-9890-d3efca528269	active
f7c12055-b487-43d7-a108-073c477bcbda	710ae662-88c9-46d2-ad15-5bb48e0a1bc8	Geospatial Coverage	Barunga West (DC) Local Government Area	c7210aaf-b55a-4617-9890-d3efca528269	active
14df0bad-1ffd-4adf-9189-190cd7cbf9be	710ae662-88c9-46d2-ad15-5bb48e0a1bc8	Update Frequency	Annually	c7210aaf-b55a-4617-9890-d3efca528269	active
08531632-cc68-4cbe-ad97-3f09f028d0a8	710ae662-88c9-46d2-ad15-5bb48e0a1bc8	Temporal Coverage	2007-2011	c7210aaf-b55a-4617-9890-d3efca528269	active
84a4700d-555f-4334-9ebf-f23daf67a574	710ae662-88c9-46d2-ad15-5bb48e0a1bc8	Data Location	Linked	c7210aaf-b55a-4617-9890-d3efca528269	active
00b9124d-a5b5-47c3-a2be-d60bb76e97c5	4bed6b48-075c-4869-b312-a3528689e1e0	Data Location	Linked	fd24550b-e5eb-4f6d-ae0b-a4ce089c0432	active
0fcfbb57-1444-4b5c-ac15-34a109672a27	264ea2ff-b0f1-497e-b9c5-3e664207ecf5	Update Frequency	Annually	0be46d44-7912-4b81-a6ac-2203849d1057	active
7a291716-96a4-4b91-8bb8-1c0d0fec7c6f	264ea2ff-b0f1-497e-b9c5-3e664207ecf5	Geospatial Coverage	City of Salisbury LGA	0be46d44-7912-4b81-a6ac-2203849d1057	active
297b5699-3c6f-494f-b30d-b45ef3947bbb	c528d5d1-4784-4680-b10b-d61196d4e93b	Data Granularity	N/A	8c0e9612-6533-4263-b035-ccd94aa87648	active
eb165587-8986-4e39-b647-18a7f6116996	c528d5d1-4784-4680-b10b-d61196d4e93b	Data Status	N/A	8c0e9612-6533-4263-b035-ccd94aa87648	active
6288e0ff-20e2-4865-bb31-ee524422b422	c528d5d1-4784-4680-b10b-d61196d4e93b	Geospatial Coverage	Alexandrina (DC) Local Government Area	8c0e9612-6533-4263-b035-ccd94aa87648	active
d785dadc-1ac8-4be3-a47c-a1b59aed6cd3	c528d5d1-4784-4680-b10b-d61196d4e93b	Update Frequency	Annually	8c0e9612-6533-4263-b035-ccd94aa87648	active
644d8231-e0bb-4767-a909-0765adda5c87	c528d5d1-4784-4680-b10b-d61196d4e93b	Temporal Coverage	2007-2011	8c0e9612-6533-4263-b035-ccd94aa87648	active
85467f0f-893d-43a8-8333-964351f7d1b2	c528d5d1-4784-4680-b10b-d61196d4e93b	Data Location	Linked	8c0e9612-6533-4263-b035-ccd94aa87648	active
07ae7b91-a621-4cef-810a-96d282d8d9bf	3803e067-b868-43ca-98e9-cb328eb9ff2b	Data Granularity	N/A	b1e9b886-99fe-433c-8eef-c9996639d316	active
6c31014a-dab8-4295-8069-b83109495497	3803e067-b868-43ca-98e9-cb328eb9ff2b	Data Status	N/A	b1e9b886-99fe-433c-8eef-c9996639d316	active
64d2a2f9-e868-4a83-b512-6bcc1dcf23bf	3803e067-b868-43ca-98e9-cb328eb9ff2b	Geospatial Coverage	Anangu Pitjantjatjara (AC) Local Government Area	b1e9b886-99fe-433c-8eef-c9996639d316	active
3aa5a2cc-de06-4484-b767-2366e2cbb533	3803e067-b868-43ca-98e9-cb328eb9ff2b	Update Frequency	Annually	b1e9b886-99fe-433c-8eef-c9996639d316	active
98cbadd2-07a9-4d7a-9534-f2e2c589473e	3803e067-b868-43ca-98e9-cb328eb9ff2b	Temporal Coverage	2007-2011	b1e9b886-99fe-433c-8eef-c9996639d316	active
72d745b8-f383-4cea-9528-8fb4d164e5a0	3803e067-b868-43ca-98e9-cb328eb9ff2b	Data Location	Linked	b1e9b886-99fe-433c-8eef-c9996639d316	active
95fe28e0-07ad-4980-bb5b-1e4de9bac439	6416437a-727a-4b89-a280-1b92712c045a	spatial		3ed7edb1-aa42-48e0-8e1d-b5a8267d8f49	active
31dd530e-108e-4f06-b957-0257434d14e0	e902efbd-eace-40dc-ac58-bbe5e11f5670	Data Location	City of Salisbury	4dfc0609-cc69-4a97-8ccf-bf14a036046b	active
88e75e57-0617-48d0-b4f1-64de5e09e146	e902efbd-eace-40dc-ac58-bbe5e11f5670	Update Frequency	Annually	4dfc0609-cc69-4a97-8ccf-bf14a036046b	active
73655eed-c699-4d06-8a88-5aa77f377456	e902efbd-eace-40dc-ac58-bbe5e11f5670	Geospatial Coverage	City of Salisbury LGA	4dfc0609-cc69-4a97-8ccf-bf14a036046b	active
34d4b5c6-3247-49e0-9cd3-48b2014c3ce1	01679c85-ea70-4fda-94e7-1ba5c4718e09	Data Location	City of Salisbury	7bfab199-a865-4d76-b89f-16e57814e1ad	active
49b12b39-fd8e-4360-adf8-d0830ab802a3	01679c85-ea70-4fda-94e7-1ba5c4718e09	Update Frequency	Annually	7bfab199-a865-4d76-b89f-16e57814e1ad	active
4afc3b59-303a-4a75-8f6c-06a4baa9db2c	01679c85-ea70-4fda-94e7-1ba5c4718e09	Geospatial Coverage	City of Salisbury LGA	7bfab199-a865-4d76-b89f-16e57814e1ad	active
2c6e2314-adb4-4631-9bee-e95dbb870381	06cdcdab-4407-4674-b884-877a8c23ecd0	Data Granularity	N/A	49c6281b-15ce-4c20-b630-093d76929f50	active
e82c5b5d-0c30-4b1b-9051-04c95ef87668	06cdcdab-4407-4674-b884-877a8c23ecd0	Data Status	N/A	49c6281b-15ce-4c20-b630-093d76929f50	active
952d4e20-ae1f-4c5c-8d02-4b9663b59101	06cdcdab-4407-4674-b884-877a8c23ecd0	Geospatial Coverage	Barossa (DC) Local Government Area	49c6281b-15ce-4c20-b630-093d76929f50	active
c0b946dc-d8dd-4277-b1f4-861ae069b5af	06cdcdab-4407-4674-b884-877a8c23ecd0	Update Frequency	Annually	49c6281b-15ce-4c20-b630-093d76929f50	active
ee410f13-2894-4027-879d-c05cd8311478	06cdcdab-4407-4674-b884-877a8c23ecd0	Temporal Coverage	2007-2011	49c6281b-15ce-4c20-b630-093d76929f50	active
52756058-5540-40fc-9212-397ddbf91451	06cdcdab-4407-4674-b884-877a8c23ecd0	Data Location	Linked	49c6281b-15ce-4c20-b630-093d76929f50	active
b6df50c0-f0ae-463c-b9bf-c95f8708a219	48935b42-5b29-4432-a7f9-f0c35a75fea8	Data Granularity	N/A	246e2366-3c53-41f0-b208-f7c3e69c7d6d	active
4cf8236b-6e50-45fc-b3db-e3fcea3f479d	48935b42-5b29-4432-a7f9-f0c35a75fea8	Data Status	N/A	246e2366-3c53-41f0-b208-f7c3e69c7d6d	active
e156f451-c986-4e5c-970a-17ad1e895588	48935b42-5b29-4432-a7f9-f0c35a75fea8	Geospatial Coverage	Berri and Barmera (DC) Local Government Area	246e2366-3c53-41f0-b208-f7c3e69c7d6d	active
97ed74bf-e5b5-424b-acea-4ec6ff27e1f6	48935b42-5b29-4432-a7f9-f0c35a75fea8	Update Frequency	Annually	246e2366-3c53-41f0-b208-f7c3e69c7d6d	active
90db77f1-55f0-41bb-abe7-26cf6df22bfc	48935b42-5b29-4432-a7f9-f0c35a75fea8	Temporal Coverage	2007-2011	246e2366-3c53-41f0-b208-f7c3e69c7d6d	active
cd4b5318-e0c9-4f68-bdee-9aafbfd0b07f	48935b42-5b29-4432-a7f9-f0c35a75fea8	Data Location	Linked	246e2366-3c53-41f0-b208-f7c3e69c7d6d	active
d47aa8d9-ab61-4669-a94c-1fa496139408	943869ff-2329-4ca4-99f1-395be0f9329c	Data Granularity	N/A	46e736ac-ee0d-47cc-9e6d-a4960ae7b474	active
6daa56b3-5aa2-4b95-b80c-3821c628829b	943869ff-2329-4ca4-99f1-395be0f9329c	Data Status	N/A	46e736ac-ee0d-47cc-9e6d-a4960ae7b474	active
9bdb7337-b2fd-4223-8606-8fc766a96a03	943869ff-2329-4ca4-99f1-395be0f9329c	Geospatial Coverage	Salisbury (C) Local Government Area	46e736ac-ee0d-47cc-9e6d-a4960ae7b474	active
bc6e7ea4-6ab0-47db-85f8-fec812536d8c	943869ff-2329-4ca4-99f1-395be0f9329c	Update Frequency	Annually	46e736ac-ee0d-47cc-9e6d-a4960ae7b474	active
6be25f75-4faf-4f5d-a3e1-fd69803c60c1	943869ff-2329-4ca4-99f1-395be0f9329c	Temporal Coverage	2007-2011	46e736ac-ee0d-47cc-9e6d-a4960ae7b474	active
c0f78735-efed-438e-9342-e18e2b11471e	943869ff-2329-4ca4-99f1-395be0f9329c	Data Location	Linked	46e736ac-ee0d-47cc-9e6d-a4960ae7b474	active
b61af0d8-ed5a-446c-b493-97a250e914eb	cc3bba7a-2340-4575-8a6f-561e8c604bd6	Data Granularity	N/A	e0ec6791-d4ca-4087-9e88-14dd9c7e98f0	active
d39a32fb-672f-43f7-9882-98d40f8200cd	cc3bba7a-2340-4575-8a6f-561e8c604bd6	Data Status	N/A	e0ec6791-d4ca-4087-9e88-14dd9c7e98f0	active
864d635c-f55e-4bb9-9de1-1625decdaad7	cc3bba7a-2340-4575-8a6f-561e8c604bd6	Geospatial Coverage	Burnside (C) Local Government Area	e0ec6791-d4ca-4087-9e88-14dd9c7e98f0	active
4e26d5f1-11b6-451a-b3fe-5cb125770c01	cc3bba7a-2340-4575-8a6f-561e8c604bd6	Update Frequency	Annually	e0ec6791-d4ca-4087-9e88-14dd9c7e98f0	active
ea7d00ff-a748-447e-aae3-5a60de61bfd3	cc3bba7a-2340-4575-8a6f-561e8c604bd6	Temporal Coverage	2007-2011	e0ec6791-d4ca-4087-9e88-14dd9c7e98f0	active
47c24aba-a575-4966-af93-eebde8c4fba3	cc3bba7a-2340-4575-8a6f-561e8c604bd6	Data Location	Linked	e0ec6791-d4ca-4087-9e88-14dd9c7e98f0	active
04969217-a3b8-4489-b560-faad1f2beccd	1612db12-2bf2-4d0b-9dd4-b5ae609bad2a	Data Granularity	N/A	e4a879f6-fb6c-40e6-a5f6-5daa8ce331c4	active
ec3fd36d-c8a3-467a-9a98-efd54e55735d	1612db12-2bf2-4d0b-9dd4-b5ae609bad2a	Data Status	N/A	e4a879f6-fb6c-40e6-a5f6-5daa8ce331c4	active
c62717fb-9894-408e-ab59-9f14d196751a	1612db12-2bf2-4d0b-9dd4-b5ae609bad2a	Geospatial Coverage	Southern Mallee (DC) Local Government Area	e4a879f6-fb6c-40e6-a5f6-5daa8ce331c4	active
18af4812-8f67-4e89-82ac-de335af61787	1612db12-2bf2-4d0b-9dd4-b5ae609bad2a	Update Frequency	Annually	e4a879f6-fb6c-40e6-a5f6-5daa8ce331c4	active
e489d0a1-c8e4-47d1-9c8f-87855823468a	1612db12-2bf2-4d0b-9dd4-b5ae609bad2a	Temporal Coverage	2007-2011	e4a879f6-fb6c-40e6-a5f6-5daa8ce331c4	active
259363bf-af30-45ed-a497-9e200e4a3caf	1612db12-2bf2-4d0b-9dd4-b5ae609bad2a	Data Location	Linked	e4a879f6-fb6c-40e6-a5f6-5daa8ce331c4	active
5a2007e3-c2ba-4af4-baa2-3adbb4be62cc	b057d8db-4a45-4075-84df-133403b7f436	Data Granularity	N/A	d3012c82-18dc-4f0e-a1f9-0e563dd1b6a3	active
b54b0b60-9708-416b-a114-625a0f5896f9	b057d8db-4a45-4075-84df-133403b7f436	Data Status	N/A	d3012c82-18dc-4f0e-a1f9-0e563dd1b6a3	active
89fbcdaf-be41-4c2f-9c27-e406d3168302	b057d8db-4a45-4075-84df-133403b7f436	Geospatial Coverage	Streaky Bay (DC) Local Government Area	d3012c82-18dc-4f0e-a1f9-0e563dd1b6a3	active
2b99f8f5-ba3c-44fe-a4dd-e4f92adb9b7d	b057d8db-4a45-4075-84df-133403b7f436	Update Frequency	Annually	d3012c82-18dc-4f0e-a1f9-0e563dd1b6a3	active
18da52f7-b408-4057-a2a6-f0d89a161fb8	b057d8db-4a45-4075-84df-133403b7f436	Temporal Coverage	2007-2011	d3012c82-18dc-4f0e-a1f9-0e563dd1b6a3	active
3799077b-ed4f-4e08-9818-44e19d0bb0d2	b057d8db-4a45-4075-84df-133403b7f436	Data Location	Linked	d3012c82-18dc-4f0e-a1f9-0e563dd1b6a3	active
9c3815e0-3455-4541-9fe4-c385d0ea1ab6	ffb997ef-54f2-4762-ad7f-c38374715ef5	Update Frequency	Annually	d8011ac3-1636-47fd-ab86-982de6e4959d	active
1498740b-e329-4713-8ef8-f3c80c9e3499	ffb997ef-54f2-4762-ad7f-c38374715ef5	Data Granularity	N/A	d8011ac3-1636-47fd-ab86-982de6e4959d	active
b1e1295a-abd7-4801-be9a-cc1d9591562a	ffb997ef-54f2-4762-ad7f-c38374715ef5	Geospatial Coverage	Campbelltown (C) Local Government Area	d8011ac3-1636-47fd-ab86-982de6e4959d	active
611d51b7-c54c-4024-b958-7fb9003bb34d	ea1cb8f9-d6ec-4da9-9346-54b58218b005	 Data Granularity	N/A	1baa1a2b-3864-4abc-b587-03de098b7141	active
9fa41b77-6aed-4f3e-ac63-8d9281f928e7	ea1cb8f9-d6ec-4da9-9346-54b58218b005	Geospatial Coverage	Light	1baa1a2b-3864-4abc-b587-03de098b7141	active
6152305f-9fcf-4653-aa53-e403926e38d0	ea1cb8f9-d6ec-4da9-9346-54b58218b005	Update Frequency	Annually	1baa1a2b-3864-4abc-b587-03de098b7141	active
332256c5-7921-42a3-818d-5be4ad4fbb24	ea1cb8f9-d6ec-4da9-9346-54b58218b005	Temporal Coverage	2007-2011	1baa1a2b-3864-4abc-b587-03de098b7141	active
e18095bc-9cea-4235-844e-f7dd960439c0	ea1cb8f9-d6ec-4da9-9346-54b58218b005	Data Status	N/A	1baa1a2b-3864-4abc-b587-03de098b7141	active
50e94a24-2660-4d82-96da-3e92a5c98c4b	b7c5d80c-0944-4b95-ad07-7082a8fa0e0a	Data Granularity	N/A	3f70ac16-beb6-4d5f-aa3a-b3f9b5350599	active
8f0b4ab1-c1a8-4b84-af15-12f96584ab85	b7c5d80c-0944-4b95-ad07-7082a8fa0e0a	Data Status	N/A	3f70ac16-beb6-4d5f-aa3a-b3f9b5350599	active
477f8858-80df-4925-81ed-fc4ff4919394	b7c5d80c-0944-4b95-ad07-7082a8fa0e0a	Geospatial Coverage	Lower Eyre Peninsula	3f70ac16-beb6-4d5f-aa3a-b3f9b5350599	active
62366285-e2a7-4832-9660-de0c17d73cfa	b7c5d80c-0944-4b95-ad07-7082a8fa0e0a	Update Frequency	Annually	3f70ac16-beb6-4d5f-aa3a-b3f9b5350599	active
d84bc393-96f7-4a5f-8fb2-98661d7a2d89	b7c5d80c-0944-4b95-ad07-7082a8fa0e0a	Temporal Coverage	2007-2011	3f70ac16-beb6-4d5f-aa3a-b3f9b5350599	active
352ea77e-93ca-4292-a356-00338b4cd138	1442cec5-dd1f-427e-a12a-4839f3379bd4	Data Granularity	N/A	c6b624c0-e657-47a0-aca5-3168ab368615	active
f9fa8ec2-44c2-4802-abf4-8bcbf0a8110d	1442cec5-dd1f-427e-a12a-4839f3379bd4	Data Status	N/A	c6b624c0-e657-47a0-aca5-3168ab368615	active
c435224d-f38d-4fb5-8a1f-018873143023	1442cec5-dd1f-427e-a12a-4839f3379bd4	Geospatial Coverage	Loxton Waikerie	c6b624c0-e657-47a0-aca5-3168ab368615	active
528fd29c-cc26-4d8d-826e-2ec96bb9dbb9	1442cec5-dd1f-427e-a12a-4839f3379bd4	Update Frequency	Annually	c6b624c0-e657-47a0-aca5-3168ab368615	active
4abf5877-721d-4d23-aa3f-a33c1631adfe	1442cec5-dd1f-427e-a12a-4839f3379bd4	Temporal Coverage	2007-2011	c6b624c0-e657-47a0-aca5-3168ab368615	active
75254949-f6b2-4b6e-abb0-3aec172b739f	8b78c8c5-18f3-47a2-a63c-2da708d59589	Data Granularity	N/A	d3a8ee60-33a1-4fc8-9c47-52be0750ebda	active
9b2c215c-46c5-4fa9-ac84-eb61b93a61b9	8b78c8c5-18f3-47a2-a63c-2da708d59589	Data Status	N/A	d3a8ee60-33a1-4fc8-9c47-52be0750ebda	active
f2167959-3974-43e1-b410-f122e7b44de6	8b78c8c5-18f3-47a2-a63c-2da708d59589	Geospatial Coverage	Mallala	d3a8ee60-33a1-4fc8-9c47-52be0750ebda	active
ca0750f1-5720-494f-b432-a611b451f369	8b78c8c5-18f3-47a2-a63c-2da708d59589	Update Frequency	Annually	d3a8ee60-33a1-4fc8-9c47-52be0750ebda	active
7e2a4706-ea17-475d-b2a8-f9be8daca8cd	8b78c8c5-18f3-47a2-a63c-2da708d59589	Temporal Coverage	2007-2011	d3a8ee60-33a1-4fc8-9c47-52be0750ebda	active
57bcc7ee-2d87-4db3-ac22-bb43e9c2cdd8	c1b9308d-f2a1-4b2b-8247-60cd63e6ec12	Data Granularity	N/A	d0f71273-c318-4502-9276-b616fb04ab5b	active
a1e77b40-fcc9-4594-9e4d-2a5d255ac23c	c1b9308d-f2a1-4b2b-8247-60cd63e6ec12	Data Status	N/A	d0f71273-c318-4502-9276-b616fb04ab5b	active
8011e135-7d8d-419f-b90a-e312d1104e1a	c1b9308d-f2a1-4b2b-8247-60cd63e6ec12	Geospatial Coverage	Marion	d0f71273-c318-4502-9276-b616fb04ab5b	active
39c57193-3845-4d35-baa2-92d467b4cecd	c1b9308d-f2a1-4b2b-8247-60cd63e6ec12	Update Frequency	Annually	d0f71273-c318-4502-9276-b616fb04ab5b	active
06e22deb-ad2f-47d1-94aa-c7c6ca21e0e4	c1b9308d-f2a1-4b2b-8247-60cd63e6ec12	Temporal Coverage	2007-2011	d0f71273-c318-4502-9276-b616fb04ab5b	active
e21cc518-2043-413c-b7ba-a04b6da8c065	7a86206e-565d-4704-a993-5e2537c47973	Data Granularity	N/A	6f5b0838-a261-499b-86b9-06461665f3eb	active
30278f93-4c77-42c8-a1e7-290dad5a7629	7a86206e-565d-4704-a993-5e2537c47973	Data Status	N/A	6f5b0838-a261-499b-86b9-06461665f3eb	active
d553215a-3fda-4425-ad60-80b545a6dd59	7a86206e-565d-4704-a993-5e2537c47973	Geospatial Coverage	Mid Murray	6f5b0838-a261-499b-86b9-06461665f3eb	active
518c4bad-da61-4c0d-a27a-0c68b51ecca9	7a86206e-565d-4704-a993-5e2537c47973	Update Frequency	Annually	6f5b0838-a261-499b-86b9-06461665f3eb	active
f5d4166c-b835-4181-8b5d-c68a8b2e7a08	7a86206e-565d-4704-a993-5e2537c47973	Temporal Coverage	2007-2011	6f5b0838-a261-499b-86b9-06461665f3eb	active
be4072eb-db30-40f5-bf06-5b18283c208a	3604e917-c1d1-4111-9d56-b3705091d40c	Data Granularity	N/A	ba0b0a8d-fc10-4b58-9058-1befe7a8a051	active
fc478b2d-8b52-4285-ae12-d51037773fb0	3604e917-c1d1-4111-9d56-b3705091d40c	Data Status	N/A	ba0b0a8d-fc10-4b58-9058-1befe7a8a051	active
418e96d7-8fd8-4224-8d67-250733745c36	3604e917-c1d1-4111-9d56-b3705091d40c	Geospatial Coverage	Mitchum	ba0b0a8d-fc10-4b58-9058-1befe7a8a051	active
2d90a4d2-d25b-48d1-b44a-d6710450771c	3604e917-c1d1-4111-9d56-b3705091d40c	Update Frequency	Annually	ba0b0a8d-fc10-4b58-9058-1befe7a8a051	active
b52dc010-dfa8-4689-a7c4-eb6a248b42ef	3604e917-c1d1-4111-9d56-b3705091d40c	Temporal Coverage	2007-2011	ba0b0a8d-fc10-4b58-9058-1befe7a8a051	active
0a32bbe1-84a0-462f-8364-d50bf801b2ac	e59eb360-7e67-40a6-913f-46ebb5f2b36a	Update Frequency	Annually	2275f606-afa9-4cf2-86db-c25de4880b02	active
2acf1405-48fe-4ae5-adc2-fb9d08c56daf	e59eb360-7e67-40a6-913f-46ebb5f2b36a	Data Granularity	N/A	2275f606-afa9-4cf2-86db-c25de4880b02	active
5bad872a-376f-422e-b2c8-432e6d67f5a2	240827d3-a350-4b95-87f9-6e55e1c89fe5	Data Granularity	N/A	81e07181-b82d-418e-8c12-4bbcaa1a30aa	active
01584951-9882-4e6f-8931-45c690977146	8b78c8c5-18f3-47a2-a63c-2da708d59589	Data Location	Linked	de0a7013-fe65-4116-8a38-bb8a5ee8a8fd	active
04b0ea1d-fd29-4ace-9753-ec94e4ae77bb	b7c5d80c-0944-4b95-ad07-7082a8fa0e0a	Data Location	Linked	2cc181b7-ef20-45a0-9187-a94ef2e7ed70	active
7952d137-3f89-49f0-a98f-22df83a847b6	c1b9308d-f2a1-4b2b-8247-60cd63e6ec12	Data Location	Linked	729dcdcd-b5e8-4833-a07d-f9654e4746fe	active
50e59923-16fd-4f8d-98f0-9f80d3c8c65e	3604e917-c1d1-4111-9d56-b3705091d40c	Data Location	Linked	a979e6ee-ee37-43da-a378-f5edec456fc8	active
4a8d511c-41e2-4175-9620-193dc688cbf8	b748e223-c41c-4fd9-a102-4aa0bf616a11	Data Status	N/A	68b36f81-293b-4a91-81c2-0846aae5fc45	active
9f1c98b9-2073-452a-8117-14e4601504d8	edc0307a-ec97-4797-bf50-57be8f1f9357	Data Location	Linked	6019bfa3-be94-4dc2-925b-8e5ca759b659	active
bc9917ac-4084-434c-899b-6f8a8abd8768	1442cec5-dd1f-427e-a12a-4839f3379bd4	Data Location	Linked	bbe60767-bca9-4d67-b586-9be7ebf7be17	active
19a0dc7c-4b9b-4339-99e0-945bdb13556a	e59eb360-7e67-40a6-913f-46ebb5f2b36a	Geospatial Coverage	Ceduna (DC) Local Government Area	2275f606-afa9-4cf2-86db-c25de4880b02	active
e533db56-6759-4b6c-80ee-e031c8c647a1	6416437a-727a-4b89-a280-1b92712c045a	data_state	active	3ed7edb1-aa42-48e0-8e1d-b5a8267d8f49	active
146fcb33-866b-42cf-9740-3aed46f1540f	2984bbc7-ad05-4489-952e-15f8aed49e69	Data Granularity	N/A	f4da0381-8bd6-4f27-93ab-6246dc40f88b	active
c0ff799e-271f-46ca-93e6-35cbb97d8d4d	2984bbc7-ad05-4489-952e-15f8aed49e69	Data Status	N/A	f4da0381-8bd6-4f27-93ab-6246dc40f88b	active
18aea915-f3a7-420a-ba87-0ed78bc3772c	2984bbc7-ad05-4489-952e-15f8aed49e69	Geospatial Coverage	Clare and Gilbert Valleys (DC) Local Government Area	f4da0381-8bd6-4f27-93ab-6246dc40f88b	active
b9adedcc-b02a-4ce2-a42e-0b900637f2a4	2984bbc7-ad05-4489-952e-15f8aed49e69	Update Frequency	Annually	f4da0381-8bd6-4f27-93ab-6246dc40f88b	active
3259a89d-f30a-40f6-8714-f3a0ac1bbc33	2984bbc7-ad05-4489-952e-15f8aed49e69	Temporal Coverage	2007-2011	f4da0381-8bd6-4f27-93ab-6246dc40f88b	active
c928c9b0-c36e-4aed-ba2f-74ef4e092c5b	2984bbc7-ad05-4489-952e-15f8aed49e69	Data Location	Linked	f4da0381-8bd6-4f27-93ab-6246dc40f88b	active
3c79fc7e-dc34-4806-94e6-bf3780c81cf4	a036641a-c7f6-4491-a8f3-0ed733215804	Data Granularity	N/A	ac8571f1-f691-4b30-b88d-eaec09b3d36e	active
02fad7d2-e519-48fb-afe6-23776d0e11c3	a036641a-c7f6-4491-a8f3-0ed733215804	Data Status	N/A	ac8571f1-f691-4b30-b88d-eaec09b3d36e	active
c7869b6f-9ec5-43ce-a17f-33d778af472f	a036641a-c7f6-4491-a8f3-0ed733215804	Geospatial Coverage	Cleve (DC) Local Government Area	ac8571f1-f691-4b30-b88d-eaec09b3d36e	active
c141c306-6a08-406b-bad1-3426931dada3	a036641a-c7f6-4491-a8f3-0ed733215804	Update Frequency	Annually	ac8571f1-f691-4b30-b88d-eaec09b3d36e	active
e7a0b8b6-82ea-42d9-ba63-d2d7fd32ee2b	a036641a-c7f6-4491-a8f3-0ed733215804	Temporal Coverage	2007-2011	ac8571f1-f691-4b30-b88d-eaec09b3d36e	active
42bb3951-4a7e-4cf9-abe0-b9a3fe95995c	a036641a-c7f6-4491-a8f3-0ed733215804	Data Location	Linked	ac8571f1-f691-4b30-b88d-eaec09b3d36e	active
887405d4-46fe-403e-ad0b-fbaa0a8a4444	240827d3-a350-4b95-87f9-6e55e1c89fe5	Temporal Coverage	2007-2011	81e07181-b82d-418e-8c12-4bbcaa1a30aa	active
38ca327b-0794-436a-8c35-f7a031eb35d0	821512e8-c7a7-43ea-a1d9-783634567335	Data Granularity	N/A	9caa6f0b-3e9b-4975-9391-92b8c8cc209c	active
e6bebe1e-c1b0-4f8b-94ca-8f6f65b85358	821512e8-c7a7-43ea-a1d9-783634567335	Data Status	N/A	9caa6f0b-3e9b-4975-9391-92b8c8cc209c	active
50d59c68-3aea-4390-b8d3-3764cad3dfde	821512e8-c7a7-43ea-a1d9-783634567335	Geospatial Coverage	Mount Gambier	9caa6f0b-3e9b-4975-9391-92b8c8cc209c	active
e1f068ab-5247-451e-a616-cbc312c4e3e4	821512e8-c7a7-43ea-a1d9-783634567335	Update Frequency	Annually	9caa6f0b-3e9b-4975-9391-92b8c8cc209c	active
d891b807-5965-4e3d-b3ca-a80083765c4f	821512e8-c7a7-43ea-a1d9-783634567335	Temporal Coverage	2007-2011	9caa6f0b-3e9b-4975-9391-92b8c8cc209c	active
fbb125a9-bf5d-4b3d-bff0-9db4aaa21023	a6714470-102d-4283-ba21-5024a08f9d28	Data Granularity	N/A	6bf60f30-1650-45c3-a508-63b2539b6a81	active
574c0d52-1c76-4d9c-849c-df6086c915f2	a6714470-102d-4283-ba21-5024a08f9d28	Data Status	N/A	6bf60f30-1650-45c3-a508-63b2539b6a81	active
41e31761-5fdb-457a-a3de-d9ea5417dcf4	a6714470-102d-4283-ba21-5024a08f9d28	Geospatial Coverage	Mount Remarkable	6bf60f30-1650-45c3-a508-63b2539b6a81	active
c8e0448f-f70e-43b1-9783-146d388cec24	a6714470-102d-4283-ba21-5024a08f9d28	Update Frequency	Annually	6bf60f30-1650-45c3-a508-63b2539b6a81	active
d75c60b0-2847-4572-9288-1973bb4837e6	a6714470-102d-4283-ba21-5024a08f9d28	Temporal Coverage	2007-2011	6bf60f30-1650-45c3-a508-63b2539b6a81	active
e27ff59c-5b53-4881-9cb7-e09389fd5358	f4f90064-c1cd-4a1d-a569-e8d370e71e42	Data Granularity	N/A	38c7d3f9-d14a-42a4-a4ce-a5b7475410b6	active
b1a01c4a-a7b3-41f3-96dd-6a9f3ff96fa2	f4f90064-c1cd-4a1d-a569-e8d370e71e42	Data Status	N/A	38c7d3f9-d14a-42a4-a4ce-a5b7475410b6	active
79ee0134-c8b4-486a-90d5-28969c28ebb7	f4f90064-c1cd-4a1d-a569-e8d370e71e42	Geospatial Coverage	Naracoorte and Lucindale	38c7d3f9-d14a-42a4-a4ce-a5b7475410b6	active
48fdf10b-2605-4f40-9e24-7a4db83a6c91	f4f90064-c1cd-4a1d-a569-e8d370e71e42	Update Frequency	Annually	38c7d3f9-d14a-42a4-a4ce-a5b7475410b6	active
97c3e9f8-f5e3-4251-ad2d-24b3ed998ca5	f4f90064-c1cd-4a1d-a569-e8d370e71e42	Temporal Coverage	2007-2011	38c7d3f9-d14a-42a4-a4ce-a5b7475410b6	active
e42f9bc9-1620-4341-b901-b189c60005eb	3f1332e3-ce09-4b87-99a5-0c92334e86f9	Data Granularity	N/A	92c8e982-45c5-430f-bf06-5e499e217a33	active
c25d7237-a0a5-46ee-ab7a-5b2e0ac10f45	3f1332e3-ce09-4b87-99a5-0c92334e86f9	Data Status	N/A	92c8e982-45c5-430f-bf06-5e499e217a33	active
666e6b41-8c9e-45cf-af9d-f4ceac4960a4	3f1332e3-ce09-4b87-99a5-0c92334e86f9	Geospatial Coverage	Tatiara (DC) Local Government Area	92c8e982-45c5-430f-bf06-5e499e217a33	active
843a4b5b-87a8-40d9-8701-33c56e7f6ac3	3f1332e3-ce09-4b87-99a5-0c92334e86f9	Update Frequency	Annually	92c8e982-45c5-430f-bf06-5e499e217a33	active
2e0a1a20-20b6-4956-baf4-bcf68c99bf95	3f1332e3-ce09-4b87-99a5-0c92334e86f9	Temporal Coverage	2007-2011	92c8e982-45c5-430f-bf06-5e499e217a33	active
263fa461-e4d5-43d5-bd7a-c9cb78440ed6	3f1332e3-ce09-4b87-99a5-0c92334e86f9	Data Location	Linked	92c8e982-45c5-430f-bf06-5e499e217a33	active
3983e51c-e6ea-4346-8e6a-9347b06f9252	5e599130-3739-4275-8bac-3cf787588c25	Data Granularity	N/A	4b6400c1-bb3d-4b24-b0a3-97f780d3766b	active
b9902589-2bbd-46f7-a07f-348c7aa06e67	5e599130-3739-4275-8bac-3cf787588c25	Data Status	N/A	4b6400c1-bb3d-4b24-b0a3-97f780d3766b	active
e269634a-7f68-4ea6-8546-294f46751acc	5e599130-3739-4275-8bac-3cf787588c25	Geospatial Coverage	Tea Tree Gully (C) Local Government Area	4b6400c1-bb3d-4b24-b0a3-97f780d3766b	active
53aeb090-1387-4899-b3e5-3312f0ff1fda	5e599130-3739-4275-8bac-3cf787588c25	Update Frequency	Annually	4b6400c1-bb3d-4b24-b0a3-97f780d3766b	active
7bedc5d3-afd3-4614-bc98-db2e38af747a	5e599130-3739-4275-8bac-3cf787588c25	Temporal Coverage	2007-2011	4b6400c1-bb3d-4b24-b0a3-97f780d3766b	active
5d8542b9-fa0d-42c4-ba90-18a6b8ce435d	5e599130-3739-4275-8bac-3cf787588c25	Data Location	Linked	4b6400c1-bb3d-4b24-b0a3-97f780d3766b	active
649d66b8-c019-4586-9d4f-84312bee6299	240827d3-a350-4b95-87f9-6e55e1c89fe5	Data Location	Linked	64d13bac-01b3-4f01-8a12-f4a2b6aa6ec8	active
2f7a10a1-d27f-42e6-8c9b-141c105d94c2	821512e8-c7a7-43ea-a1d9-783634567335	Data Location	Linked	df18b2b1-1d67-4b2e-bb57-be1c7d6a0a9e	active
db1de3ea-e6f6-429b-b2cf-6a81af0a5228	a6714470-102d-4283-ba21-5024a08f9d28	Data Location	Linked	d4712f3d-72d3-433c-abc9-b12441280f8d	active
8800ad14-3290-49f3-b6d3-b682308b5977	f4f90064-c1cd-4a1d-a569-e8d370e71e42	Data Location	Linked	d0f61a5d-75be-4901-9f82-053cfab332d7	active
13450569-ba5d-4d10-89cf-9edf9802aa5c	8bfe1b88-c585-4bfc-b5af-26c4be880f01	Data Granularity	N/A	25d252d7-9db3-4f52-87f9-74a225337e11	active
5b8bc326-cf35-477d-b117-89ad7cc97f73	8bfe1b88-c585-4bfc-b5af-26c4be880f01	Data Status	N/A	25d252d7-9db3-4f52-87f9-74a225337e11	active
38a946ff-5927-40eb-add7-9fcbe5d21a92	8bfe1b88-c585-4bfc-b5af-26c4be880f01	Geospatial Coverage	Murray Bridge	25d252d7-9db3-4f52-87f9-74a225337e11	active
5244fd50-4b7f-4d2b-8a3a-390782696ea9	8bfe1b88-c585-4bfc-b5af-26c4be880f01	Update Frequency	Annually	25d252d7-9db3-4f52-87f9-74a225337e11	active
6adfd00a-1929-4bf8-afa7-990a9908d9f7	8bfe1b88-c585-4bfc-b5af-26c4be880f01	Temporal Coverage	2007-2011	25d252d7-9db3-4f52-87f9-74a225337e11	active
cf17a726-3ed4-4488-ade9-c697a9dad468	b6eacb3a-134d-4676-a25d-01efc5e5afb7	Data Granularity	N/A	bff2b6c5-a97d-4b6c-97b2-ec60e1c63fa9	active
a152a688-8221-4c9c-8042-769132d633a4	b6eacb3a-134d-4676-a25d-01efc5e5afb7	Data Status	N/A	bff2b6c5-a97d-4b6c-97b2-ec60e1c63fa9	active
0befb03a-11ec-4df1-8d1f-8c507ab411ea	b6eacb3a-134d-4676-a25d-01efc5e5afb7	Geospatial Coverage	Charles Sturt (C) Local Government Area	bff2b6c5-a97d-4b6c-97b2-ec60e1c63fa9	active
5564eac3-fed1-462d-8a14-e48998037e21	b6eacb3a-134d-4676-a25d-01efc5e5afb7	Update Frequency	Annually	bff2b6c5-a97d-4b6c-97b2-ec60e1c63fa9	active
3ba3eda1-04af-4a35-a684-d6f46e9c1897	b6eacb3a-134d-4676-a25d-01efc5e5afb7	Temporal Coverage	2007-2011	bff2b6c5-a97d-4b6c-97b2-ec60e1c63fa9	active
185c8dcd-69e4-479e-94a5-9d8e1bb5f190	b6eacb3a-134d-4676-a25d-01efc5e5afb7	Data Location	Linked	bff2b6c5-a97d-4b6c-97b2-ec60e1c63fa9	active
60fefcb9-3654-42a9-ac23-5b403cbe0709	9683f764-4033-474f-b742-9bbc4688dee1	Data Granularity	N/A	e622a284-847c-4018-9c47-4f6f133c6c44	active
48399650-8d4f-4d11-a47a-b3668b886aaa	9683f764-4033-474f-b742-9bbc4688dee1	Data Status	N/A	e622a284-847c-4018-9c47-4f6f133c6c44	active
44cb99ff-8d16-401a-a9d7-b2dbd69cd6c6	9683f764-4033-474f-b742-9bbc4688dee1	Geospatial Coverage	http://www.ocsar.sa.gov.au/region_files/LGA%20The%20Coorong%20(DC).html	e622a284-847c-4018-9c47-4f6f133c6c44	active
2171ce2f-afd7-4c84-b1a1-b962f49b9626	9683f764-4033-474f-b742-9bbc4688dee1	Update Frequency	Annually	e622a284-847c-4018-9c47-4f6f133c6c44	active
25e19a63-0c07-42b8-a150-4e9a4dc280d9	9683f764-4033-474f-b742-9bbc4688dee1	Temporal Coverage	2007-2011	e622a284-847c-4018-9c47-4f6f133c6c44	active
92cd1feb-693e-4080-bd96-910344e2aefb	9683f764-4033-474f-b742-9bbc4688dee1	Data Location	Linked	e622a284-847c-4018-9c47-4f6f133c6c44	active
902e328c-5330-457f-9ab1-5c27b41d370e	8bfe1b88-c585-4bfc-b5af-26c4be880f01	Data Location	Linked	6a9cfbf0-0369-4ec8-9690-97a1bc3e7430	active
d6e6cd38-0f77-4372-a3df-b4ee5ef9ffa1	483a6d7c-2556-4599-a6c9-567c0faa3229	Data Granularity	N/A	676a5d2e-04b6-4824-a696-e90799c9f4b9	active
d6704564-adb4-4dc8-8ae3-21a3399c1995	483a6d7c-2556-4599-a6c9-567c0faa3229	Data Status	N/A	676a5d2e-04b6-4824-a696-e90799c9f4b9	active
491d0b62-b91e-457a-93e6-e483d8faaee0	483a6d7c-2556-4599-a6c9-567c0faa3229	Geospatial Coverage	Northern Areas	676a5d2e-04b6-4824-a696-e90799c9f4b9	active
e75a93d4-e2fa-4147-9b6f-f24d96bfd1a8	483a6d7c-2556-4599-a6c9-567c0faa3229	Update Frequency	Annually	676a5d2e-04b6-4824-a696-e90799c9f4b9	active
c429642e-9ecb-42b7-aa03-44c7ce3f9cb4	483a6d7c-2556-4599-a6c9-567c0faa3229	Temporal Coverage	2007-2011	676a5d2e-04b6-4824-a696-e90799c9f4b9	active
d3ee17dc-fd88-454c-bae3-09bd1906871d	4f76da87-64ec-4f00-a1d4-e0fc9db289da	Data Granularity	N/A	c416ff59-96f6-4ade-b00f-786ef809469d	active
590bde67-1370-4e45-abdd-194b9c75aebd	4f76da87-64ec-4f00-a1d4-e0fc9db289da	Data Status	N/A	c416ff59-96f6-4ade-b00f-786ef809469d	active
61eaff7f-6162-4947-bb68-4d78648d089d	4f76da87-64ec-4f00-a1d4-e0fc9db289da	Geospatial Coverage	Norwood Payneham St Peters	c416ff59-96f6-4ade-b00f-786ef809469d	active
5c02667f-a2b2-47ca-8f92-6162b1ffb961	4f76da87-64ec-4f00-a1d4-e0fc9db289da	Update Frequency	Annually	c416ff59-96f6-4ade-b00f-786ef809469d	active
68855880-2242-4283-896a-7302f2a0eef9	4f76da87-64ec-4f00-a1d4-e0fc9db289da	Temporal Coverage	2007-2011	c416ff59-96f6-4ade-b00f-786ef809469d	active
c5cd10d7-78d6-4319-8b5f-bae788f145e9	483a6d7c-2556-4599-a6c9-567c0faa3229	Data Location	Linked	b9fcb210-919d-44b1-8562-234a3470c5ed	active
80e07879-de21-45d8-a77e-2b07e4e7d7a0	4f76da87-64ec-4f00-a1d4-e0fc9db289da	Data Location	Linked	59ab3b95-63c7-4b85-a62a-5a0246f738a9	active
ce121eb4-34d3-4a2c-9c63-9a110bd2d4f0	ea1cb8f9-d6ec-4da9-9346-54b58218b005	Data Location	Link	5f5bf4a0-66c7-47c5-b2e1-8fdb2ee74950	active
809ee2d4-0955-44ac-a161-fc36b15a5408	8b1bbf8a-51d3-42a2-ac9f-28b04a52a3be	Data Granularity	N/A	aa2fd86c-627f-4827-9e21-fdd202267726	active
cb7aa9e7-25a4-4f1c-851a-6fb9ade3fce7	8b1bbf8a-51d3-42a2-ac9f-28b04a52a3be	Data Status	N/A	aa2fd86c-627f-4827-9e21-fdd202267726	active
d1fae0fb-c504-4b0f-9f65-fdc3dfbe0772	8b1bbf8a-51d3-42a2-ac9f-28b04a52a3be	Geospatial Coverage	Coober Pedy (DC) Local Government Area	aa2fd86c-627f-4827-9e21-fdd202267726	active
1bc8e6f7-a1f4-43b6-8b94-1a37eb3027b5	8b1bbf8a-51d3-42a2-ac9f-28b04a52a3be	Update Frequency	Annually	aa2fd86c-627f-4827-9e21-fdd202267726	active
1a428140-f68b-46d1-bf27-894208790199	8b1bbf8a-51d3-42a2-ac9f-28b04a52a3be	Temporal Coverage	2007-2011	aa2fd86c-627f-4827-9e21-fdd202267726	active
a51bf129-28fc-4486-a37f-38a745c24d79	8b1bbf8a-51d3-42a2-ac9f-28b04a52a3be	Data Location	Linked	aa2fd86c-627f-4827-9e21-fdd202267726	active
62347b7d-ebab-419f-bb80-bb1daa77efae	7358f6f6-befd-43e4-8ef5-7a6882044312	Update Frequency	Annually	2bc768b2-8977-4803-bb68-3ad702384e5f	active
5cd0af70-a0e5-4fe1-95a6-c57d30394532	9d677757-884c-4712-84f3-f98a5c8211e8	Data Granularity	N/A	8da8002f-9844-4885-99a4-795fd69ba8f4	active
9b16e6e6-aae7-4877-9416-0bb3f75768f3	9d677757-884c-4712-84f3-f98a5c8211e8	Data Status	N/A	8da8002f-9844-4885-99a4-795fd69ba8f4	active
e6d936d4-203d-49b1-898f-c0a4be632afa	9d677757-884c-4712-84f3-f98a5c8211e8	Geospatial Coverage	Tumby Bay (DC) Local Government Area	8da8002f-9844-4885-99a4-795fd69ba8f4	active
86ce8f4e-3ee8-4e3e-affb-a173af7c6574	9d677757-884c-4712-84f3-f98a5c8211e8	Update Frequency	Annually	8da8002f-9844-4885-99a4-795fd69ba8f4	active
fe82a13a-c85b-4578-aa86-a3a23aecd8cf	9d677757-884c-4712-84f3-f98a5c8211e8	Temporal Coverage	2007-2011	8da8002f-9844-4885-99a4-795fd69ba8f4	active
820f0aee-b6dc-4405-bced-45fc25182052	9d677757-884c-4712-84f3-f98a5c8211e8	Data Location	Linked	8da8002f-9844-4885-99a4-795fd69ba8f4	active
e1250e11-ced3-49a6-bd4a-f9704ac3e8e6	662b5c78-476e-4f38-a645-c527e3d56458	Update Frequency	Annually	39ce33ad-3e18-49c2-b789-2926116871ca	active
0dd7ac90-1089-4682-a1a3-e84d7fa11f1d	424f787f-6839-43e9-a5ef-67bab94331f3	Data Granularity	N/A	4629017d-8108-4f70-b3f5-8fe4cc3c2927	active
005fe837-f305-49d9-b280-e5dbecaee0e6	424f787f-6839-43e9-a5ef-67bab94331f3	Data Status	N/A	4629017d-8108-4f70-b3f5-8fe4cc3c2927	active
a2b09f2b-e2fc-4b1b-b5fd-6025a7d295aa	d3bc4d40-3fb6-45b8-b25d-2c88fb92e917	Data Location	Linked	b32c6759-240f-4d24-a0fa-c4a40ba8d466	active
0a7ebb63-0a1a-4eaa-b4e6-56491914dce5	424f787f-6839-43e9-a5ef-67bab94331f3	Geospatial Coverage	Copper Coast (DC) Local Government Area	4629017d-8108-4f70-b3f5-8fe4cc3c2927	active
e11457ca-87c5-4b99-bc0e-7e945e0f79a6	424f787f-6839-43e9-a5ef-67bab94331f3	Update Frequency	Annually	4629017d-8108-4f70-b3f5-8fe4cc3c2927	active
ed1dd0d5-e77f-494a-b02d-443c4815c1a6	424f787f-6839-43e9-a5ef-67bab94331f3	Temporal Coverage	2007-2011	4629017d-8108-4f70-b3f5-8fe4cc3c2927	active
5eaa9a73-0944-45cd-9ab0-e64f6188c6bd	424f787f-6839-43e9-a5ef-67bab94331f3	Data Location	Linked	4629017d-8108-4f70-b3f5-8fe4cc3c2927	active
49e455d2-3d06-43f8-937d-77bba09ff722	4ec703e0-5329-4de1-8b9f-d5ef3fc1cc09	Data Granularity	N/A	af286ca5-39b8-4044-915a-22d322ac23c8	active
7652fdc3-6520-4a3d-ae02-358b5ac69e4a	4ec703e0-5329-4de1-8b9f-d5ef3fc1cc09	Data Status	N/A	af286ca5-39b8-4044-915a-22d322ac23c8	active
f052b1f0-ac2f-4914-8066-a491301c008c	4ec703e0-5329-4de1-8b9f-d5ef3fc1cc09	Geospatial Coverage	Unincorporated SA	af286ca5-39b8-4044-915a-22d322ac23c8	active
542159ef-1bd4-4033-8b26-ba87e14eba2c	4ec703e0-5329-4de1-8b9f-d5ef3fc1cc09	Update Frequency	Annually	af286ca5-39b8-4044-915a-22d322ac23c8	active
878dc2f0-7d03-4ba4-92b8-fbd990d1679d	4ec703e0-5329-4de1-8b9f-d5ef3fc1cc09	Temporal Coverage	2007-2011	af286ca5-39b8-4044-915a-22d322ac23c8	active
7cb6794a-54fe-4ea3-9981-bea5981fe1d9	4ec703e0-5329-4de1-8b9f-d5ef3fc1cc09	Data Location	Linked	af286ca5-39b8-4044-915a-22d322ac23c8	active
7de24152-efc4-404e-8caa-758da6336049	7a86206e-565d-4704-a993-5e2537c47973	Data Location	Linked	fbd68c09-7001-4a10-8088-ac251fa98566	active
0a825915-bf5c-480d-b1e8-7f4ae7384ccd	d323f822-806f-4c22-b4a5-50eb0416fbc2	Data Granularity	N/A	3eff4079-ca01-477f-a709-663c33ea5fd6	active
9e674f16-150f-4037-bda2-9c620a010071	d323f822-806f-4c22-b4a5-50eb0416fbc2	Data Status	N/A	3eff4079-ca01-477f-a709-663c33ea5fd6	active
369d8bb9-d029-4b2c-aa20-e33ddaa8184f	d323f822-806f-4c22-b4a5-50eb0416fbc2	Geospatial Coverage	Unley (C) Local Government Area	3eff4079-ca01-477f-a709-663c33ea5fd6	active
839a8d81-9819-4301-b62e-fdef25e92c34	d323f822-806f-4c22-b4a5-50eb0416fbc2	Update Frequency	Annually	3eff4079-ca01-477f-a709-663c33ea5fd6	active
77fe1ee9-1451-4a33-9987-6a655c8c96f6	d323f822-806f-4c22-b4a5-50eb0416fbc2	Temporal Coverage	2007-2011	3eff4079-ca01-477f-a709-663c33ea5fd6	active
e75fc021-1679-44b6-b764-29b9830cce30	d323f822-806f-4c22-b4a5-50eb0416fbc2	Data Location	Linked	3eff4079-ca01-477f-a709-663c33ea5fd6	active
e22e2115-448a-4914-88fc-69b206478306	76dc6887-9cbe-44f2-99b5-dac94dcff4da	Data Granularity	N/A	1cf4f09c-f7dd-48a1-8ff5-62e67da177d4	active
4d12a54e-d550-465f-a9cc-8e70d2641c6c	76dc6887-9cbe-44f2-99b5-dac94dcff4da	Data Status	N/A	1cf4f09c-f7dd-48a1-8ff5-62e67da177d4	active
460fbe30-c0ae-4bf5-9231-ab37be8935d9	76dc6887-9cbe-44f2-99b5-dac94dcff4da	Geospatial Coverage	Victor Harbor (C) Local Government Area	1cf4f09c-f7dd-48a1-8ff5-62e67da177d4	active
535c66f8-1812-44a5-9d8e-e650f44e85fc	76dc6887-9cbe-44f2-99b5-dac94dcff4da	Update Frequency	Annually	1cf4f09c-f7dd-48a1-8ff5-62e67da177d4	active
21460a94-10ff-46e9-9639-10e5b1b77de8	76dc6887-9cbe-44f2-99b5-dac94dcff4da	Temporal Coverage	2007-2011	1cf4f09c-f7dd-48a1-8ff5-62e67da177d4	active
1f695738-f5fe-41e0-9468-bfb14cad5236	76dc6887-9cbe-44f2-99b5-dac94dcff4da	Data Location	Linked	1cf4f09c-f7dd-48a1-8ff5-62e67da177d4	active
a1e25ffa-378d-426b-9df6-af89aac5cb37	772ca66b-236f-4205-b7d2-0c31b1a394f9	Data Granularity	N/A	c4653b85-2986-4922-9421-2b76b2131f52	active
ae9821ff-76ed-4ce9-a6fb-5736f6d32a23	772ca66b-236f-4205-b7d2-0c31b1a394f9	Data Status	N/A	c4653b85-2986-4922-9421-2b76b2131f52	active
856c7b17-6013-4bfd-a813-14b0da1ea9eb	772ca66b-236f-4205-b7d2-0c31b1a394f9	Geospatial Coverage	Elliston (DC) Local Government Area	c4653b85-2986-4922-9421-2b76b2131f52	active
bf933a1b-dcc0-453f-b584-478c8130c993	772ca66b-236f-4205-b7d2-0c31b1a394f9	Update Frequency	Annually	c4653b85-2986-4922-9421-2b76b2131f52	active
53740b99-29cb-42cd-a62a-69b65558f56e	772ca66b-236f-4205-b7d2-0c31b1a394f9	Temporal Coverage	2007-2011	c4653b85-2986-4922-9421-2b76b2131f52	active
cfbc722a-c128-4b01-96e7-b5f64c50ed96	772ca66b-236f-4205-b7d2-0c31b1a394f9	Data Location	Linked	c4653b85-2986-4922-9421-2b76b2131f52	active
de71c609-7b97-4ce1-b689-8395ab506474	b748e223-c41c-4fd9-a102-4aa0bf616a11	Data Granularity	N/A	68b36f81-293b-4a91-81c2-0846aae5fc45	active
d271c60f-8488-45a8-a57e-6248b93d3173	b748e223-c41c-4fd9-a102-4aa0bf616a11	Geospatial Coverage	Wakefield (DC) Local Government Area	68b36f81-293b-4a91-81c2-0846aae5fc45	active
cee0e1d8-a753-466a-866c-80f4c6b0697f	b748e223-c41c-4fd9-a102-4aa0bf616a11	Update Frequency	Annually	68b36f81-293b-4a91-81c2-0846aae5fc45	active
6bd3453f-69d2-4442-a901-27343fcd3aec	b748e223-c41c-4fd9-a102-4aa0bf616a11	Temporal Coverage	2007-2011	68b36f81-293b-4a91-81c2-0846aae5fc45	active
c95a909e-c708-4e73-a943-18e23967390d	b748e223-c41c-4fd9-a102-4aa0bf616a11	Data Location	Linked	68b36f81-293b-4a91-81c2-0846aae5fc45	active
68856c9c-3e9d-43d7-9073-5cb032830bc5	b946725e-190f-4995-9c53-30a0a8315dd4	Data Granularity	N/A	1ee22994-d98d-476a-a374-5e44e7fce135	active
5f067d69-eb44-4dc3-a849-cecf0219233a	b946725e-190f-4995-9c53-30a0a8315dd4	Data Status	N/A	1ee22994-d98d-476a-a374-5e44e7fce135	active
a09c034b-6272-4c86-90a9-3343c0e45b6f	b946725e-190f-4995-9c53-30a0a8315dd4	Geospatial Coverage	Walkerville (M) Local Government Area	1ee22994-d98d-476a-a374-5e44e7fce135	active
62f22daa-ebbc-4943-93f7-0333a055ea01	b946725e-190f-4995-9c53-30a0a8315dd4	Update Frequency	Annually	1ee22994-d98d-476a-a374-5e44e7fce135	active
bc1c8eb8-0a13-4b55-b3aa-7e5257471232	b946725e-190f-4995-9c53-30a0a8315dd4	Temporal Coverage	2007-2011	1ee22994-d98d-476a-a374-5e44e7fce135	active
4d0e92f1-2889-44a9-9bb4-fbd68d1a266c	b946725e-190f-4995-9c53-30a0a8315dd4	Data Location	Linked	1ee22994-d98d-476a-a374-5e44e7fce135	active
0c0473b4-f280-4703-b4a9-a3305ad3a25a	d3bc4d40-3fb6-45b8-b25d-2c88fb92e917	Data Granularity	N/A	b32c6759-240f-4d24-a0fa-c4a40ba8d466	active
1d156c6a-7358-43b6-a75d-335bb6d2b5a9	d3bc4d40-3fb6-45b8-b25d-2c88fb92e917	Data Status	N/A	b32c6759-240f-4d24-a0fa-c4a40ba8d466	active
4ac6bb72-9434-4b05-88bc-10939d13c223	d3bc4d40-3fb6-45b8-b25d-2c88fb92e917	Geospatial Coverage	Wattle Range (DC) Local Government Area	b32c6759-240f-4d24-a0fa-c4a40ba8d466	active
48ef3a12-0c75-43c7-8103-1476fb7dedd3	d3bc4d40-3fb6-45b8-b25d-2c88fb92e917	Update Frequency	Annually	b32c6759-240f-4d24-a0fa-c4a40ba8d466	active
0443caa0-6b24-466b-8e78-146d19424e0b	d3bc4d40-3fb6-45b8-b25d-2c88fb92e917	Temporal Coverage	2007-2011	b32c6759-240f-4d24-a0fa-c4a40ba8d466	active
bf50b9a4-89ac-48ef-8d84-4eb495c9aca0	ec2dd02e-cdfd-4cd1-80ec-670593bcae4a	Data Granularity	N/A	366bb803-acf7-4547-b864-129fafe601d2	active
f1de69d1-e115-4af0-b181-ed66dc0dbc97	ec2dd02e-cdfd-4cd1-80ec-670593bcae4a	Data Status	N/A	366bb803-acf7-4547-b864-129fafe601d2	active
3df8f747-971d-4169-bbf8-100d51b771ec	ec2dd02e-cdfd-4cd1-80ec-670593bcae4a	Geospatial Coverage	West Torrens (C) Local Government Area	366bb803-acf7-4547-b864-129fafe601d2	active
eac1a137-042f-47b4-8553-55c476d9d809	ec2dd02e-cdfd-4cd1-80ec-670593bcae4a	Update Frequency	Annually	366bb803-acf7-4547-b864-129fafe601d2	active
0178532a-ab7c-4667-930d-037aef258073	ec2dd02e-cdfd-4cd1-80ec-670593bcae4a	Temporal Coverage	2007-2011	366bb803-acf7-4547-b864-129fafe601d2	active
ee92a713-1b79-47b7-b5ac-6988e4929c5a	ec2dd02e-cdfd-4cd1-80ec-670593bcae4a	Data Location	Linked	366bb803-acf7-4547-b864-129fafe601d2	active
f64a3c3c-880a-4858-8abf-68a385fc00fb	bd50f83d-19a9-487e-8fea-85be5c761ca5	Data Granularity	N/A	4992ce9e-f2c5-4893-8cf8-a69cd87475d3	active
9c7314ff-a407-4808-b1b3-ba564942a4a7	bd50f83d-19a9-487e-8fea-85be5c761ca5	Data Status	N/A	4992ce9e-f2c5-4893-8cf8-a69cd87475d3	active
6b7e52b7-a8b1-4dc2-8662-09d17182cf77	bd50f83d-19a9-487e-8fea-85be5c761ca5	Geospatial Coverage	Yorke Peninsula (DC) Local Government Area	4992ce9e-f2c5-4893-8cf8-a69cd87475d3	active
c0362d7b-eb8a-4fb8-8c4a-be811baf2aa9	bd50f83d-19a9-487e-8fea-85be5c761ca5	Update Frequency	Annually	4992ce9e-f2c5-4893-8cf8-a69cd87475d3	active
5fe65112-b1bf-49ee-9942-e9bac922c857	bd50f83d-19a9-487e-8fea-85be5c761ca5	Temporal Coverage	2007-2011	4992ce9e-f2c5-4893-8cf8-a69cd87475d3	active
7864d83b-e265-4103-a697-edab02615380	bd50f83d-19a9-487e-8fea-85be5c761ca5	Data Location	Linked	4992ce9e-f2c5-4893-8cf8-a69cd87475d3	active
29a1e9ba-9f36-43f6-8f24-0ae8d6abfb12	00c76a19-126c-4889-95f5-131ba026c764	Data Granularity	N/A	7c439139-205a-4678-844b-9996e028f71d	active
5862692f-9bb9-4f7c-93ff-1813724b897b	00c76a19-126c-4889-95f5-131ba026c764	Data Status	N/A	7c439139-205a-4678-844b-9996e028f71d	active
83fac34c-e6db-4224-99ae-13f055893b6a	00c76a19-126c-4889-95f5-131ba026c764	Geospatial Coverage	Flinders Ranges (DC) Local Government Area	7c439139-205a-4678-844b-9996e028f71d	active
5fa01e49-14f2-4efe-ab19-8c00af377cc0	00c76a19-126c-4889-95f5-131ba026c764	Update Frequency	Annually	7c439139-205a-4678-844b-9996e028f71d	active
ed37fb59-cf6e-4b4c-a097-831ca652d96c	00c76a19-126c-4889-95f5-131ba026c764	Temporal Coverage	2007-2011	7c439139-205a-4678-844b-9996e028f71d	active
0b75f58d-ab49-477b-a727-72bbd39daaee	00c76a19-126c-4889-95f5-131ba026c764	Data Location	Linked	7c439139-205a-4678-844b-9996e028f71d	active
862fff3f-fa73-4574-a13a-5a60b643b19d	bb7500c8-8f84-45d3-bce7-71e41db5e18c	Data Granularity	N/A	6b587042-e580-4f09-8727-4df32e73b1d6	active
81a84cfa-506d-4c11-838d-16fbe0bf07f4	bb7500c8-8f84-45d3-bce7-71e41db5e18c	Data Status	N/A	6b587042-e580-4f09-8727-4df32e73b1d6	active
ac998d48-70bc-4337-a1dd-5a13065b1c6f	bb7500c8-8f84-45d3-bce7-71e41db5e18c	Geospatial Coverage	Franklin Harbour (DC) Local Government Area	6b587042-e580-4f09-8727-4df32e73b1d6	active
5fc72a26-1226-463d-9c13-8b53b82d7ff2	bb7500c8-8f84-45d3-bce7-71e41db5e18c	Update Frequency	Annually	6b587042-e580-4f09-8727-4df32e73b1d6	active
a008f3b5-55b0-4356-a87a-6a7436985f44	bb7500c8-8f84-45d3-bce7-71e41db5e18c	Temporal Coverage	2007-2011	6b587042-e580-4f09-8727-4df32e73b1d6	active
cc0ef32e-5266-4250-add5-a648c272502e	bb7500c8-8f84-45d3-bce7-71e41db5e18c	Data Location	Linked	6b587042-e580-4f09-8727-4df32e73b1d6	active
dbe0fdba-48fb-4cf7-ae8d-322f1aa7f084	e653699b-1dd5-439a-8e44-2b52decb0f5e	Data Granularity	N/A	6fcc2002-af06-4504-b849-ffebc905b326	active
9a8a3c0b-c060-49df-a156-9aabe6b64ba5	e653699b-1dd5-439a-8e44-2b52decb0f5e	Data Status	N/A	6fcc2002-af06-4504-b849-ffebc905b326	active
9c2b1792-0c45-4fa1-ba2d-ede47efd479e	e653699b-1dd5-439a-8e44-2b52decb0f5e	Geospatial Coverage	Gawler (T) Local Government Area	6fcc2002-af06-4504-b849-ffebc905b326	active
4c6a0b6e-3574-4c9b-bd8f-12c840e32bcf	e653699b-1dd5-439a-8e44-2b52decb0f5e	Update Frequency	Annually	6fcc2002-af06-4504-b849-ffebc905b326	active
8fd75dc4-18f8-4b42-a070-13c2a9978bea	e653699b-1dd5-439a-8e44-2b52decb0f5e	Temporal Coverage	2007-2011	6fcc2002-af06-4504-b849-ffebc905b326	active
dec63736-d23f-422b-b443-29007ebf6b13	e653699b-1dd5-439a-8e44-2b52decb0f5e	Data Location	Linked	6fcc2002-af06-4504-b849-ffebc905b326	active
b7f287f4-99f0-491d-b86f-635680cc18fc	2a0d6531-6a1e-496d-b287-c7548125a183	Data Location	Linked	49b5b164-3a2b-4979-b870-bac56d50f7b2	active
3fa9cd13-97ab-4698-b547-692b918329df	89e864c9-c799-4c63-b901-415da057fdcc	Data Location	Linked	cae6ad62-c954-4600-8910-583fc59388e3	active
c7ae76f9-308b-428e-9997-6e02f3e0cf4a	89e864c9-c799-4c63-b901-415da057fdcc	Update Frequency	Immediate	cae6ad62-c954-4600-8910-583fc59388e3	active
4e0dcd50-c460-4314-8e50-0624c960853f	89e864c9-c799-4c63-b901-415da057fdcc	Geospatial Coverage	Australian-wide	cae6ad62-c954-4600-8910-583fc59388e3	active
62073eab-fe49-4013-a8a6-0a54dc5f43d0	e9ff7b52-b603-451b-a57f-8c032f5091d3	Data Granularity	N/A	5dd51d32-1d61-4f53-8eb2-cc13b3a459f1	active
0b66216e-5676-4c48-b4dc-cd13d0083ed2	e9ff7b52-b603-451b-a57f-8c032f5091d3	Data Status	N/A	5dd51d32-1d61-4f53-8eb2-cc13b3a459f1	active
c8ad0f4e-a489-4e49-b2ac-c01cdec8885a	e9ff7b52-b603-451b-a57f-8c032f5091d3	Geospatial Coverage	Whyalla (C) Local Government Area	5dd51d32-1d61-4f53-8eb2-cc13b3a459f1	active
916a7518-93d9-45a6-b2be-76ea25ab89a9	e9ff7b52-b603-451b-a57f-8c032f5091d3	Update Frequency	Annually	5dd51d32-1d61-4f53-8eb2-cc13b3a459f1	active
6d469b9f-9f14-4de2-8604-2579b840340e	e9ff7b52-b603-451b-a57f-8c032f5091d3	Temporal Coverage	2007-2011	5dd51d32-1d61-4f53-8eb2-cc13b3a459f1	active
ee503e7d-40db-4739-a62b-50bb0d782a8c	e9ff7b52-b603-451b-a57f-8c032f5091d3	Data Location	Linked	5dd51d32-1d61-4f53-8eb2-cc13b3a459f1	active
3d10881e-024c-4965-a33b-cd775c60135a	89e864c9-c799-4c63-b901-415da057fdcc	Temporal Coverage	June - July 2014	c81defd8-1b32-468f-8e27-45f812b8dabc	active
12ea7905-ba16-4dd4-9341-978f08aae17e	b14ce4ff-bb8f-4a9f-8641-1981686dfa33	Data Granularity	N/A	b2020618-f4fc-447c-b1b0-2e25ece0aa21	active
fb7105a4-01bf-4908-b471-8458525c67c5	b14ce4ff-bb8f-4a9f-8641-1981686dfa33	Data Status	N/A	b2020618-f4fc-447c-b1b0-2e25ece0aa21	active
4523979f-518a-4ebf-9b10-edd117611250	b14ce4ff-bb8f-4a9f-8641-1981686dfa33	Geospatial Coverage	Wudinna (DC) Local Government Area	b2020618-f4fc-447c-b1b0-2e25ece0aa21	active
40acfd75-42de-4dab-8f60-0abe4153dd5a	b14ce4ff-bb8f-4a9f-8641-1981686dfa33	Update Frequency	Annually	b2020618-f4fc-447c-b1b0-2e25ece0aa21	active
500ee201-ed64-46a7-99a9-7767815eec5a	b14ce4ff-bb8f-4a9f-8641-1981686dfa33	Temporal Coverage	2007-2011	b2020618-f4fc-447c-b1b0-2e25ece0aa21	active
1ef756a5-3fa4-4e29-b203-14f26b7ec428	b14ce4ff-bb8f-4a9f-8641-1981686dfa33	Data Location	Linked	b2020618-f4fc-447c-b1b0-2e25ece0aa21	active
42070e19-646d-49fa-a932-458cd2c8db39	47f695d5-ba24-4946-a4a4-6fdcc5895dc7	Data Granularity	N/A	72527b3e-e464-44c0-bc1f-4108f37615eb	active
dd915242-79b2-4992-8030-cba1afa00d02	47f695d5-ba24-4946-a4a4-6fdcc5895dc7	Data Status	N/A	72527b3e-e464-44c0-bc1f-4108f37615eb	active
1a921183-e2d0-438a-bd17-c06971298fe4	47f695d5-ba24-4946-a4a4-6fdcc5895dc7	Geospatial Coverage	Yankalilla (DC) Local Government Area	72527b3e-e464-44c0-bc1f-4108f37615eb	active
056046c4-298f-4f46-bc69-99d0d3886b1d	47f695d5-ba24-4946-a4a4-6fdcc5895dc7	Update Frequency	Annually	72527b3e-e464-44c0-bc1f-4108f37615eb	active
59187c0b-e655-4935-842c-6463e7a22576	47f695d5-ba24-4946-a4a4-6fdcc5895dc7	Temporal Coverage	2007-2011	72527b3e-e464-44c0-bc1f-4108f37615eb	active
ef46c1b3-786e-46fd-931b-42989fa96a47	47f695d5-ba24-4946-a4a4-6fdcc5895dc7	Data Location	Linked	72527b3e-e464-44c0-bc1f-4108f37615eb	active
5674588e-a076-422d-a6b7-67f1d07a99ee	b73e0996-72d2-42f4-8543-42a6510f0082	Data Granularity	N/A	54bdff8a-aa7d-467e-b7c3-2c82128a4d59	active
26258f40-f434-49f0-9b8a-67744724709a	b73e0996-72d2-42f4-8543-42a6510f0082	Data Status	N/A	54bdff8a-aa7d-467e-b7c3-2c82128a4d59	active
0ce47e6b-1742-4bbe-bdd0-3afa653f4847	b73e0996-72d2-42f4-8543-42a6510f0082	Geospatial Coverage	Goyder (DC) Local Government Area	54bdff8a-aa7d-467e-b7c3-2c82128a4d59	active
99148a49-77cc-4b31-9384-1472f60928ce	b73e0996-72d2-42f4-8543-42a6510f0082	Update Frequency	Annually	54bdff8a-aa7d-467e-b7c3-2c82128a4d59	active
4e016e6d-dd67-47ad-8163-2ea028d3f57c	b73e0996-72d2-42f4-8543-42a6510f0082	Temporal Coverage	2007-2011	54bdff8a-aa7d-467e-b7c3-2c82128a4d59	active
f669a96e-ad59-4f6f-bd7d-01284086384b	b73e0996-72d2-42f4-8543-42a6510f0082	Data Location	Linked	54bdff8a-aa7d-467e-b7c3-2c82128a4d59	active
8bd205d4-7e37-48d3-be3c-75375c147956	58750bb9-5c71-4d62-8f57-6eb9858a23b7	Data Granularity	N/A	3de29a10-a9b2-42cf-a50a-5b40b8eb3278	active
1f7685a7-8c3c-4afa-acd8-1ff3fce51843	58750bb9-5c71-4d62-8f57-6eb9858a23b7	Data Status	N/A	3de29a10-a9b2-42cf-a50a-5b40b8eb3278	active
cf15306b-5012-4cf8-af27-cbe5268d41bb	58750bb9-5c71-4d62-8f57-6eb9858a23b7	Geospatial Coverage	Grant (DC) Local Government Area	3de29a10-a9b2-42cf-a50a-5b40b8eb3278	active
9cf7b5df-ebc5-4daa-8e17-b1500ad5f3f8	58750bb9-5c71-4d62-8f57-6eb9858a23b7	Update Frequency	Annually	3de29a10-a9b2-42cf-a50a-5b40b8eb3278	active
15644669-3539-4a0f-9267-04f21327b864	58750bb9-5c71-4d62-8f57-6eb9858a23b7	Temporal Coverage	2007-2011	3de29a10-a9b2-42cf-a50a-5b40b8eb3278	active
562ff8f1-86e7-44bf-9f8c-cd6dbbfb7556	58750bb9-5c71-4d62-8f57-6eb9858a23b7	Data Location	Linked	3de29a10-a9b2-42cf-a50a-5b40b8eb3278	active
00423c0f-c822-4db3-b3da-e3cd10ea193a	d73a62b2-a105-46aa-bd16-11e738e04f66	Data Granularity	Financial Year	54411bda-f043-47be-bd04-2197da3ec2d2	active
72fe3011-7f39-4638-a5f3-76fdbfce1fdc	d73a62b2-a105-46aa-bd16-11e738e04f66	Data Status	Active	54411bda-f043-47be-bd04-2197da3ec2d2	active
c48ff42d-00ab-47f5-90b2-8e440fee302d	d73a62b2-a105-46aa-bd16-11e738e04f66	Geospatial Coverage	South Australia	54411bda-f043-47be-bd04-2197da3ec2d2	active
f77fe247-fab8-4f4c-a0d9-31b026c081d1	d73a62b2-a105-46aa-bd16-11e738e04f66	Update Frequency	Annually	54411bda-f043-47be-bd04-2197da3ec2d2	active
777dae52-ebc5-4301-9503-72c396d31096	d73a62b2-a105-46aa-bd16-11e738e04f66	Temporal Coverage	2008-09 to 2012-13	54411bda-f043-47be-bd04-2197da3ec2d2	active
803298ab-fa5d-4425-873f-0eec47e3339e	d73a62b2-a105-46aa-bd16-11e738e04f66	Data Location	Hosted	54411bda-f043-47be-bd04-2197da3ec2d2	active
4bc3b325-6dfa-4156-b0ac-a68e077c5725	e7772452-c3da-4c39-974b-b16a03cc6618	Data Granularity	N/A	f5c5c3d2-fa27-4e76-946a-b85b80124905	active
f021ae98-a305-4c67-a702-bb8ed4cb2945	e7772452-c3da-4c39-974b-b16a03cc6618	Data Status	N/A	f5c5c3d2-fa27-4e76-946a-b85b80124905	active
ecb8d3a7-ac65-46d3-8355-ba40cba90621	e7772452-c3da-4c39-974b-b16a03cc6618	Geospatial Coverage	Holdfast Bay (C) Local Government Area	f5c5c3d2-fa27-4e76-946a-b85b80124905	active
df3ce5ac-d1ef-4c5e-8d8a-0bb8e1376e5a	e7772452-c3da-4c39-974b-b16a03cc6618	Update Frequency	Annually	f5c5c3d2-fa27-4e76-946a-b85b80124905	active
fadc1ecf-faa5-4e36-b938-9b6466ffb510	e7772452-c3da-4c39-974b-b16a03cc6618	Temporal Coverage	2007-2011	f5c5c3d2-fa27-4e76-946a-b85b80124905	active
130bd5dc-9e4e-4e4f-b1b2-627e161a3a45	e7772452-c3da-4c39-974b-b16a03cc6618	Data Location	Linked	f5c5c3d2-fa27-4e76-946a-b85b80124905	active
d7281474-2fe6-4fd3-9b7b-059dcaf44b41	80e32891-3ca9-448c-b232-9a0c3af6d596	Data Granularity	N/A	7e0051b2-ee23-4714-bfa7-b91983b9b5ff	active
bde16d4e-62e2-479b-be54-1cb7ee10d065	80e32891-3ca9-448c-b232-9a0c3af6d596	Data Status	N/A	7e0051b2-ee23-4714-bfa7-b91983b9b5ff	active
349617f1-4ae9-45a0-8aee-648ad1357f87	80e32891-3ca9-448c-b232-9a0c3af6d596	Geospatial Coverage	http://www.ocsar.sa.gov.au/region_files/LGA%20Kangaroo%20Island%20%28DC%29.html	7e0051b2-ee23-4714-bfa7-b91983b9b5ff	active
36bdac84-80d3-4b6f-a6d8-f612884d2b56	80e32891-3ca9-448c-b232-9a0c3af6d596	Update Frequency	Annually	7e0051b2-ee23-4714-bfa7-b91983b9b5ff	active
d92e35cb-bbe0-4ab1-a78a-0f44b9a8de37	80e32891-3ca9-448c-b232-9a0c3af6d596	Temporal Coverage	2007-2011	7e0051b2-ee23-4714-bfa7-b91983b9b5ff	active
87bc71c4-4623-44a1-853c-eefed3a98e72	80e32891-3ca9-448c-b232-9a0c3af6d596	Data Location	Linked	7e0051b2-ee23-4714-bfa7-b91983b9b5ff	active
cf70266f-9ebc-458e-9e8d-2f71525d0a1f	51a36ab6-9d9a-4f61-bd1c-4444845afc39	Data Granularity	N/A	3f901e21-3643-43be-a224-56b4c583d626	active
596292fc-dfae-49cc-881b-3546fc91149c	51a36ab6-9d9a-4f61-bd1c-4444845afc39	Data Status	N/A	3f901e21-3643-43be-a224-56b4c583d626	active
b92bffa0-eed3-4118-838f-fad7d2e39da2	51a36ab6-9d9a-4f61-bd1c-4444845afc39	Geospatial Coverage	Karoonda East Murray (DC) Local Government Area	3f901e21-3643-43be-a224-56b4c583d626	active
c791064b-1d2f-4eda-9827-8f00f9333178	51a36ab6-9d9a-4f61-bd1c-4444845afc39	Update Frequency	Annually	3f901e21-3643-43be-a224-56b4c583d626	active
82bf743b-e199-43d2-9a1b-6ddf74c2a630	51a36ab6-9d9a-4f61-bd1c-4444845afc39	Temporal Coverage	2007-2011	3f901e21-3643-43be-a224-56b4c583d626	active
cca13d71-d2da-46a7-8c7f-bfe34ba153b2	51a36ab6-9d9a-4f61-bd1c-4444845afc39	Data Location	Linked	3f901e21-3643-43be-a224-56b4c583d626	active
0f53811f-ad3f-4560-9630-3f305c09725e	76230080-1b6f-419a-adba-99cc723a2314	Data Granularity	N/A	a225ddeb-4338-463d-9552-643430c45437	active
35626806-2435-461c-82da-420f4b7130d8	76230080-1b6f-419a-adba-99cc723a2314	Geospatial Coverage	Kimba (DC) Local Government Area	a225ddeb-4338-463d-9552-643430c45437	active
d0fd8c36-b08e-44a3-a8c5-47fc0f0bf040	76230080-1b6f-419a-adba-99cc723a2314	Update Frequency	Annually	a225ddeb-4338-463d-9552-643430c45437	active
2a206c21-88f7-45fd-b854-905a00df65f7	76230080-1b6f-419a-adba-99cc723a2314	Temporal Coverage	2007-2011	a225ddeb-4338-463d-9552-643430c45437	active
c95fb0d5-89b5-43a3-b75b-a4681b97ff12	76230080-1b6f-419a-adba-99cc723a2314	Data Location	Linked	a225ddeb-4338-463d-9552-643430c45437	active
07e7a3bf-cd89-4fa7-8512-5775fc214989	f7d03fcc-72e1-4e2d-a3b0-0ebde9201741	Data Granularity	N/A	68f3289b-a66d-4db9-bba2-e25cf3f919a1	active
b4ffbd34-8fc5-4723-8c25-5dcd07a2b4e9	f7d03fcc-72e1-4e2d-a3b0-0ebde9201741	Data Status	N/A	68f3289b-a66d-4db9-bba2-e25cf3f919a1	active
a881adcc-1f79-46f2-9322-eee76c74eed8	f7d03fcc-72e1-4e2d-a3b0-0ebde9201741	Geospatial Coverage	Kingston (DC) Local Government Area	68f3289b-a66d-4db9-bba2-e25cf3f919a1	active
aee547cd-4913-4391-9575-48397ed1f465	f7d03fcc-72e1-4e2d-a3b0-0ebde9201741	Update Frequency	Annually	68f3289b-a66d-4db9-bba2-e25cf3f919a1	active
a4c88192-e1ba-430e-b6a2-73b3c0fd8e8d	f7d03fcc-72e1-4e2d-a3b0-0ebde9201741	Temporal Coverage	2007-2011	68f3289b-a66d-4db9-bba2-e25cf3f919a1	active
856f462d-d06c-45e3-8f93-289f8cdd15cd	f7d03fcc-72e1-4e2d-a3b0-0ebde9201741	Data Location	Linked	68f3289b-a66d-4db9-bba2-e25cf3f919a1	active
370e6ffe-57a9-4e86-bdd5-0216578c3eb6	71ddb1f9-ac70-473b-af27-7ab14d5debbf	Data Location	Linked	6b15317d-1ed8-494d-84d3-a3d62fea40be	active
8fac9835-b0a3-4328-ac29-c731eeea469d	71ddb1f9-ac70-473b-af27-7ab14d5debbf	Update Frequency	Daily	6b15317d-1ed8-494d-84d3-a3d62fea40be	active
6018ee6d-334e-4994-8db9-14d5b4c5cba1	71ddb1f9-ac70-473b-af27-7ab14d5debbf	Data Granularity	Data is updated daily and visible within the dataset the following day	6b15317d-1ed8-494d-84d3-a3d62fea40be	active
c14ce725-5f5a-4574-b75e-6bee5232fc74	71ddb1f9-ac70-473b-af27-7ab14d5debbf	Geospatial Coverage	South Australia	6b15317d-1ed8-494d-84d3-a3d62fea40be	active
1acfc72f-966b-4137-b4a4-514b12594aa2	71ddb1f9-ac70-473b-af27-7ab14d5debbf	Temporal Coverage	Current	6b15317d-1ed8-494d-84d3-a3d62fea40be	active
ac5cf25c-dc8f-400d-912a-f2733487d06f	cc790713-4cf0-4bd4-bca8-f195d8e202b7	Data Location	Linked	ae45fb17-e4e4-4730-a1db-563657e00e91	active
46eaff27-c5fe-490e-b1eb-d5305cab837c	cc790713-4cf0-4bd4-bca8-f195d8e202b7	Update Frequency	Monthly	ae45fb17-e4e4-4730-a1db-563657e00e91	active
7a2a49c0-7a62-4cbf-a26d-789bfbbeed1b	cc790713-4cf0-4bd4-bca8-f195d8e202b7	Data Granularity	Data is typically updated on a catchment, basin or administrative region basis and frequency ranges from annually for high rainfall areas through to five yearly or more for arid regions. 	ae45fb17-e4e4-4730-a1db-563657e00e91	active
a1d01ee5-c7a3-4a7e-9748-df0839128d0f	cc790713-4cf0-4bd4-bca8-f195d8e202b7	Geospatial Coverage	South Australia	ae45fb17-e4e4-4730-a1db-563657e00e91	active
90aea3a7-1af7-4f5b-af99-2e1c6881314a	cc790713-4cf0-4bd4-bca8-f195d8e202b7	Temporal Coverage	Current	ae45fb17-e4e4-4730-a1db-563657e00e91	active
78af6c2b-d537-4e14-9bc8-5c242d79ab84	ea435574-23e6-4769-9154-956362109f7c	Data Location	Linked	56407e04-8411-401d-bac0-34b9be973540	active
661c19c2-78b7-44b3-ba9e-9b08aaee8c4c	ea435574-23e6-4769-9154-956362109f7c	Update Frequency	Monthly	56407e04-8411-401d-bac0-34b9be973540	active
f2b49b1e-ece9-4e51-9175-e8c50b62cd40	ea435574-23e6-4769-9154-956362109f7c	Data Granularity	Data is typically updated on a catchment, basin or administrative region basis and frequency ranges from annually for high rainfall areas through to five yearly or more for arid regions. 	56407e04-8411-401d-bac0-34b9be973540	active
1ec48505-62a2-4f4a-975f-3a0d6dff2d5c	ea435574-23e6-4769-9154-956362109f7c	Geospatial Coverage	South Australia	56407e04-8411-401d-bac0-34b9be973540	active
46355b1d-10a3-4d5e-8ba7-794ecb084a91	ea435574-23e6-4769-9154-956362109f7c	Temporal Coverage	Current	56407e04-8411-401d-bac0-34b9be973540	active
5efe00a1-1989-4ac9-8bfb-5221aae88b06	25fe95d4-e304-4fce-92e0-f2b1ac4ae00d	Status	Redundant	c6413f5c-4a7c-4df1-a400-286e8bf49853	active
86f6def7-866e-4160-90a9-f8959fb991c5	40e574ec-ee9e-4a9d-8150-fcc7635e34f3	Status	Redundant	81a92d09-544a-4cee-ac0f-52682f5c0bf3	active
820bc3af-3362-486c-ae23-d9d5e3f05dd1	3c7082b1-aa42-4767-bccc-5b33e3b428b3	Status	Redundant	bda9013b-6f6c-4184-b5e7-ef5a542d4611	active
6a46f3d7-c0e1-404c-965d-1317d200f92a	4279f483-9fcf-46a3-aaf2-b9bb7f09bf72	Status	Redundant	9d28315d-70ad-45d2-8ac2-f8cda2b2b2b9	active
e419fe7b-5599-49b5-ad04-19f34805eed4	c4cf212a-bfa8-475c-b400-32f13094f769	Data Granularity	N/A	adc5f6ce-d122-4420-96ad-42842f27548a	active
72254bce-fcfe-4653-8fb2-add1d657a32e	c4cf212a-bfa8-475c-b400-32f13094f769	Geospatial Coverage	South Australia	adc5f6ce-d122-4420-96ad-42842f27548a	active
0f71a1e1-91ad-47e2-8100-d246c2bd6078	c4cf212a-bfa8-475c-b400-32f13094f769	Update Frequency	Annually	adc5f6ce-d122-4420-96ad-42842f27548a	active
daeb09ce-0a24-4b37-957f-b4f925478136	c4cf212a-bfa8-475c-b400-32f13094f769	Temporal Coverage	2008-09 to 2012-13	adc5f6ce-d122-4420-96ad-42842f27548a	active
03820e81-b486-42c9-8bad-3e4da3c06e1a	c4cf212a-bfa8-475c-b400-32f13094f769	Data Location	Hosted	adc5f6ce-d122-4420-96ad-42842f27548a	active
b3c6bcac-6384-4a46-9ab7-9c21b440ace6	c4cf212a-bfa8-475c-b400-32f13094f769	Data Status	Active	a00f8e57-697e-47d0-8cfb-5eb1b9d20a2b	active
0da2a6d0-9e19-458d-9bde-2e2202e0c437	d1e69047-cc62-4208-8bb8-b3a00facefc8	Data Location	Linked	9ec71e00-e9f9-47b5-b15a-62f0ce8292f0	active
774db0cc-27a0-443f-8c15-44a733d233fc	d1e69047-cc62-4208-8bb8-b3a00facefc8	Temporal Coverage	2004	9ec71e00-e9f9-47b5-b15a-62f0ce8292f0	active
4f20fca7-e9b6-4043-b173-9b1d254cff7f	d1e69047-cc62-4208-8bb8-b3a00facefc8	Data Granularity	N/A	9ec71e00-e9f9-47b5-b15a-62f0ce8292f0	active
56f1702d-fd47-4ade-8fac-4248e96df8a4	d1e69047-cc62-4208-8bb8-b3a00facefc8	Data Status	Inactive	9ec71e00-e9f9-47b5-b15a-62f0ce8292f0	active
24305ffd-8b7f-4e1f-ab64-6d2d46750e95	d1e69047-cc62-4208-8bb8-b3a00facefc8	Geospatial Coverage	Mounty Lofty Ranges	9ec71e00-e9f9-47b5-b15a-62f0ce8292f0	active
93bd9b85-9595-4779-b65a-eceff01127f5	7002bf38-6f74-4b6f-a01a-620dd065511a	Data Location	Linked	b662efea-244d-4a1c-9ea9-e303a5432d8b	active
ef76f478-ee8a-4a6b-8fc0-4e27588f3dcf	7002bf38-6f74-4b6f-a01a-620dd065511a	Temporal Coverage	February 2014	b662efea-244d-4a1c-9ea9-e303a5432d8b	active
ba0aa116-1e95-4179-a43d-a4ad234316b8	7002bf38-6f74-4b6f-a01a-620dd065511a	Data Granularity	N/A	b662efea-244d-4a1c-9ea9-e303a5432d8b	active
cd8bd284-2971-435e-889f-f7dbaa871b7c	7002bf38-6f74-4b6f-a01a-620dd065511a	Data Status	Active	b662efea-244d-4a1c-9ea9-e303a5432d8b	active
b2e9f5ca-8a7e-4b54-b24b-f678067250f4	7002bf38-6f74-4b6f-a01a-620dd065511a	Geospatial Coverage	South Australia	b662efea-244d-4a1c-9ea9-e303a5432d8b	active
97ad9690-1ba6-4766-ba0c-e3db0e0d2d3e	f846a33e-f4b7-4c77-90b9-2697e54fd2a6	Data Granularity	N/A	293fcc90-5719-46c6-b8b8-32b21443d5ef	active
fac3bbfb-ac23-4a46-b1a7-8bf9cd962fd1	f846a33e-f4b7-4c77-90b9-2697e54fd2a6	Data Status	Active	293fcc90-5719-46c6-b8b8-32b21443d5ef	active
31c23326-cdf9-4341-98ca-c0cf63270bf1	f846a33e-f4b7-4c77-90b9-2697e54fd2a6	Geospatial Coverage	South Australia	293fcc90-5719-46c6-b8b8-32b21443d5ef	active
c03cfc51-d198-446a-a3a9-93faf348016e	f846a33e-f4b7-4c77-90b9-2697e54fd2a6	Update Frequency	As Required	293fcc90-5719-46c6-b8b8-32b21443d5ef	active
430babeb-507c-40c4-83dd-854e80d2e40f	f846a33e-f4b7-4c77-90b9-2697e54fd2a6	Temporal Coverage	February 2014	293fcc90-5719-46c6-b8b8-32b21443d5ef	active
69b23ca9-34e3-481b-b562-9cef1619b010	f846a33e-f4b7-4c77-90b9-2697e54fd2a6	Data Location	Linked	293fcc90-5719-46c6-b8b8-32b21443d5ef	active
e1ac4df3-3b35-47d7-a8cb-a4a45084c2d3	7002bf38-6f74-4b6f-a01a-620dd065511a	Update Frequency	As Required	2cda89d4-6d06-412c-8eba-0c2e11a70820	active
3703aa95-a129-49cf-85eb-038ce066a646	d1e69047-cc62-4208-8bb8-b3a00facefc8	Update Frequency	As Required	1524a068-8109-4367-b30b-7da06333a7e3	active
c0bee2a1-e5ed-4598-89e2-32918bf2aad0	edb5fe99-63da-425c-a5db-f8f54d156f9f	Data Granularity	N/A	2ac406fa-2498-4459-9e9e-d37e6c29f712	active
a13d0c12-5aae-4229-bf83-13b133896c5b	edb5fe99-63da-425c-a5db-f8f54d156f9f	Data Status	Active	2ac406fa-2498-4459-9e9e-d37e6c29f712	active
fb9604ab-58f8-4481-87e4-88d92dd4eca4	edb5fe99-63da-425c-a5db-f8f54d156f9f	Geospatial Coverage	South Australia	2ac406fa-2498-4459-9e9e-d37e6c29f712	active
4864133f-516e-4f5c-b5f3-a887382c9f7f	edb5fe99-63da-425c-a5db-f8f54d156f9f	Update Frequency	As Required	2ac406fa-2498-4459-9e9e-d37e6c29f712	active
f663b39f-e5c7-43dc-a0ae-edbe3a7057c3	edb5fe99-63da-425c-a5db-f8f54d156f9f	Temporal Coverage	Current	2ac406fa-2498-4459-9e9e-d37e6c29f712	active
966b0104-055c-46ab-9022-ce016f14a7d5	edb5fe99-63da-425c-a5db-f8f54d156f9f	Data Location	Linked	2ac406fa-2498-4459-9e9e-d37e6c29f712	active
bef53659-f6bb-4c72-81ff-8918f4a68b23	d2633f93-d2e9-4d32-acb8-2c3883db8651	Data Location	Hosted	d332eb33-1f7c-4a69-8d3f-4005c8f4cdd7	active
72becb20-cf07-4afd-ab65-459fdba22d8b	d2633f93-d2e9-4d32-acb8-2c3883db8651	Data Status	Active	d332eb33-1f7c-4a69-8d3f-4005c8f4cdd7	active
9f5352d8-03e1-47e1-a468-dfb19c7919a3	8c25f717-eda8-4ebc-838f-777d151ebf35	Data Granularity	N/A	a484f1a9-5304-4702-b420-41225eb3b660	active
187eb496-bb18-4a11-b41a-324653d1b091	8c25f717-eda8-4ebc-838f-777d151ebf35	Data Status	Inactive	a484f1a9-5304-4702-b420-41225eb3b660	active
34850d38-58ce-4e7c-a19b-b8e3ca8f34c7	8c25f717-eda8-4ebc-838f-777d151ebf35	Geospatial Coverage	Mount Lofty Ranges	a484f1a9-5304-4702-b420-41225eb3b660	active
dec7350d-5e28-4fcd-87d2-78f5b167fc4c	8c25f717-eda8-4ebc-838f-777d151ebf35	Update Frequency	Not Required	a484f1a9-5304-4702-b420-41225eb3b660	active
edaaebb8-0af1-4bfb-b1bd-5d399ec95588	8c25f717-eda8-4ebc-838f-777d151ebf35	Temporal Coverage	July 2003	a484f1a9-5304-4702-b420-41225eb3b660	active
14e7c689-f561-4615-9e6b-a91b1bad745e	8c25f717-eda8-4ebc-838f-777d151ebf35	Data Location	Linked	a484f1a9-5304-4702-b420-41225eb3b660	active
0ead6b25-2f3e-4282-b1e2-b32057d460ca	e059ea9f-5ef6-4771-ae28-88759e0e30c6	Data Granularity	N/A	9b4011a3-62f3-4770-a3f0-edb93f122e72	active
2fce0d2d-7f5c-46e4-8c00-31ebbafa11bf	e059ea9f-5ef6-4771-ae28-88759e0e30c6	Data Status	Active	9b4011a3-62f3-4770-a3f0-edb93f122e72	active
1cbc3321-62d8-4fd2-ae75-9354c7c8f3b3	e059ea9f-5ef6-4771-ae28-88759e0e30c6	Geospatial Coverage	South Australia	9b4011a3-62f3-4770-a3f0-edb93f122e72	active
1d7fa6d6-2858-4804-9c02-aeac8a0d0719	e059ea9f-5ef6-4771-ae28-88759e0e30c6	Update Frequency	As Required	9b4011a3-62f3-4770-a3f0-edb93f122e72	active
5ecd2542-c4fa-4881-8f03-46f1ce347e86	e059ea9f-5ef6-4771-ae28-88759e0e30c6	Temporal Coverage	October 2012	9b4011a3-62f3-4770-a3f0-edb93f122e72	active
61a53cf7-1409-4a27-aa4d-4cc1d0ed7cc1	e059ea9f-5ef6-4771-ae28-88759e0e30c6	Data Location	Linked	9b4011a3-62f3-4770-a3f0-edb93f122e72	active
fa72bef3-3cad-4590-bbc7-f1deed53bd29	f0122aba-c8a8-4303-bb80-c99d7f42d914	Data Granularity	N/A	a0a72c6d-c2ca-4a32-a3b3-5ed75677001d	active
3620aafd-4834-4f91-9fe9-9f27a83e7017	f0122aba-c8a8-4303-bb80-c99d7f42d914	Data Status	Inactive	a0a72c6d-c2ca-4a32-a3b3-5ed75677001d	active
e0c22460-50ec-45e1-aa77-703df408e68e	f0122aba-c8a8-4303-bb80-c99d7f42d914	Geospatial Coverage	South Australia	a0a72c6d-c2ca-4a32-a3b3-5ed75677001d	active
b0712393-3891-45d4-a15d-f782b5542dc9	f0122aba-c8a8-4303-bb80-c99d7f42d914	Update Frequency	Not Required	a0a72c6d-c2ca-4a32-a3b3-5ed75677001d	active
32ec1c5d-0a47-4b66-bba4-ef4238d1b659	f0122aba-c8a8-4303-bb80-c99d7f42d914	Temporal Coverage	Current	a0a72c6d-c2ca-4a32-a3b3-5ed75677001d	active
a4f241cf-1926-4e17-ae8b-0a5577d4c3bf	f0122aba-c8a8-4303-bb80-c99d7f42d914	Data Location	Linked	a0a72c6d-c2ca-4a32-a3b3-5ed75677001d	active
cb05c3bd-cd7f-4140-913c-7c2eaa86f9f6	9dc7a10f-dc1c-46ec-ade5-f25cd630f727	Data Granularity	N/A	6fd0dfd6-6f56-4f1f-a4b5-6d2e3043f406	active
ecb638c0-0559-4145-84d0-941ac70a2213	9dc7a10f-dc1c-46ec-ade5-f25cd630f727	Data Status	Inactive	6fd0dfd6-6f56-4f1f-a4b5-6d2e3043f406	active
81073298-516c-4e7c-b64c-1d92a967eaa8	9dc7a10f-dc1c-46ec-ade5-f25cd630f727	Geospatial Coverage	South Australia	6fd0dfd6-6f56-4f1f-a4b5-6d2e3043f406	active
12e2a799-c170-4bbb-83a9-9f2fadb15337	9dc7a10f-dc1c-46ec-ade5-f25cd630f727	Update Frequency	As Required	6fd0dfd6-6f56-4f1f-a4b5-6d2e3043f406	active
fe74756e-8d6c-4700-8480-0adb2936c5ab	9dc7a10f-dc1c-46ec-ade5-f25cd630f727	Temporal Coverage	1997	6fd0dfd6-6f56-4f1f-a4b5-6d2e3043f406	active
45cf220e-406e-4303-a110-1abbf966d3fd	9dc7a10f-dc1c-46ec-ade5-f25cd630f727	Data Location	Linked	6fd0dfd6-6f56-4f1f-a4b5-6d2e3043f406	active
caaac3fc-ae3a-4ef5-afa9-2625e8f18d8f	b6fed61f-d91f-485e-aa8f-0748fda8265b	Data Granularity	N/A	54b5f6d7-9102-4b0e-88f9-cd1ec805e356	active
80f3e33a-6180-4d42-a6e5-9f7fcc6a064f	b6fed61f-d91f-485e-aa8f-0748fda8265b	Data Status	Inactive	54b5f6d7-9102-4b0e-88f9-cd1ec805e356	active
34a2fd10-af26-44bf-baac-4dfa8d884153	b6fed61f-d91f-485e-aa8f-0748fda8265b	Geospatial Coverage	South Australia	54b5f6d7-9102-4b0e-88f9-cd1ec805e356	active
65e7254c-adc4-4e7f-8125-071d7f1d43ef	b6fed61f-d91f-485e-aa8f-0748fda8265b	Update Frequency	Not Required	54b5f6d7-9102-4b0e-88f9-cd1ec805e356	active
9207635d-3b4e-43f1-bfe4-d683a9747ac2	b6fed61f-d91f-485e-aa8f-0748fda8265b	Temporal Coverage	Current	54b5f6d7-9102-4b0e-88f9-cd1ec805e356	active
3bbbb94a-64ee-444f-890a-07d4d3cbfa68	b6fed61f-d91f-485e-aa8f-0748fda8265b	Data Location	Linked	54b5f6d7-9102-4b0e-88f9-cd1ec805e356	active
f508ace2-7f49-412a-857d-1b7a3f0fa5de	b9bb9820-50ae-4dc1-8567-db873b9d6f77	Data Granularity	N/A	277435cc-e58f-4506-b0b0-027d5204461a	active
04cf169d-fb2a-4918-b539-76d89713f8e5	b9bb9820-50ae-4dc1-8567-db873b9d6f77	Data Status	Inactive	277435cc-e58f-4506-b0b0-027d5204461a	active
e730c13b-835b-4255-a2ac-1bacfd19911e	b9bb9820-50ae-4dc1-8567-db873b9d6f77	Geospatial Coverage	South Australia-Victoria Border	277435cc-e58f-4506-b0b0-027d5204461a	active
9947307b-89cb-4884-abfe-20353b3d5665	b9bb9820-50ae-4dc1-8567-db873b9d6f77	Update Frequency	As Required	277435cc-e58f-4506-b0b0-027d5204461a	active
01b85d19-6560-4a34-b8f5-9de6894f89f1	b9bb9820-50ae-4dc1-8567-db873b9d6f77	Temporal Coverage	June 1998	277435cc-e58f-4506-b0b0-027d5204461a	active
81feac75-1f43-4c68-a1a0-7c2ca72b8ae6	b9bb9820-50ae-4dc1-8567-db873b9d6f77	Data Location	Linked	277435cc-e58f-4506-b0b0-027d5204461a	active
cf343070-2492-4841-91cf-86a2384736fb	cb33ac03-4a17-42cb-af5e-b7b35998f30b	Data Granularity	N/A	d6a936bf-ba83-4420-857e-aec56327e650	active
4c2c9bed-555f-4981-a48e-777f259dec5f	cb33ac03-4a17-42cb-af5e-b7b35998f30b	Data Status	Inactive	d6a936bf-ba83-4420-857e-aec56327e650	active
05ebb6a6-6f34-4ec4-9b65-40b0c4ed01e5	cb33ac03-4a17-42cb-af5e-b7b35998f30b	Geospatial Coverage	South Australia	d6a936bf-ba83-4420-857e-aec56327e650	active
83e72501-d544-4779-8d4a-6204f85f18eb	cb33ac03-4a17-42cb-af5e-b7b35998f30b	Update Frequency	As Required	d6a936bf-ba83-4420-857e-aec56327e650	active
6f71ed13-b561-4fe8-9fbb-337439ac63f3	cb33ac03-4a17-42cb-af5e-b7b35998f30b	Temporal Coverage	January 1990	d6a936bf-ba83-4420-857e-aec56327e650	active
d6e98282-6d11-4d09-8398-35b1940faf73	cb33ac03-4a17-42cb-af5e-b7b35998f30b	Data Location	Linked	d6a936bf-ba83-4420-857e-aec56327e650	active
d90b7e2a-477a-471d-91d3-9a26523eb22b	4ecfa227-ace7-447a-bd68-fff8292c8894	Data Granularity	N/A	d5fd644b-7b74-4167-a273-6f87c2293b8e	active
6d036e27-b452-46c6-9812-8d149ca4a84a	4ecfa227-ace7-447a-bd68-fff8292c8894	Data Status	Active	d5fd644b-7b74-4167-a273-6f87c2293b8e	active
0abaa0f2-ba59-4d7c-8014-3263c4d06ad1	4ecfa227-ace7-447a-bd68-fff8292c8894	Geospatial Coverage	South Australia	d5fd644b-7b74-4167-a273-6f87c2293b8e	active
2e14063d-61fd-4bbc-a0bd-e388d648585c	4ecfa227-ace7-447a-bd68-fff8292c8894	Update Frequency	As Required	d5fd644b-7b74-4167-a273-6f87c2293b8e	active
718425ab-9488-4036-a75d-10b9be540710	4ecfa227-ace7-447a-bd68-fff8292c8894	Temporal Coverage	December 2012	d5fd644b-7b74-4167-a273-6f87c2293b8e	active
e2d3bc18-6c9e-4f63-a2ed-0633881de32d	4ecfa227-ace7-447a-bd68-fff8292c8894	Data Location	Linked	d5fd644b-7b74-4167-a273-6f87c2293b8e	active
f68023b7-14d0-4239-8f59-3ed545763454	7fe9cba1-cc09-4694-bba8-58c3d338a04c	Data Granularity	N/A	7d077f21-ae5d-48f2-b0ac-efcb4ade1348	active
9294d925-ac19-4a57-922c-cc0a1f8e42f7	7fe9cba1-cc09-4694-bba8-58c3d338a04c	Data Status	Active	7d077f21-ae5d-48f2-b0ac-efcb4ade1348	active
22d5818b-879a-4570-bff2-7ea643ec8805	7fe9cba1-cc09-4694-bba8-58c3d338a04c	Geospatial Coverage	South Australia	7d077f21-ae5d-48f2-b0ac-efcb4ade1348	active
83c57f1e-0432-40ab-8f6d-33e05dafe204	7fe9cba1-cc09-4694-bba8-58c3d338a04c	Update Frequency	As Required	7d077f21-ae5d-48f2-b0ac-efcb4ade1348	active
0a52628f-9e17-415d-a730-9268efcbd971	7fe9cba1-cc09-4694-bba8-58c3d338a04c	Temporal Coverage	Current	7d077f21-ae5d-48f2-b0ac-efcb4ade1348	active
8d8078b4-8cc4-4d7a-9774-d625140bcd1d	7fe9cba1-cc09-4694-bba8-58c3d338a04c	Data Location	Linked	7d077f21-ae5d-48f2-b0ac-efcb4ade1348	active
31f82e72-7a56-4fd9-94a7-713af6f97c30	a76d85d8-741f-4c72-a59c-6c86f401cb8f	Data Granularity	N/A	420631c0-0624-4c52-8a8e-15a3f6a2c917	active
7f2dd6c2-59a0-4054-82e1-0ee18d7d2811	a76d85d8-741f-4c72-a59c-6c86f401cb8f	Data Status	Inactive	420631c0-0624-4c52-8a8e-15a3f6a2c917	active
12e99143-381f-453a-a5e5-3ae04f0de51f	a76d85d8-741f-4c72-a59c-6c86f401cb8f	Geospatial Coverage	South Australia	420631c0-0624-4c52-8a8e-15a3f6a2c917	active
40b69b96-9b90-4ba4-841c-74b38eac3bf9	a76d85d8-741f-4c72-a59c-6c86f401cb8f	Update Frequency	As Required	420631c0-0624-4c52-8a8e-15a3f6a2c917	active
40424584-05bc-4568-8a2c-925252105ead	a76d85d8-741f-4c72-a59c-6c86f401cb8f	Temporal Coverage	December 2012	420631c0-0624-4c52-8a8e-15a3f6a2c917	active
e15572dd-b2b2-4d9b-8254-14a664ce10ef	a76d85d8-741f-4c72-a59c-6c86f401cb8f	Data Location	Linked	420631c0-0624-4c52-8a8e-15a3f6a2c917	active
a6ff31b3-1499-4835-9307-3a597b889450	ff5c0a38-9cc8-4602-accf-31e1780cef97	Data Granularity	N/A	b8fe7548-bc43-42de-85a6-da969c687f47	active
12ba40aa-02d1-4b3f-ba94-8c920c4fa742	ff5c0a38-9cc8-4602-accf-31e1780cef97	Data Status	Inactive	b8fe7548-bc43-42de-85a6-da969c687f47	active
bbcb1e3f-4f6d-4483-9de3-cb378a52acbe	ff5c0a38-9cc8-4602-accf-31e1780cef97	Geospatial Coverage	South Australia	b8fe7548-bc43-42de-85a6-da969c687f47	active
468faa0c-0d69-4b14-937f-c2735e61a0cf	ff5c0a38-9cc8-4602-accf-31e1780cef97	Update Frequency	As Required	b8fe7548-bc43-42de-85a6-da969c687f47	active
95f9cd9f-c7d0-4ffb-bd21-ea7bda07ec14	ff5c0a38-9cc8-4602-accf-31e1780cef97	Temporal Coverage	December 2012	b8fe7548-bc43-42de-85a6-da969c687f47	active
cebdd16a-8d70-4f86-b28f-582708f0f007	ff5c0a38-9cc8-4602-accf-31e1780cef97	Data Location	Linked	b8fe7548-bc43-42de-85a6-da969c687f47	active
fe61ce70-e691-430c-83d9-1720d3d23685	137e6931-05ce-48cd-b1da-e04c1ba3c844	Data Granularity	N/A	a39501eb-3a36-4b88-84d2-20dc03236fad	active
c7d912a8-5e21-4be6-ab98-34093c8c9b83	137e6931-05ce-48cd-b1da-e04c1ba3c844	Data Status	Inactive	a39501eb-3a36-4b88-84d2-20dc03236fad	active
070cc814-13e0-48a4-b566-7a32defeeeb8	137e6931-05ce-48cd-b1da-e04c1ba3c844	Geospatial Coverage	South Australia	a39501eb-3a36-4b88-84d2-20dc03236fad	active
2ea2acff-cf4f-40c5-aff6-e8bde7e32593	137e6931-05ce-48cd-b1da-e04c1ba3c844	Update Frequency	As Required	a39501eb-3a36-4b88-84d2-20dc03236fad	active
fd6ababb-eec1-4233-9e6a-33631ebc53dc	137e6931-05ce-48cd-b1da-e04c1ba3c844	Temporal Coverage	December 2012	a39501eb-3a36-4b88-84d2-20dc03236fad	active
b7048b9f-e0f8-4997-8df9-9c08d6615d93	137e6931-05ce-48cd-b1da-e04c1ba3c844	Data Location	Linked	a39501eb-3a36-4b88-84d2-20dc03236fad	active
f04d1951-ccc6-4ce4-a0c6-4494dbe41676	d169483c-4440-4ae8-8581-82e2690f7ed1	Data Granularity	N/A	3a281b0b-80b7-4dfe-be31-e585d82abc07	active
a2101eef-88f4-4977-b580-0e3205d6e307	d169483c-4440-4ae8-8581-82e2690f7ed1	Data Status	Inactive	3a281b0b-80b7-4dfe-be31-e585d82abc07	active
0fba5a3a-1795-46d4-9393-25d55d32b25c	d169483c-4440-4ae8-8581-82e2690f7ed1	Geospatial Coverage	South Australia	3a281b0b-80b7-4dfe-be31-e585d82abc07	active
f7833ae0-d960-40ce-a029-ba5ac2e46ed7	d169483c-4440-4ae8-8581-82e2690f7ed1	Update Frequency	As Required	3a281b0b-80b7-4dfe-be31-e585d82abc07	active
39a04b93-4630-4c1d-9ae8-9e6cabae44ff	d169483c-4440-4ae8-8581-82e2690f7ed1	Temporal Coverage	July 2004	3a281b0b-80b7-4dfe-be31-e585d82abc07	active
324f5e09-263e-4389-b340-09ffa8a938db	d169483c-4440-4ae8-8581-82e2690f7ed1	Data Location	Linked	3a281b0b-80b7-4dfe-be31-e585d82abc07	active
a340a257-1e68-408b-90a1-e58004f7e3e8	bed61f00-f0e0-434d-b3d7-bbf910455eca	Data Granularity	N/A	08b4fad5-9073-41eb-937e-e77b8a3cb30f	active
f85260ca-45e4-4b6a-848c-7146e68f881d	bed61f00-f0e0-434d-b3d7-bbf910455eca	Data Status	Active	08b4fad5-9073-41eb-937e-e77b8a3cb30f	active
2ec3fcc7-4a5e-476b-8fc3-ddb9d594323c	bed61f00-f0e0-434d-b3d7-bbf910455eca	Geospatial Coverage	South Australia	08b4fad5-9073-41eb-937e-e77b8a3cb30f	active
450d1da0-803a-4fc8-b960-5eadb845f1f2	bed61f00-f0e0-434d-b3d7-bbf910455eca	Update Frequency	As Required	08b4fad5-9073-41eb-937e-e77b8a3cb30f	active
3af604f4-ed82-4060-9cf8-bda64ef1f799	bed61f00-f0e0-434d-b3d7-bbf910455eca	Temporal Coverage	March 2012	08b4fad5-9073-41eb-937e-e77b8a3cb30f	active
1721b235-cf68-47a9-aafb-d1818366aa39	bed61f00-f0e0-434d-b3d7-bbf910455eca	Data Location	Linked	08b4fad5-9073-41eb-937e-e77b8a3cb30f	active
30f6f037-669c-46ca-a8d9-4e7a66f90fb4	0d99de21-7201-4411-8516-b07cbc336fdc	Data Granularity	N/A	3e88c9bd-e46b-4254-9147-4ce2f1484978	active
196c9efd-0f71-4d2e-a1a6-e3039901d9ee	0d99de21-7201-4411-8516-b07cbc336fdc	Data Status	Inactive	3e88c9bd-e46b-4254-9147-4ce2f1484978	active
07fd37d6-574b-49fc-a9ff-57d0e0f0d20c	0d99de21-7201-4411-8516-b07cbc336fdc	Geospatial Coverage	Mount Lofty Ranges	3e88c9bd-e46b-4254-9147-4ce2f1484978	active
a06c2cea-6453-4be7-8746-51f860a06980	0d99de21-7201-4411-8516-b07cbc336fdc	Update Frequency	As Required	3e88c9bd-e46b-4254-9147-4ce2f1484978	active
ef9bcae2-75ae-4201-8df3-3e3bcb91f6a1	0d99de21-7201-4411-8516-b07cbc336fdc	Temporal Coverage	2004	3e88c9bd-e46b-4254-9147-4ce2f1484978	active
77074a88-f1b9-4735-b23a-bf0d78a1fcaf	0d99de21-7201-4411-8516-b07cbc336fdc	Data Location	Linked	3e88c9bd-e46b-4254-9147-4ce2f1484978	active
51a9d36f-9867-4225-9e64-5d3f4357c540	d90d6075-4b7c-49a3-9aab-094103471889	Data Granularity	N/A	75b0b8e2-c317-4f84-9502-e8eedac17436	active
ceda94e9-ba50-4f8f-905d-1fa3c14152d8	d90d6075-4b7c-49a3-9aab-094103471889	Data Status	Inactive	75b0b8e2-c317-4f84-9502-e8eedac17436	active
48ea09cb-bfe4-4dee-bc97-12ed11777390	d90d6075-4b7c-49a3-9aab-094103471889	Geospatial Coverage	Mount Lofty Ranges	75b0b8e2-c317-4f84-9502-e8eedac17436	active
daeccbbb-3d1a-43ca-b190-a1228115bc9e	d90d6075-4b7c-49a3-9aab-094103471889	Update Frequency	As Required	75b0b8e2-c317-4f84-9502-e8eedac17436	active
c5ae2c56-a013-465b-af91-4c89398098a3	d90d6075-4b7c-49a3-9aab-094103471889	Temporal Coverage	2004	75b0b8e2-c317-4f84-9502-e8eedac17436	active
068d55f4-0664-479e-a41c-76ba9aef75fc	d90d6075-4b7c-49a3-9aab-094103471889	Data Location	Linked	75b0b8e2-c317-4f84-9502-e8eedac17436	active
c26e79ef-afe3-43ce-87f9-2b30ab60b0a9	8e223bcf-7a32-4d43-a0b9-f39c5f65a7da	Data Granularity	N/A	c2a65581-75d8-4732-b523-284443a40188	active
a502fd29-dafb-403d-971b-ddb89b6b9897	8e223bcf-7a32-4d43-a0b9-f39c5f65a7da	Data Status	Inactive	c2a65581-75d8-4732-b523-284443a40188	active
37ae8bfc-6e96-4c2f-9f6d-e4b10a3abe9a	8e223bcf-7a32-4d43-a0b9-f39c5f65a7da	Geospatial Coverage	South Australia	c2a65581-75d8-4732-b523-284443a40188	active
9be8622c-cd03-454d-8619-cda44574ecd2	8e223bcf-7a32-4d43-a0b9-f39c5f65a7da	Update Frequency	As Required	c2a65581-75d8-4732-b523-284443a40188	active
fc9d76ae-8c61-457b-a7b1-e80ce0d8211e	8e223bcf-7a32-4d43-a0b9-f39c5f65a7da	Temporal Coverage	March 2012	c2a65581-75d8-4732-b523-284443a40188	active
c7f6d4c5-fa14-4212-9410-1bb674e2a0a1	8e223bcf-7a32-4d43-a0b9-f39c5f65a7da	Data Location	Linked	c2a65581-75d8-4732-b523-284443a40188	active
b2d17e82-2f43-4ff4-9570-c0bf570655b2	00f1ac6c-0b3d-4611-8f58-ff942800d4c2	Data Granularity	N/A	dbb5f4cb-e5d2-4ec0-9f1f-90ad4c70c813	active
581d2c29-6b28-4cbc-ad02-0a5db74c7311	00f1ac6c-0b3d-4611-8f58-ff942800d4c2	Data Status	Inactive	dbb5f4cb-e5d2-4ec0-9f1f-90ad4c70c813	active
62c34360-1198-4207-bff1-4c35da6af442	00f1ac6c-0b3d-4611-8f58-ff942800d4c2	Geospatial Coverage	South Australia	dbb5f4cb-e5d2-4ec0-9f1f-90ad4c70c813	active
694010cb-2398-4fc3-88a2-424bfd1d99a0	00f1ac6c-0b3d-4611-8f58-ff942800d4c2	Update Frequency	As Required	dbb5f4cb-e5d2-4ec0-9f1f-90ad4c70c813	active
662496c0-5cf7-4bc7-9e99-ec1da4b70832	00f1ac6c-0b3d-4611-8f58-ff942800d4c2	Temporal Coverage	March 2012	dbb5f4cb-e5d2-4ec0-9f1f-90ad4c70c813	active
47b54112-a476-4f56-8009-d6bf8a63c1f2	00f1ac6c-0b3d-4611-8f58-ff942800d4c2	Data Location	Linked	dbb5f4cb-e5d2-4ec0-9f1f-90ad4c70c813	active
8043c308-97aa-44a0-9660-5c4d163b1b37	2ddbb77b-af67-46ee-bfc2-6f24ac3be01e	Data Granularity	N/A	56f62dad-489c-4da9-bb79-b4319a2c00cd	active
7d2e3a37-bdfe-4169-a370-571324e7cd9f	2ddbb77b-af67-46ee-bfc2-6f24ac3be01e	Data Status	Inactive	56f62dad-489c-4da9-bb79-b4319a2c00cd	active
d363625d-0737-441c-ac94-e7eabd62a11e	2ddbb77b-af67-46ee-bfc2-6f24ac3be01e	Geospatial Coverage	South Australia	56f62dad-489c-4da9-bb79-b4319a2c00cd	active
2b280e5c-29b6-4e38-bcad-c37661738f60	2ddbb77b-af67-46ee-bfc2-6f24ac3be01e	Update Frequency	As Required	56f62dad-489c-4da9-bb79-b4319a2c00cd	active
8f1ac4f1-dde3-432d-b539-46323f3fe456	2ddbb77b-af67-46ee-bfc2-6f24ac3be01e	Temporal Coverage	March 2012	56f62dad-489c-4da9-bb79-b4319a2c00cd	active
50c770bc-ceb6-4b70-91d2-62e82725760a	2ddbb77b-af67-46ee-bfc2-6f24ac3be01e	Data Location	Linked	56f62dad-489c-4da9-bb79-b4319a2c00cd	active
723d6827-05ee-4690-9596-85e800e4f76e	d002ac71-239c-491a-97c8-6150d10dbdae	Data update	Daily	ded2300b-bca3-4557-a8ab-bf636d086cd5	deleted
49ce95a6-d25b-4047-8978-b76c7af51e43	d002ac71-239c-491a-97c8-6150d10dbdae	Update Frequency	Daily	ded2300b-bca3-4557-a8ab-bf636d086cd5	active
ad558c95-f933-43d2-b47b-b2a0d36121b7	d002ac71-239c-491a-97c8-6150d10dbdae	Data Granularity	N/A	ded2300b-bca3-4557-a8ab-bf636d086cd5	active
ce2959ab-1dd7-4a70-848f-94e635e51c21	d002ac71-239c-491a-97c8-6150d10dbdae	Data Status	Active	ded2300b-bca3-4557-a8ab-bf636d086cd5	active
c416542e-f073-40eb-a55e-ed1baf0a41b8	d002ac71-239c-491a-97c8-6150d10dbdae	Geospatial Coverage	South Australia	ded2300b-bca3-4557-a8ab-bf636d086cd5	active
a1cd0fcb-54fe-4f69-a409-98720a3364b7	d002ac71-239c-491a-97c8-6150d10dbdae	Temporal Coverage	Current	ded2300b-bca3-4557-a8ab-bf636d086cd5	active
d7c1a28d-96d9-47ff-b0de-5362f64acd19	e0e7fe1d-a42e-4492-be62-4064bde37b18	Data Granularity	N/A	34a51e35-144e-454f-b9db-512fc27304c9	active
5f1e6c74-ced3-48e0-a836-2465f2d23b95	e0e7fe1d-a42e-4492-be62-4064bde37b18	Data Status	Inactive	34a51e35-144e-454f-b9db-512fc27304c9	active
9258167e-cfe6-41d5-9cbf-4edb52d3dbed	e0e7fe1d-a42e-4492-be62-4064bde37b18	Geospatial Coverage	South Australia, River Murray	34a51e35-144e-454f-b9db-512fc27304c9	active
dc832ce1-e88f-4e8f-a466-714d74a7246b	e0e7fe1d-a42e-4492-be62-4064bde37b18	Update Frequency	As Required	34a51e35-144e-454f-b9db-512fc27304c9	active
540c7098-12a6-4bdd-8e2b-49fbd8f68962	e0e7fe1d-a42e-4492-be62-4064bde37b18	Temporal Coverage	February 2003	34a51e35-144e-454f-b9db-512fc27304c9	active
dde4fb1e-1a42-4e0b-8f16-5f0683667424	e0e7fe1d-a42e-4492-be62-4064bde37b18	Data Location	Linked	34a51e35-144e-454f-b9db-512fc27304c9	active
ae92e9bd-4317-4925-8d6c-fa922df06e3c	199cff6d-fe34-4021-b2b2-fa11a96fd42d	Data Granularity	N/A	7454cb41-82ac-4c36-a2d5-80167ca482e1	active
c7fce2cb-58a1-4069-9ecc-a1ad800d98b9	199cff6d-fe34-4021-b2b2-fa11a96fd42d	Data Status	Inactive	7454cb41-82ac-4c36-a2d5-80167ca482e1	active
07fb4a6d-a251-40f9-a2c4-7c09fd740742	199cff6d-fe34-4021-b2b2-fa11a96fd42d	Geospatial Coverage	South Australia	7454cb41-82ac-4c36-a2d5-80167ca482e1	active
20c6cff2-1517-4389-af74-cf3658fb9ff7	199cff6d-fe34-4021-b2b2-fa11a96fd42d	Update Frequency	Complete	7454cb41-82ac-4c36-a2d5-80167ca482e1	active
96f9c4a1-6939-4194-a095-1e9c49b59c5e	199cff6d-fe34-4021-b2b2-fa11a96fd42d	Temporal Coverage	1997	7454cb41-82ac-4c36-a2d5-80167ca482e1	active
d98b1999-f941-41e1-91d2-e84951e6d3fc	199cff6d-fe34-4021-b2b2-fa11a96fd42d	Data Location	Linked	7454cb41-82ac-4c36-a2d5-80167ca482e1	active
015e37f3-d772-4ec2-9da0-4f948d169cef	e86dd675-c0ef-4ce3-a52e-4f46f266e56a	Data Granularity	N/A	649dbf12-cf30-492c-8456-c3f57f5efe14	active
57742383-52f7-47d9-85e9-fe531f902f56	e86dd675-c0ef-4ce3-a52e-4f46f266e56a	Data Status	Inactive	649dbf12-cf30-492c-8456-c3f57f5efe14	active
a2129732-fbc5-48e8-8388-312ef0edb6e4	e86dd675-c0ef-4ce3-a52e-4f46f266e56a	Geospatial Coverage	South Australia	649dbf12-cf30-492c-8456-c3f57f5efe14	active
e1943cf8-1ef7-4d83-99a1-70cef0e7e759	e86dd675-c0ef-4ce3-a52e-4f46f266e56a	Update Frequency	Complete	649dbf12-cf30-492c-8456-c3f57f5efe14	active
b5ad65ae-eee4-488a-b7f8-fca98684837f	e86dd675-c0ef-4ce3-a52e-4f46f266e56a	Temporal Coverage	1997	649dbf12-cf30-492c-8456-c3f57f5efe14	active
4113af44-f712-4ee1-9402-31c1a0e6656c	e86dd675-c0ef-4ce3-a52e-4f46f266e56a	Data Location	Linked	649dbf12-cf30-492c-8456-c3f57f5efe14	active
a5a2c455-0657-40d9-9d22-3e663c65a715	31a2d19d-f032-4ff1-aa48-e394bc7930be	Data Granularity	N/A	aa4cfb28-0458-4979-9057-4a2153dbeece	active
68aebd15-8ca0-4d42-961c-6b2d77b26b72	31a2d19d-f032-4ff1-aa48-e394bc7930be	Data Status	Active	aa4cfb28-0458-4979-9057-4a2153dbeece	active
1f92c4f4-3003-494f-8c81-174bbcff02a1	31a2d19d-f032-4ff1-aa48-e394bc7930be	Geospatial Coverage	South Australia	aa4cfb28-0458-4979-9057-4a2153dbeece	active
04bdb36d-0845-4c40-8853-2ca6cdcd4441	31a2d19d-f032-4ff1-aa48-e394bc7930be	Update Frequency	As Required	aa4cfb28-0458-4979-9057-4a2153dbeece	active
553f2798-22ed-4773-97ca-46d72aa45d58	31a2d19d-f032-4ff1-aa48-e394bc7930be	Temporal Coverage	1997	aa4cfb28-0458-4979-9057-4a2153dbeece	active
cfaeb7b0-bb50-4bdc-b226-8785dec12b77	31a2d19d-f032-4ff1-aa48-e394bc7930be	Data Location	Linked	aa4cfb28-0458-4979-9057-4a2153dbeece	active
4077d7c6-151c-48b4-8abd-281a09f0db45	6bf4a9ae-86ce-43b7-969c-15c2ff0b20a6	Data Granularity	N/A	6e86cdfd-e5be-4e17-ae45-8555acccddbb	active
3aee6b1b-ecac-4de7-9f20-322be55aa13d	6bf4a9ae-86ce-43b7-969c-15c2ff0b20a6	Data Status	Inactive	6e86cdfd-e5be-4e17-ae45-8555acccddbb	active
909ae1f9-8cc3-49de-bfbf-e965386b7123	6bf4a9ae-86ce-43b7-969c-15c2ff0b20a6	Geospatial Coverage	South Australia	6e86cdfd-e5be-4e17-ae45-8555acccddbb	active
badac074-1aaa-43fa-946a-86fa4c15b28b	6bf4a9ae-86ce-43b7-969c-15c2ff0b20a6	Update Frequency	As Required	6e86cdfd-e5be-4e17-ae45-8555acccddbb	active
d2d5f809-5b3c-4cc7-a91f-0284505818dd	6bf4a9ae-86ce-43b7-969c-15c2ff0b20a6	Temporal Coverage	2005-2009	6e86cdfd-e5be-4e17-ae45-8555acccddbb	active
5446ec24-d308-4292-a38a-30702368bf1a	6bf4a9ae-86ce-43b7-969c-15c2ff0b20a6	Data Location	Linked	6e86cdfd-e5be-4e17-ae45-8555acccddbb	active
4b97cc51-c473-4a55-9381-0d5c2badf802	4a8f52e9-7247-4a75-8fe6-283fc6210a0b	Data Granularity	N/A	67fdaf92-80ab-48e9-a640-c3d16a0745fa	active
adaa2ff0-d84c-4ac7-9e79-712f69344f3d	4a8f52e9-7247-4a75-8fe6-283fc6210a0b	Data Status	Active	67fdaf92-80ab-48e9-a640-c3d16a0745fa	active
82bfb844-89b8-4345-8222-489523ca28fa	4a8f52e9-7247-4a75-8fe6-283fc6210a0b	Geospatial Coverage	South Australia	67fdaf92-80ab-48e9-a640-c3d16a0745fa	active
74d1831e-e402-423a-bb42-a9c2fc169df4	4a8f52e9-7247-4a75-8fe6-283fc6210a0b	Update Frequency	As Required	67fdaf92-80ab-48e9-a640-c3d16a0745fa	active
86508127-524e-4be7-b4de-50f65fe5d036	4a8f52e9-7247-4a75-8fe6-283fc6210a0b	Temporal Coverage	May 2014	67fdaf92-80ab-48e9-a640-c3d16a0745fa	active
da9b8738-f66c-4b1e-9cd3-84fbfa31f4ee	4a8f52e9-7247-4a75-8fe6-283fc6210a0b	Data Location	Linked	67fdaf92-80ab-48e9-a640-c3d16a0745fa	active
d8b807eb-b5f5-481f-a653-7e8d8514b152	9be27502-7448-469b-b251-ac8b14c69ebb	Data Granularity	N/A	a2450cbf-3865-45c1-a5c9-492929580938	active
15fd433c-44dc-46ff-8280-299993797cba	9be27502-7448-469b-b251-ac8b14c69ebb	Data Status	N/A	a2450cbf-3865-45c1-a5c9-492929580938	active
c4bafb1c-7b03-4862-821c-bfb79179720b	9be27502-7448-469b-b251-ac8b14c69ebb	Geospatial Coverage	South Australia	a2450cbf-3865-45c1-a5c9-492929580938	active
f9280859-89be-4f53-b851-5b806a30aba5	9be27502-7448-469b-b251-ac8b14c69ebb	Update Frequency	As Required	a2450cbf-3865-45c1-a5c9-492929580938	active
725c9355-1c5f-4d27-9c36-e21c4e5b0750	9be27502-7448-469b-b251-ac8b14c69ebb	Temporal Coverage	December 2006	a2450cbf-3865-45c1-a5c9-492929580938	active
986f42cb-015a-42d2-b36f-7e80e6d15ef8	9be27502-7448-469b-b251-ac8b14c69ebb	Data Location	Linked	a2450cbf-3865-45c1-a5c9-492929580938	active
936016cf-a1fb-4e7c-9e70-572c3e05320c	18548efb-c403-4b03-8e97-78d862a4c86b	Data Granularity	N/A	bb1311e4-d166-440b-9642-874bd661ea75	active
a1771199-e9ba-4e78-937d-0085f494da94	18548efb-c403-4b03-8e97-78d862a4c86b	Data Status	Inactive	bb1311e4-d166-440b-9642-874bd661ea75	active
68b8beb5-ca45-4405-b394-77af68f93647	18548efb-c403-4b03-8e97-78d862a4c86b	Geospatial Coverage	South Australia	bb1311e4-d166-440b-9642-874bd661ea75	active
01b68ae1-c46b-4925-95e5-e0fc6dd631ad	18548efb-c403-4b03-8e97-78d862a4c86b	Update Frequency	As Required	bb1311e4-d166-440b-9642-874bd661ea75	active
b0b85d1b-ee7b-4c72-8bd9-3fe3b8a2fbf2	18548efb-c403-4b03-8e97-78d862a4c86b	Temporal Coverage	December 2012	bb1311e4-d166-440b-9642-874bd661ea75	active
1b3be736-ace4-46a6-8a80-fd97d3432737	18548efb-c403-4b03-8e97-78d862a4c86b	Data Location	Linked	bb1311e4-d166-440b-9642-874bd661ea75	active
915ca101-f51a-49dc-80f0-720ce4e59430	56a26686-9e02-437d-9bcb-830ecdf6bf40	Data Granularity	N/A	10f8d24f-9e13-4f14-9c40-406cfe7494a5	active
bd22dff7-8b65-4591-9eb7-bf3317ab458c	56a26686-9e02-437d-9bcb-830ecdf6bf40	Data Status	Inactive	10f8d24f-9e13-4f14-9c40-406cfe7494a5	active
414e9122-ad9c-4a52-949c-e3b744510573	56a26686-9e02-437d-9bcb-830ecdf6bf40	Geospatial Coverage	South Australia	10f8d24f-9e13-4f14-9c40-406cfe7494a5	active
9bb15977-5dee-4d24-9933-f0256d43a631	56a26686-9e02-437d-9bcb-830ecdf6bf40	Update Frequency	As Required	10f8d24f-9e13-4f14-9c40-406cfe7494a5	active
acd95b31-1261-449f-9fcf-b95cf4535ab5	56a26686-9e02-437d-9bcb-830ecdf6bf40	Temporal Coverage	July 2009	10f8d24f-9e13-4f14-9c40-406cfe7494a5	active
7df2eed9-fd66-4083-bd6f-5b729310eac3	56a26686-9e02-437d-9bcb-830ecdf6bf40	Data Location	Linked	10f8d24f-9e13-4f14-9c40-406cfe7494a5	active
437c67bb-4316-46e7-96e2-6f091d9bb016	d51f4828-9b06-499c-9ea3-b5fc638eee75	Data Granularity	N/A	8f7224b7-d6d4-4938-8691-ae2862c8609b	active
8e99f50c-66f6-4de6-b4e8-1ee48533cea2	d51f4828-9b06-499c-9ea3-b5fc638eee75	Data Status	Inactive	8f7224b7-d6d4-4938-8691-ae2862c8609b	active
e6e86149-ecbb-43c4-b2d2-b0525dc253f1	d51f4828-9b06-499c-9ea3-b5fc638eee75	Geospatial Coverage	South Australia	8f7224b7-d6d4-4938-8691-ae2862c8609b	active
01564f93-752f-427a-9732-325aef852308	d51f4828-9b06-499c-9ea3-b5fc638eee75	Update Frequency	As Required	8f7224b7-d6d4-4938-8691-ae2862c8609b	active
f6936cb2-a8da-4856-8a62-1a726b5bd416	d51f4828-9b06-499c-9ea3-b5fc638eee75	Temporal Coverage	1998	8f7224b7-d6d4-4938-8691-ae2862c8609b	active
933da3a1-53f5-4525-9588-ec0434c80c41	d51f4828-9b06-499c-9ea3-b5fc638eee75	Data Location	Linked	8f7224b7-d6d4-4938-8691-ae2862c8609b	active
37703381-52da-46fe-9fd6-f9102b7033d9	eb5cf41e-7170-488b-8c03-9e04292f1ff7	Data Granularity	N/A	d081fcbc-cc8b-44ed-8d20-7445877dd424	active
a950442e-e83b-4a68-877c-29e8aa99b68e	eb5cf41e-7170-488b-8c03-9e04292f1ff7	Data Status	Inactive	d081fcbc-cc8b-44ed-8d20-7445877dd424	active
3a841f3e-b58b-46b7-bd1b-cb316e20cd71	eb5cf41e-7170-488b-8c03-9e04292f1ff7	Geospatial Coverage	South Australia	d081fcbc-cc8b-44ed-8d20-7445877dd424	active
a79a712c-a23e-4f33-832d-93e91900f2d9	eb5cf41e-7170-488b-8c03-9e04292f1ff7	Update Frequency	As Required	d081fcbc-cc8b-44ed-8d20-7445877dd424	active
a56eefee-1df4-4402-9c00-c7d1634b930e	eb5cf41e-7170-488b-8c03-9e04292f1ff7	Temporal Coverage	May 2014	d081fcbc-cc8b-44ed-8d20-7445877dd424	active
28d8943a-1a73-4803-9dce-16660fcdec41	eb5cf41e-7170-488b-8c03-9e04292f1ff7	Data Location	Linked	d081fcbc-cc8b-44ed-8d20-7445877dd424	active
ace0044a-a656-414b-a7f9-4f8d31674157	77c4731e-59a3-4bce-aaa3-6141ab0ab738	Data Granularity	N/A	27362229-5786-42c2-b19a-9408181f0001	active
42b3dc45-2377-49c2-a733-ac2e3cb16221	77c4731e-59a3-4bce-aaa3-6141ab0ab738	Data Status	Inactive	27362229-5786-42c2-b19a-9408181f0001	active
4af5a72b-2520-416d-b9ae-bd7e90fe48c3	77c4731e-59a3-4bce-aaa3-6141ab0ab738	Geospatial Coverage	Mount Lofty Ranges	27362229-5786-42c2-b19a-9408181f0001	active
16b1b81c-698e-4bb3-9a25-40ae63f12667	77c4731e-59a3-4bce-aaa3-6141ab0ab738	Update Frequency	As Required	27362229-5786-42c2-b19a-9408181f0001	active
2e5b5e93-fb0b-4453-91a3-8a800734c5a4	77c4731e-59a3-4bce-aaa3-6141ab0ab738	Temporal Coverage	July 2004	27362229-5786-42c2-b19a-9408181f0001	active
1ec89486-77da-424a-8f3f-27ff700a96e5	77c4731e-59a3-4bce-aaa3-6141ab0ab738	Data Location	Linked	27362229-5786-42c2-b19a-9408181f0001	active
fde46664-df94-4a77-9626-7cf1f2cdfc31	ed440a90-e96f-49d2-914d-c15ea8a96f89	Status	Redundant	3e6ba8d6-fa97-482d-8062-b179718135f5	active
be107106-3cab-4700-b94d-ced9580338a2	90f97270-56ed-4ce8-ab7a-4f34c938a63c	Status	Redundant	ccaefb65-d1af-4831-8f1b-1a7623613072	active
12205d27-40fc-4ead-ab3d-002dc6c9b7ee	d03c34e0-ddc4-4677-98dd-3a5960b6631d	Status	Redundant	111ed80d-97f0-46db-846a-384f24eea287	active
749cd91d-a9e2-4a3b-9a6f-c935f97152f9	3753bdf8-6c4d-4810-8b7f-c17452b9811b	Status	Redundant	cbfb8da9-e564-4f79-a62a-fb22c7bf1689	active
09fee36c-c903-4a3f-9e51-0597bd8b5782	847dfdea-cf54-4597-831f-0e95e59f3fc3	Status	Redundant	f003035c-540a-41e8-9c66-ef597b0ce5bb	active
22a1e3cf-3e09-4c29-878f-528421d5a8ad	21cb4b70-c088-4e34-b3ea-b0a4ca7cc455	Status	Redundant	6ca63e16-f4f3-4002-a1e7-e357dae6178e	active
c525d64f-916b-4bb9-a8b3-c0bcdd536cd0	e4da9ce6-c82d-42bc-a487-88169d0fc6f6	Status	Redundant	6e010fdc-f535-479f-9409-68b543378f37	active
7b5554a7-18e0-4367-b881-a6039833a9d4	19d0992f-8554-41e7-90f2-5390b1ff720c	Status	Redundant	c1e24add-35d1-47c6-a4c0-39288bfe38b8	active
d65ba24e-363e-4043-9c60-48b936d78797	ecadbc4d-0738-43fa-a72b-4f77729451d7	Status	Redundant	6a8e483a-7165-46f5-8f2f-24c604ffe591	active
ca1f2810-1641-4b14-a519-ba4070b49514	e5d6588a-f163-4f6a-bc57-25e95c87b5bd	Update Frequency	Weekly, Saturday.	2a1802ad-0a07-4d9d-b21d-44dca19ee901	active
18147658-01bc-42a6-85d5-340bb0c756e5	ded7c11d-2cd3-4bff-8d6f-dd850250a486	Update Frequency	Weekly, Saturday.	b9894d86-6dd2-43ec-ae4e-fc1e6b0a8d49	active
526cad4c-8bc2-4553-9195-739651c49478	c507f056-f5c9-4b03-8494-0665d5bea583	Update Frequency	Weekly, Saturday.	d4ff7de9-9392-48ab-ac71-810248800934	active
bb0fb254-c332-4196-b4e8-2af58a568ed8	5703f651-4731-4c5d-834d-2de139c3495d	Update Frequency	Weekly, Saturday.	c1b8fba2-1b2f-4e36-b367-9a60563bba1d	active
bb334474-c363-443a-a3ea-3ece35ce7221	e4e7b7bf-232a-4193-b220-026d64dd829b	Update Frequency	Weekly, Saturday.	c8b58a56-8170-4e74-a6a7-30aab41fd5b5	active
a91411ee-af76-4a1a-a734-4676f8ea4fe3	c338fbca-f933-4fcd-839c-e2e7db006ea3	Update Frequency	Weekly, Saturday.	d0ff90a7-47a9-4401-99a6-baaac4a216c9	active
60dfbfbc-7b70-417e-8067-6feefa79a4f1	c338fbca-f933-4fcd-839c-e2e7db006ea3	Data Granularity	Weekly by Route, Trip, and Stop	d0ff90a7-47a9-4401-99a6-baaac4a216c9	active
07509a59-05f5-44e0-9ff5-28b5fbce25eb	c338fbca-f933-4fcd-839c-e2e7db006ea3	Geospatial Coverage	Adelaide Metropolitan Area [Lat: -34.3862 to -35.3655, Lon: 138.4126 to 139.1089]	d0ff90a7-47a9-4401-99a6-baaac4a216c9	active
0a777b3e-cada-4d65-b640-25bc9dcc4683	c338fbca-f933-4fcd-839c-e2e7db006ea3	Temporal Coverage	From January 2013	d0ff90a7-47a9-4401-99a6-baaac4a216c9	active
75cbd6b1-a552-4618-b8b7-d2aa70461fd5	2d972378-33e0-4be3-a412-c65a02fccb25	Update Frequency	Weekly, Saturday.	2a484a47-252e-40ba-977f-efc2504ba638	active
5d5ff745-58ea-4c9d-a030-673ca7cdc2f4	8c04fe5a-a624-467b-b5b8-61337c1870ec	Update Frequency	Weekly, Saturday.	3fe23bc1-79a9-41cc-b8f4-ccec61793dc5	active
e5e8df4f-0c42-4304-97be-c70fe05499c2	0384a465-903c-4b2b-93ec-826acbe2c66b	Update Frequency	Created 2013, not updated	1d677883-3501-4731-8364-91f45344802a	active
fd0526a8-11ef-46a0-bcce-e7d52c91a86d	0384a465-903c-4b2b-93ec-826acbe2c66b	Geospatial Coverage	Adelaide	1d677883-3501-4731-8364-91f45344802a	active
87bfc8b1-3dad-44f5-9b5c-ced6dbe9a9f1	0384a465-903c-4b2b-93ec-826acbe2c66b	Temporal Coverage	1914-1916	1d677883-3501-4731-8364-91f45344802a	active
4accb028-565c-4428-a01b-b0c4a17fd636	fc9ff9ba-015f-45a0-8503-9355c1fb9c5c	Update Frequency	As Required	f3cc4a6f-32b8-4123-9960-151087eb5f2a	active
749bbff8-a28f-4a67-984e-d7450cc0300b	fc9ff9ba-015f-45a0-8503-9355c1fb9c5c	Geospatial Coverage	South Australian	f3cc4a6f-32b8-4123-9960-151087eb5f2a	active
ed5b483e-bc49-4db4-87bb-d00a872df9f6	fc9ff9ba-015f-45a0-8503-9355c1fb9c5c	Temporal Coverage	2011 - Current	f3cc4a6f-32b8-4123-9960-151087eb5f2a	active
301513d3-9d05-48ad-84d3-75640341c4d9	77afe596-b5bb-4a7a-a8f3-f56848b975a8	Status	Redundant	9c9fa55c-b211-4773-96ae-871e906d61e4	active
26086115-4ab1-4631-aa2e-667eed5dcb07	5a0381b3-1923-4ad3-b76b-c90e19fa2762	Status	Redundant	74b7342c-96cd-4d99-899a-4c357c1bad86	active
f938f059-a621-49dd-8161-c232e836682b	68ce0023-5542-425c-a35a-870854781259	Temporal Coverage	Current	8c7fcca4-6431-40f3-ba97-a0d886ced158	active
aa45e0f8-b63d-4ee3-a151-06c486e5f896	68ce0023-5542-425c-a35a-870854781259	Geographical Coverage	Metropolitan Adelaide	8c7fcca4-6431-40f3-ba97-a0d886ced158	active
445ecffa-bae4-4464-a660-fe36507cbdc1	68ce0023-5542-425c-a35a-870854781259	Update Frequency	Refreshed weekly but dataset updated on an "as required basis".	8c7fcca4-6431-40f3-ba97-a0d886ced158	active
deb40ae0-77d7-4cb7-bb89-f356d584c78c	35052751-5f7a-4c7d-a517-716ea5a3e865	Temporal Coverage	Current	0e70d7e6-0137-40ba-9004-ffe93989ab5e	active
c9174829-bdaf-45ba-b6a1-6650b5425aec	35052751-5f7a-4c7d-a517-716ea5a3e865	Update Frequency	Refreshed on a weekly basis however the data as such is only updated on an “as required” basis.	0e70d7e6-0137-40ba-9004-ffe93989ab5e	active
c6578661-c047-40cf-95e2-de1f28edb73d	c5e11fec-50a5-483f-a5fa-9087985c3cfb	Update Frequency	Refreshed on a weekly basis however the data as such is only updated on an “as required” basis.	fd4a026b-8635-4b59-ac27-60c9345c5d5f	active
60b396fc-c466-4aed-8f38-93ca8e2339bf	c5e11fec-50a5-483f-a5fa-9087985c3cfb	Geospatial Coverage	Adelaide Metropolitan area and part of the Adelaide Hills up through Clare and towards the Flinders ranges to Blinman.	fd4a026b-8635-4b59-ac27-60c9345c5d5f	active
8d7ad463-8a69-49bf-b918-e65a0882fc69	c5e11fec-50a5-483f-a5fa-9087985c3cfb	Temporal Coverage	Current	fd4a026b-8635-4b59-ac27-60c9345c5d5f	active
e801d962-4d76-4cbf-80b9-a8be47b4eea0	35052751-5f7a-4c7d-a517-716ea5a3e865	Geographical Coverage	Statewide	75e01c3a-2c7e-4641-810b-f7d4b6c1329d	deleted
2db07461-f25b-4d4d-a6c5-ee8998971898	35052751-5f7a-4c7d-a517-716ea5a3e865	Geospatial Coverage	Statewide	75e01c3a-2c7e-4641-810b-f7d4b6c1329d	active
084d9bbf-d216-4af7-b7a5-e4fc940a055a	6f1f602b-1e1f-4158-8445-56dd34d2914e	Geospatial Coverage	Statewide	5e444307-59e5-4b85-82dc-882e628a3915	active
b1da3572-aaa1-4773-9966-658fcd9166cb	6f1f602b-1e1f-4158-8445-56dd34d2914e	Temporal Coverage	Current	5e444307-59e5-4b85-82dc-882e628a3915	active
57fdd667-f968-4f7b-9589-4aab58cd67ee	6f1f602b-1e1f-4158-8445-56dd34d2914e	Update Frequency	Every 4 years	8d8dda8f-160c-44cc-8e8a-26222e270aaa	active
12888a25-01cf-450f-bfd3-487d8376cdba	a48c54cf-f276-409b-b934-faeba4a85278	Update Frequency	Annually	c934d346-d00f-4177-b1f2-3a01f6398650	active
fba9f431-a575-4cf3-94bd-cfaf7254dbfb	a48c54cf-f276-409b-b934-faeba4a85278	Data Granularity	Individual Hospital	c934d346-d00f-4177-b1f2-3a01f6398650	active
bed8e3a5-5fac-44f7-8b22-f8a5d00ac5a7	a48c54cf-f276-409b-b934-faeba4a85278	Geospatial Coverage	South Australia	c934d346-d00f-4177-b1f2-3a01f6398650	active
9a193636-a98e-425d-80e1-6296470d4c5a	a48c54cf-f276-409b-b934-faeba4a85278	Temporal Coverage	2013	c934d346-d00f-4177-b1f2-3a01f6398650	active
0fb86969-f314-484d-86ab-0fee887caf6b	5c54b043-3788-4ecb-bb74-7a46110266ad	Update Frequency	Annually	67ccf2da-d97f-40e5-88ae-6d5ac451c49d	active
cbe4f87d-b782-49fd-82ff-5bc519cd57ba	5c54b043-3788-4ecb-bb74-7a46110266ad	Data Granularity	Individual Hospital	67ccf2da-d97f-40e5-88ae-6d5ac451c49d	active
69806f06-6426-48d9-af5a-a82ce0f49111	5c54b043-3788-4ecb-bb74-7a46110266ad	Temporal Coverage	2013	67ccf2da-d97f-40e5-88ae-6d5ac451c49d	active
679452bc-3b00-49c4-a71e-356c698b2840	fdc08250-d282-4812-8c4e-29d225b8cf7d	Update Frequency	Hourly at half past the hour.	ca0c7c3e-28f0-4a02-a8b9-af2b4d7f0c84	active
181eb67b-cbf4-454c-9198-a0a198ef0be5	fdc08250-d282-4812-8c4e-29d225b8cf7d	Data Granularity	1 hour averaged data for Ozone, Nitrogen dioxide and Sulfur dioxide, 8 hour averaged data for Carbon monoxide and 24 hour averaged data for PM10 and PM2.5.	ca0c7c3e-28f0-4a02-a8b9-af2b4d7f0c84	active
ab746cfd-062d-44e7-b9ee-1bfc155b6180	fdc08250-d282-4812-8c4e-29d225b8cf7d	Geospatial Coverage	South Australia	ca0c7c3e-28f0-4a02-a8b9-af2b4d7f0c84	active
41bf31a1-c8a7-40f2-945e-1432716ef697	fdc08250-d282-4812-8c4e-29d225b8cf7d	Temporal Coverage	Active	ca0c7c3e-28f0-4a02-a8b9-af2b4d7f0c84	active
feabcb24-afbd-47db-8d13-66493dc07d01	f0bad1bc-2e94-4957-a52a-e2c58e3ebc79	Update Frequency	Refreshed on a weekly basis, data content is updated when required	ac99f7a6-7ef3-4113-9253-55d6e77f27c6	active
151c1ccd-ea00-4ffa-b6ce-96b98098dd9b	f0bad1bc-2e94-4957-a52a-e2c58e3ebc79	Geospatial Coverage	South Australia	ac99f7a6-7ef3-4113-9253-55d6e77f27c6	active
b3eb87c4-d958-4a03-ab58-a363e096df26	f0bad1bc-2e94-4957-a52a-e2c58e3ebc79	Temporal Coverage	Current	ac99f7a6-7ef3-4113-9253-55d6e77f27c6	active
55b4b4be-366d-428a-b703-d8b684e451b8	6a3284d3-d2a2-4cb6-bddf-5a31d622f4d8	Update Frequency	Students and Course and the Student Outcomes Survey are updated annually; Apprentices and Trainees is updated quarterly.	9a032322-5a53-4164-9084-4ba9cbe8d59c	active
55f596be-ecd1-4527-ac43-b5fb5840aebb	6a3284d3-d2a2-4cb6-bddf-5a31d622f4d8	Geospatial Coverage	Australia, State and Territories	9a032322-5a53-4164-9084-4ba9cbe8d59c	active
63e395f7-0214-450c-9d9e-177d968e8a05	6a3284d3-d2a2-4cb6-bddf-5a31d622f4d8	Temporal Coverage	Up to 10 years time series is available from the website.	9a032322-5a53-4164-9084-4ba9cbe8d59c	active
7b7ed747-9f87-465d-851a-6528b97bcec9	f8647df4-617b-439c-8de2-6aadfc84826a	Update Frequency	Quarterly	ca8f9c74-0d1d-494f-a5da-c2a665f6db9e	active
5c229775-0a8f-4f57-9921-4f49b31ddbc0	f8647df4-617b-439c-8de2-6aadfc84826a	Geospatial Coverage	South Australia	ca8f9c74-0d1d-494f-a5da-c2a665f6db9e	active
9140c6f5-9c1e-436a-a76a-0fb66a143176	f8647df4-617b-439c-8de2-6aadfc84826a	Temporal Coverage	1/7/2013 – 30/6/2014	ca8f9c74-0d1d-494f-a5da-c2a665f6db9e	active
a752d226-c1d9-47fe-a949-92d67a175c16	d1e68d18-e819-4408-a4e2-808137a24459	Data Status	Inactive	568a454f-af40-418b-8638-ec01e58b7e82	active
08d50b34-b842-4661-92e0-35bb9b3fa0a4	8c101ee9-db55-435a-99d1-defe180c0363	Update Frequency	5 years	1bb667dc-cc6b-4108-8821-0159ead5989a	active
85c6fdef-298e-40dd-acda-966eb0152207	cc2dafe2-e319-4a33-a394-7b6ffceadca5	Update Frequency	5 years	cdf4db35-8df1-46a6-aeb1-4f9ae8ba9f6b	active
a19805e3-80a7-4eba-bb34-a72377fdc2d8	2c238c6a-f6fe-45b5-87be-29d0db657b67	Update Frequency	5 years	0fc618c8-e283-44a6-b9b5-d12ce2ffb3b1	active
c2529895-2091-4647-871c-65333e9dfe97	6ed90b78-50c8-4951-9612-b118277f34e2	Update Frequency	5 years	127f98fc-1088-4991-b312-15a124a72fbc	active
6b8207bf-8c8f-455b-8480-6db64beae231	caf25c84-f573-4ed6-9a59-5e011f97f885	Update Frequency	5 years	dfc3f63b-cc4b-46af-817d-1dbba2767ad1	active
a7d06226-f0f8-4987-9594-2824679866f9	6a6e67cd-9ade-41d1-8f40-27d0f44f1f5f	Update Frequency	5 years	045b009c-2d9c-471c-b794-1c97b03803a9	active
db515af6-e259-4d9e-891d-23e18043b61e	4b364e51-cf83-45cc-8909-e0968b6ca0ed	Update Frequency	5 years	bf42a6a5-1fd9-45c0-8afd-428323fc67a6	active
da3dd0c3-70ef-4fea-9942-885e0f6e623e	fd503e5e-c3c3-402e-8afa-549354c2355c	Update Frequency	5 years	5a8732c1-3884-4b0b-843c-41859d8bd5f8	active
5a078a2d-c0bb-46ca-9a8b-28417a02882d	5e761b85-9dd8-4a4e-a3f8-820997b86233	Update Frequency	5 years	3fd31ae5-40ad-47b8-ab4a-c50ec1ee0576	active
71a7632d-480d-42e1-8a87-3dc39a8c4e34	49569a77-7c73-4466-a067-24080703c327	Update Frequency	5 years	52eecc30-7c8d-4110-81cd-70cc90ccb7bc	active
dcd1ad98-5c35-41cb-9f01-7bb339859b7f	778b9f71-5e1b-4e1c-86a2-6360ab9b0662	Update Frequency	5 years	95eb1a11-0907-4c3f-b47f-d073866c36f5	active
3c027725-ef86-49a9-9e18-97d7cec906d9	8ca998f8-9d6d-4655-af14-51f2e3b33b95	Update Frequency	5 years	00dd4a47-4957-46f5-83ee-bb1cd5a1e799	active
c55afefb-fae2-4727-bcdc-30860f0a1bee	932545a4-49d6-44d1-a44f-893aaa2264e2	Update Frequency	5 years	44ccffd2-2afd-4201-8fd0-eff159d5c531	active
df184012-c0e2-4ae0-971f-e044fedd593c	fe77c7df-52f9-415e-b0be-df0f8813c924	Update Frequency	5 years	8dc424e9-19d2-456c-9ef6-0ce9d327158c	active
b0d16a95-f8e7-4dbe-b35b-68e3b17a3608	4e191c1e-b971-441f-83f7-45e266c41b99	Update frequency	As required	85740ec3-4126-4064-beb8-89c9a56bfaf5	active
4bc80ef6-8af1-445a-ba12-a707f2e42f7e	ae85c76c-1267-4856-89de-1074e16e1908	Update Frequency	Monthly	bc8383f8-d586-45b1-9796-d44523b77e90	active
f54363e4-7e64-44ed-857e-4cdc5aadada3	ae85c76c-1267-4856-89de-1074e16e1908	Temporal Coverage	Current	bc8383f8-d586-45b1-9796-d44523b77e90	active
1ca0ca56-4ff9-4344-9267-65a610a1ce42	b95caeb1-9390-4228-9a93-69a04d25291a	Update Frequency		712bea56-e170-4ae2-b928-8d6bc3ca3fd0	active
cadd6f8e-bf49-4d10-b186-b2e0487b7e2e	b95caeb1-9390-4228-9a93-69a04d25291a	Temporal Coverage		712bea56-e170-4ae2-b928-8d6bc3ca3fd0	active
d71716f5-e25e-444e-8276-daf7a2b5e8c1	afb79702-215f-4d35-85bf-47f5e57f6cc9	Update Frequency	Annual	8d99cdee-5488-4d43-9e52-d72e7f0f01db	active
6ad56eec-2990-4e30-82fd-bfab3960cda4	2769db93-ebed-418e-9647-db24ef6bf066	Update Frequency	test	a5dd4a33-8383-4132-990c-22aa02ec81ed	active
99266998-3eb4-4b87-9553-b3aeb57a2842	759fc12c-0a5d-41c4-8cb1-fdcd2e5f3523	Update Frequency	Annual	a383b7ab-4744-4a0d-a9b9-16ccffc3b8bb	active
efdd557f-e923-4ad0-bd87-a8371b87fe59	41134274-fd8c-4667-a5ea-096ffc010ab4	Update Frequency	Annual	60cfe119-0a7a-491d-96d7-4d850b067a33	active
c6b8c35c-6a61-4ca8-b8cb-afd30da2b149	9ef49326-a879-4f67-b258-5505b290c95d	Update Frequency	Monthly	116746a2-66b6-4921-80b7-661e23a84277	active
8ace66aa-156e-4a1f-a512-a7b4ee880e2e	e4d36977-02fe-4f6f-98db-44cc57821523	Geographical Coverage	Statewide	4031b5bd-1130-45a9-89a3-375406aeecf7	active
41a52c3c-c2e0-4a31-9954-5ebc97ab7789	b667a56a-8959-41bc-a7cc-68e5bc858841	language	English	3671f47a-230d-4eab-859d-e4d1ffdc17e3	active
8cd18464-b8aa-4c92-9acd-5395dc2751e0	b667a56a-8959-41bc-a7cc-68e5bc858841	jurisdiction	South Australia	3671f47a-230d-4eab-859d-e4d1ffdc17e3	active
bc6c8771-5621-4908-85e7-7738d2794eda	b667a56a-8959-41bc-a7cc-68e5bc858841	temporal_coverage_to		3671f47a-230d-4eab-859d-e4d1ffdc17e3	active
65f5f109-9786-4e60-bcf2-919d088d4257	b667a56a-8959-41bc-a7cc-68e5bc858841	temporal_coverage_from		3671f47a-230d-4eab-859d-e4d1ffdc17e3	active
ae2f8ead-3ede-4838-a84b-6721332a791e	b667a56a-8959-41bc-a7cc-68e5bc858841	spatial		3671f47a-230d-4eab-859d-e4d1ffdc17e3	active
34d137d9-b72d-47fc-8c1f-cd612861be1c	b667a56a-8959-41bc-a7cc-68e5bc858841	spatial_coverage		bc942929-3a7f-46a7-b023-ca34c703e88e	active
488f1942-1980-47b5-be54-fa2ae390819c	b667a56a-8959-41bc-a7cc-68e5bc858841	update_freq	never	bc942929-3a7f-46a7-b023-ca34c703e88e	active
faf4f55a-c6d7-4dcf-ac83-edc3468dbe11	c8f6e5e0-d7e5-462f-a5f2-0e28ba909473	spatial_coverage	South Australia	52a01fb7-cfd8-45d0-95eb-a383844dd816	active
178355bc-d849-4342-9d08-99da6e3d580e	c8f6e5e0-d7e5-462f-a5f2-0e28ba909473	language	English	52a01fb7-cfd8-45d0-95eb-a383844dd816	active
3854b480-4b18-4887-8515-66d528ead6dc	c8f6e5e0-d7e5-462f-a5f2-0e28ba909473	jurisdiction	South Australia	52a01fb7-cfd8-45d0-95eb-a383844dd816	active
0294efa1-0b3b-4178-ae44-8f4c94c19bf1	c8f6e5e0-d7e5-462f-a5f2-0e28ba909473	temporal_coverage_to		52a01fb7-cfd8-45d0-95eb-a383844dd816	active
48c453b0-b3a4-4151-8091-358634726940	c8f6e5e0-d7e5-462f-a5f2-0e28ba909473	temporal_coverage_from		52a01fb7-cfd8-45d0-95eb-a383844dd816	active
1adbd45b-f090-4f06-8740-549929c11278	c8f6e5e0-d7e5-462f-a5f2-0e28ba909473	spatial		52a01fb7-cfd8-45d0-95eb-a383844dd816	active
665a3660-2265-4f7c-a80c-7999cfc801d9	c8f6e5e0-d7e5-462f-a5f2-0e28ba909473	data_state	active	52a01fb7-cfd8-45d0-95eb-a383844dd816	active
190a4f9f-5935-4182-bee7-2b6b512f05af	c8f6e5e0-d7e5-462f-a5f2-0e28ba909473	contact_point	datasa@sa.gov.au	52a01fb7-cfd8-45d0-95eb-a383844dd816	active
f17d6543-6925-4ea6-b47d-fc71933c600a	c8f6e5e0-d7e5-462f-a5f2-0e28ba909473	update_freq	annually	52a01fb7-cfd8-45d0-95eb-a383844dd816	active
7f707342-cf6e-4b8b-94d8-6bc58048c889	6416437a-727a-4b89-a280-1b92712c045a	spatial_coverage	South Australia	3ed7edb1-aa42-48e0-8e1d-b5a8267d8f49	active
7e8f6df6-e101-4eaf-8563-df153bd4a7b7	6416437a-727a-4b89-a280-1b92712c045a	language	English	3ed7edb1-aa42-48e0-8e1d-b5a8267d8f49	active
30583439-525d-43b9-8583-7c06c27fd1df	6416437a-727a-4b89-a280-1b92712c045a	jurisdiction	South Australia	3ed7edb1-aa42-48e0-8e1d-b5a8267d8f49	active
f478a4c9-61f0-451d-b83a-14e378cce9f3	6416437a-727a-4b89-a280-1b92712c045a	temporal_coverage_to		3ed7edb1-aa42-48e0-8e1d-b5a8267d8f49	active
286c2827-9160-437d-907d-5745efe34cb5	6416437a-727a-4b89-a280-1b92712c045a	temporal_coverage_from	2014-11-24	3ed7edb1-aa42-48e0-8e1d-b5a8267d8f49	active
6ed3fa03-23ab-4c0b-926b-dd7da27ad413	6416437a-727a-4b89-a280-1b92712c045a	contact_point	datasa@sa.gov.au	3ed7edb1-aa42-48e0-8e1d-b5a8267d8f49	active
5b774089-7078-4c9b-87c3-dd8120fd5f79	6416437a-727a-4b89-a280-1b92712c045a	update_freq	other	3ed7edb1-aa42-48e0-8e1d-b5a8267d8f49	active
b10b9e81-25e5-4f33-b87a-24d505e1cfe4	2801e4b9-75f5-41fa-be05-e45ed1455078	spatial_coverage	South Australia	7b11e9e7-82b3-4f09-8f3e-da472472bde7	active
16b274ea-eaba-47d3-83cf-3ad66e2c73e4	2801e4b9-75f5-41fa-be05-e45ed1455078	language	English	7b11e9e7-82b3-4f09-8f3e-da472472bde7	active
1d2ba46d-e1ff-4600-b4e7-8fb2686fffcf	2801e4b9-75f5-41fa-be05-e45ed1455078	jurisdiction	South Australia	7b11e9e7-82b3-4f09-8f3e-da472472bde7	active
e22585ca-2e10-4e24-b0af-802a332b8e53	2801e4b9-75f5-41fa-be05-e45ed1455078	temporal_coverage_to		7b11e9e7-82b3-4f09-8f3e-da472472bde7	active
6a277ab1-3019-43f9-9c90-2ef167a9e2cc	2801e4b9-75f5-41fa-be05-e45ed1455078	temporal_coverage_from		7b11e9e7-82b3-4f09-8f3e-da472472bde7	active
7be14f2d-37b2-4c68-931a-7b0934035b7a	2801e4b9-75f5-41fa-be05-e45ed1455078	spatial		7b11e9e7-82b3-4f09-8f3e-da472472bde7	active
d824bd66-d398-4326-8d58-3c5449f558e4	2801e4b9-75f5-41fa-be05-e45ed1455078	data_state	active	7b11e9e7-82b3-4f09-8f3e-da472472bde7	active
b977dc1f-64e2-45f2-8b53-175715b987bd	2801e4b9-75f5-41fa-be05-e45ed1455078	contact_point	datasa@sa.gov.au	7b11e9e7-82b3-4f09-8f3e-da472472bde7	active
63fed570-2d57-4248-8f09-10bc96113c76	2801e4b9-75f5-41fa-be05-e45ed1455078	update_freq	daily	7b11e9e7-82b3-4f09-8f3e-da472472bde7	active
1d8adc91-8544-4c91-b016-527ef3c44731	6f6886f3-ccb3-41cb-91db-d3dcc0cd0cfa	language	English	91e7b5f9-c211-438e-8a32-985833514a92	active
3da211e9-529e-470b-ab2b-e44bcf791ba6	6f6886f3-ccb3-41cb-91db-d3dcc0cd0cfa	temporal_coverage_to		91e7b5f9-c211-438e-8a32-985833514a92	active
808a67f6-6513-41f8-96d6-9dd9b2d6dddf	6f6886f3-ccb3-41cb-91db-d3dcc0cd0cfa	temporal_coverage_from		91e7b5f9-c211-438e-8a32-985833514a92	active
121560f1-4ac3-4e37-ae84-012432844916	6f6886f3-ccb3-41cb-91db-d3dcc0cd0cfa	spatial		91e7b5f9-c211-438e-8a32-985833514a92	active
c53ac283-bbe3-41d5-a3a7-c756103c01d7	6f6886f3-ccb3-41cb-91db-d3dcc0cd0cfa	update_freq	annually	91e7b5f9-c211-438e-8a32-985833514a92	active
bdf01ad2-fa9c-4bf1-ad7c-2d2e8abacf13	6f6886f3-ccb3-41cb-91db-d3dcc0cd0cfa	spatial_coverage	South Australia, City of Salisbury	9068d7af-7732-4b0f-95cf-71c9ec13a2a9	active
1e2566bd-a9ea-4013-9def-d126053525d2	fcc91952-372f-400a-a09d-2db4ec0fc7f2	source_type	ckan	ec9e5f13-f0f4-44c8-b36c-83dc54585005	active
12f537dc-a421-426c-adda-09da48b6acb2	fcc91952-372f-400a-a09d-2db4ec0fc7f2	frequency	WEEKLY	ec9e5f13-f0f4-44c8-b36c-83dc54585005	active
66caee8d-8018-4ecb-84cc-81c9cdb78dac	fcc91952-372f-400a-a09d-2db4ec0fc7f2	config	{"read_only": true, "default_extras": {"harvest_url": "{harvest_source_url}/dataset/{dataset_id}"}, "harvested_dataset_whitelist": ["Geoscience Australia CSW"], "user": "custodian"}	ec9e5f13-f0f4-44c8-b36c-83dc54585005	active
\.


--
-- Data for Name: package_extra_revision; Type: TABLE DATA; Schema: public; Owner: sa
--

COPY package_extra_revision (id, package_id, key, value, revision_id, continuity_id, state, expired_id, revision_timestamp, expired_timestamp, current) FROM stdin;
7472cd2b-29c2-427f-9a3b-510acf84b033	1d18e234-c331-44fb-9b93-32ef20578768	Frequency	Periodic	df356919-df12-489d-8e71-9e0f3bd9e9bd	7472cd2b-29c2-427f-9a3b-510acf84b033	active	\N	2013-03-14 06:16:46.724739	9999-12-31 00:00:00	t
5e2da36b-d196-4266-b67d-199f22c3ac6c	1d18e234-c331-44fb-9b93-32ef20578768	Coverage	South Australia	df356919-df12-489d-8e71-9e0f3bd9e9bd	5e2da36b-d196-4266-b67d-199f22c3ac6c	active	\N	2013-03-14 06:16:46.724739	9999-12-31 00:00:00	t
a4c8fca9-e3ce-4c6f-84a6-53e32eece879	1d18e234-c331-44fb-9b93-32ef20578768	Granularity		df356919-df12-489d-8e71-9e0f3bd9e9bd	a4c8fca9-e3ce-4c6f-84a6-53e32eece879	active	\N	2013-03-14 06:16:46.724739	9999-12-31 00:00:00	t
e2ac20a3-56ae-47cb-8128-f4b55c379242	9fb5195b-e696-45bb-a277-866e2efa62d5	Refresh Frequency	Ad Hoc	e47efc64-f751-4f5c-869f-5fe5f0674a95	e2ac20a3-56ae-47cb-8128-f4b55c379242	active	\N	2013-08-01 04:52:47.27799	9999-12-31 00:00:00	t
b0d16a95-f8e7-4dbe-b35b-68e3b17a3608	4e191c1e-b971-441f-83f7-45e266c41b99	Update frequency	Weekly Automated	0acd6637-7ab9-4dbb-8792-eec19d80c236	b0d16a95-f8e7-4dbe-b35b-68e3b17a3608	active	85740ec3-4126-4064-beb8-89c9a56bfaf5	2013-09-03 00:59:25.473654	2014-09-17 02:59:14.225553	f
a1d37d96-f460-4c03-b150-2be906fa042e	35381991-7dc3-42cc-b742-1c8dedc3dfa0	Last Update 	2008	3395f0ed-4916-437a-a5e1-fba4b9faf2b6	a1d37d96-f460-4c03-b150-2be906fa042e	active	45a52d25-77ec-4123-90d4-0fdc413e55c8	2013-08-02 02:39:17.956124	2014-06-18 01:37:37.855439	f
cb5385b3-bd4e-4902-992f-d1ef2b698791	921d83cc-bf41-48da-9781-07a8af8e3007	Last Updated 	2009	87de3b17-0d54-4e23-aad5-566600c2d164	cb5385b3-bd4e-4902-992f-d1ef2b698791	active	08b7a777-34f9-48ff-94f7-117c81327a5b	2013-08-02 04:34:41.684975	2014-06-18 04:21:28.780399	f
251827e9-5519-40ed-b1f0-a3a700a66b08	35381991-7dc3-42cc-b742-1c8dedc3dfa0	Refresh Frequency		0c343d09-ba2c-4e14-8d7b-3e661e8ad414	251827e9-5519-40ed-b1f0-a3a700a66b08	active	\N	2013-08-02 00:46:23.949716	9999-12-31 00:00:00	t
55c7463d-7777-4b55-95e2-203744debccb	868db81d-021c-4aed-994b-403e29afdd43	Refresh Frequency	Ad Hoc	7c1bd6ec-8d68-40c9-9156-0d3dd376cf0d	55c7463d-7777-4b55-95e2-203744debccb	active	9c9dfbea-1088-4df3-9acd-6d0ba3596415	2013-08-01 06:56:08.848004	2014-06-18 05:01:38.509464	f
e90f6206-c7a8-4626-91c9-c5fefa1a7881	f33c5b36-a450-4755-837c-6e0cf289e20e	Last Updated	2007	ca6cc00b-3cb4-4a89-b06d-ac477686c634	e90f6206-c7a8-4626-91c9-c5fefa1a7881	active	12d276d8-8635-4fcc-acae-88a8c78977ed	2013-08-02 06:34:19.011259	2014-06-18 05:53:11.476447	f
4349c3e3-88f5-40da-b70f-540855385e57	6c32ef31-aa23-4377-926b-bb9fa4038f89	Last Updated	2001	aabd5dc3-6d0e-4238-8b92-d22155bdb1b6	4349c3e3-88f5-40da-b70f-540855385e57	active	4c0aa4b8-c456-4214-b48c-d88ae4da051b	2013-08-02 05:41:03.577728	2014-06-18 05:54:06.165701	f
83ea098f-920c-4451-8a11-38f42a986e19	c471cb83-7e6e-46f2-8b43-ee43acc4df36	Refresh Frequency	Ad Hoc	372e261f-bf49-40df-a5a0-df1a0729470a	83ea098f-920c-4451-8a11-38f42a986e19	active	\N	2013-08-02 06:42:48.281471	9999-12-31 00:00:00	t
0214c2c9-7741-44d6-8754-e87bd852b4ca	3666bf95-528f-4cef-a955-1e35a89855a9	Refresh Frequency	Ad Hoc	75c325f8-ee8f-470d-9f12-9f11e77914b4	0214c2c9-7741-44d6-8754-e87bd852b4ca	active	f1e62db9-3b99-44a4-8c46-9d472b53e169	2013-08-01 07:35:27.573976	2014-06-18 05:55:36.905413	f
3ab3ae8a-81fb-4bd3-a248-24cea8d373f9	0d2f65f9-4386-4352-b46e-1259ebc06afe	Update Frequency	Quarterly	94c8f3a6-3dc0-4e50-b633-cbbcd01aaa23	3ab3ae8a-81fb-4bd3-a248-24cea8d373f9	active	\N	2013-08-26 07:27:05.978559	9999-12-31 00:00:00	t
6cb17dc1-fcb3-4c86-90da-99851e4bb16d	0d2f65f9-4386-4352-b46e-1259ebc06afe	Creation Date	August 2013	94c8f3a6-3dc0-4e50-b633-cbbcd01aaa23	6cb17dc1-fcb3-4c86-90da-99851e4bb16d	active	\N	2013-08-26 07:27:05.978559	9999-12-31 00:00:00	t
624a239f-7978-4152-a2f1-fc6b9e4564eb	978b650a-ba51-48d2-87c2-7ad20892f4ec	Last Updated	2010	56386e8b-f758-433b-809a-e403db2d0992	624a239f-7978-4152-a2f1-fc6b9e4564eb	active	52931619-548a-4717-8362-edc322d35028	2013-08-02 04:49:47.104308	2014-06-18 06:04:00.831091	f
7a8f660a-3ec9-4557-b239-f8ddf2281780	a6b78241-de36-4180-878b-d5d0db01d69a	Data Location	Linked	38674e49-a847-411a-89a0-1de0b134cab8	7a8f660a-3ec9-4557-b239-f8ddf2281780	active	\N	2013-09-02 08:14:43.726898	9999-12-31 00:00:00	t
7e4e2d14-0bc8-4c45-9ca5-baf6be2c6553	4af43922-62b1-49c7-a3d1-f2381ca52b5d	Data Location	Linked	cd99bb4f-dcce-4a97-b794-fb7c2d9c293d	7e4e2d14-0bc8-4c45-9ca5-baf6be2c6553	active	\N	2013-09-02 08:18:03.892433	9999-12-31 00:00:00	t
026aa469-95c6-4530-bbef-b5420ae460ab	4af43922-62b1-49c7-a3d1-f2381ca52b5d	Updated Frequency	Weekly	cd99bb4f-dcce-4a97-b794-fb7c2d9c293d	026aa469-95c6-4530-bbef-b5420ae460ab	active	\N	2013-09-02 08:18:03.892433	9999-12-31 00:00:00	t
4bcb56cc-bde3-41ff-ae4b-2c15bbef8933	4af43922-62b1-49c7-a3d1-f2381ca52b5d	Refresh Frequency	Weekly	e0f7aa8d-ac9e-415b-9995-a5e47efd9838	4bcb56cc-bde3-41ff-ae4b-2c15bbef8933	active	cd99bb4f-dcce-4a97-b794-fb7c2d9c293d	2013-09-02 08:06:52.678947	2013-09-02 08:18:03.892433	f
4bcb56cc-bde3-41ff-ae4b-2c15bbef8933	4af43922-62b1-49c7-a3d1-f2381ca52b5d	Refresh Frequency	Weekly	cd99bb4f-dcce-4a97-b794-fb7c2d9c293d	4bcb56cc-bde3-41ff-ae4b-2c15bbef8933	deleted	\N	2013-09-02 08:18:03.892433	9999-12-31 00:00:00	t
203c7a7c-aa46-42b2-9eca-f217613f9f88	0ffa95bd-9345-4dd5-aa22-e91158538743	Data Location	Linked	b70ecaa5-9b55-415f-abc8-5beebc9be676	203c7a7c-aa46-42b2-9eca-f217613f9f88	active	\N	2013-09-02 08:38:51.222522	9999-12-31 00:00:00	t
891338bb-15d7-4b44-8ae4-76834a36b968	0ffa95bd-9345-4dd5-aa22-e91158538743	Update Frequency	Weekly	b70ecaa5-9b55-415f-abc8-5beebc9be676	891338bb-15d7-4b44-8ae4-76834a36b968	active	\N	2013-09-02 08:38:51.222522	9999-12-31 00:00:00	t
47464b7b-e4f7-48a1-a5c4-dc0d7e6bef40	0ffa95bd-9345-4dd5-aa22-e91158538743	Refresh Frequency	Weekly	b70ecaa5-9b55-415f-abc8-5beebc9be676	47464b7b-e4f7-48a1-a5c4-dc0d7e6bef40	deleted	\N	2013-09-02 08:38:51.222522	9999-12-31 00:00:00	t
47464b7b-e4f7-48a1-a5c4-dc0d7e6bef40	0ffa95bd-9345-4dd5-aa22-e91158538743	Refresh Frequency	Weekly	86e31239-5ef9-4662-a002-6bafbb669471	47464b7b-e4f7-48a1-a5c4-dc0d7e6bef40	active	b70ecaa5-9b55-415f-abc8-5beebc9be676	2013-09-02 08:07:44.69101	2013-09-02 08:38:51.222522	f
054a66e2-1578-47d7-a463-7be89f0cda74	3d1fc5f0-ce19-4b68-a7cd-191ded177f5e	Update Frequency	Yearly	97132c29-5c13-489b-909d-39df23717a04	054a66e2-1578-47d7-a463-7be89f0cda74	active	\N	2013-09-02 08:42:29.213114	9999-12-31 00:00:00	t
4930076c-fa61-4fe7-89e9-df15a992fe32	3d1fc5f0-ce19-4b68-a7cd-191ded177f5e	Data Location	Linked	97132c29-5c13-489b-909d-39df23717a04	4930076c-fa61-4fe7-89e9-df15a992fe32	active	\N	2013-09-02 08:42:29.213114	9999-12-31 00:00:00	t
8ca4166c-baff-43c6-af87-7e0398c2d73a	a6b78241-de36-4180-878b-d5d0db01d69a	Update Frequency	Automatic	38674e49-a847-411a-89a0-1de0b134cab8	8ca4166c-baff-43c6-af87-7e0398c2d73a	active	158da427-76e0-4854-93f6-a3c5c0a1253a	2013-09-02 08:14:43.726898	2013-09-02 08:52:06.056926	f
d616daf1-fd1f-4f77-b1fd-33483780ee19	3d1fc5f0-ce19-4b68-a7cd-191ded177f5e	Refresh Frequency	Yearly	97132c29-5c13-489b-909d-39df23717a04	d616daf1-fd1f-4f77-b1fd-33483780ee19	deleted	\N	2013-09-02 08:42:29.213114	9999-12-31 00:00:00	t
d616daf1-fd1f-4f77-b1fd-33483780ee19	3d1fc5f0-ce19-4b68-a7cd-191ded177f5e	Refresh Frequency	Yearly	07976e53-be3a-4f20-9f6e-bc712eb63c4d	d616daf1-fd1f-4f77-b1fd-33483780ee19	active	97132c29-5c13-489b-909d-39df23717a04	2013-09-02 08:08:36.668853	2013-09-02 08:42:29.213114	f
9cb9b558-3516-42b3-9b96-1f6026fbc5ab	4e191c1e-b971-441f-83f7-45e266c41b99	Data Location	Linked	0acd6637-7ab9-4dbb-8792-eec19d80c236	9cb9b558-3516-42b3-9b96-1f6026fbc5ab	active	\N	2013-09-03 00:59:25.473654	9999-12-31 00:00:00	t
a98c3802-9eb7-4bbd-87e3-6a5ff5acd9de	38361477-6054-4bb4-abde-39f2b3982254	Temporal Coverage	Current	31c70799-2062-4142-9f32-ff5c14d2f26c	a98c3802-9eb7-4bbd-87e3-6a5ff5acd9de	active	\N	2014-06-04 02:24:07.314832	9999-12-31 00:00:00	t
108e446e-b388-40ef-9785-0d366515dd46	a6b78241-de36-4180-878b-d5d0db01d69a	Data Updated	Automatically	158da427-76e0-4854-93f6-a3c5c0a1253a	108e446e-b388-40ef-9785-0d366515dd46	active	\N	2013-09-02 08:52:06.056926	9999-12-31 00:00:00	t
3da88be0-96c3-4a9c-87c8-83afdd296a27	0f2403fd-a8f9-4d4c-9fb3-8a613c7b4022	Update Frequency	Annually	c5f399ea-dcf1-4139-ae56-03b4af156bfa	3da88be0-96c3-4a9c-87c8-83afdd296a27	active	\N	2014-05-28 01:23:36.080119	9999-12-31 00:00:00	t
93c0e33e-5d45-4197-8e59-23d7ee5479fb	6bfd0d67-6abc-43d7-bf87-dea7a0710208	Data Updated	06/05/2013	5e786ae5-4371-4e6a-b854-6a756b02abfd	93c0e33e-5d45-4197-8e59-23d7ee5479fb	active	\N	2013-09-03 01:02:03.08983	9999-12-31 00:00:00	t
0c135643-8e12-4907-be71-1625799709e7	6bfd0d67-6abc-43d7-bf87-dea7a0710208	Data Location	Linked	5e786ae5-4371-4e6a-b854-6a756b02abfd	0c135643-8e12-4907-be71-1625799709e7	active	\N	2013-09-03 01:02:03.08983	9999-12-31 00:00:00	t
d06de8c4-9263-409c-a52d-851a3014a597	30e275dd-a6f3-4af5-8b8a-6f4919ff6fe7	Data Location	Linked	95c16b18-38db-4810-a2a9-2318151d105d	d06de8c4-9263-409c-a52d-851a3014a597	active	\N	2013-09-02 08:53:53.14063	9999-12-31 00:00:00	t
b0c85845-0de7-4b15-b738-21dd9709a608	30e275dd-a6f3-4af5-8b8a-6f4919ff6fe7	Update Frequency	Ad Hoc	95c16b18-38db-4810-a2a9-2318151d105d	b0c85845-0de7-4b15-b738-21dd9709a608	active	257d96a2-3ee4-41d6-a150-fc266ab5a000	2013-09-02 08:53:53.14063	2013-09-03 01:12:22.224882	f
d136e74e-e073-4d06-88b6-387fdd858066	5fb4e6d7-1afe-4f91-a575-f65b451b3c2b	Data Location	Linked	44730bfe-82cc-41ca-8c4f-3ab6dbb00c22	d136e74e-e073-4d06-88b6-387fdd858066	active	\N	2013-09-02 08:55:49.636225	9999-12-31 00:00:00	t
b0c85845-0de7-4b15-b738-21dd9709a608	30e275dd-a6f3-4af5-8b8a-6f4919ff6fe7	Update Frequency	Weekly Automated	257d96a2-3ee4-41d6-a150-fc266ab5a000	b0c85845-0de7-4b15-b738-21dd9709a608	active	\N	2013-09-03 01:12:22.224882	9999-12-31 00:00:00	t
68d4be31-1d7c-40a5-b1e3-d6c77e6fd479	30e275dd-a6f3-4af5-8b8a-6f4919ff6fe7	Data updated	Automatically	95c16b18-38db-4810-a2a9-2318151d105d	68d4be31-1d7c-40a5-b1e3-d6c77e6fd479	active	02bd69cd-2f43-47ca-90ba-c8e1a7ae2b86	2013-09-02 08:53:53.14063	2013-09-03 01:24:23.23628	f
68d4be31-1d7c-40a5-b1e3-d6c77e6fd479	30e275dd-a6f3-4af5-8b8a-6f4919ff6fe7	Data updated	Automatically	02bd69cd-2f43-47ca-90ba-c8e1a7ae2b86	68d4be31-1d7c-40a5-b1e3-d6c77e6fd479	deleted	\N	2013-09-03 01:24:23.23628	9999-12-31 00:00:00	t
8633fd38-7158-4159-b9e8-ac25883ce39e	5fa1cafd-4599-4888-9f70-6a19beb75a4d	Data Location	Linked	481c3f42-337c-4b8d-b1ec-2d0c6fe39289	8633fd38-7158-4159-b9e8-ac25883ce39e	active	\N	2013-09-03 00:34:52.276783	9999-12-31 00:00:00	t
7e58dc36-713f-4805-9213-77b4da8c5d0a	4497f76a-7b3d-4194-9a08-5f64ab037350	Data Updated	20/08/2013	36790488-ad97-41a9-96da-65bf058e7638	7e58dc36-713f-4805-9213-77b4da8c5d0a	active	\N	2013-09-03 01:31:39.392228	9999-12-31 00:00:00	t
7235a0e8-d7e6-4ec8-80ba-3122e6060859	5fa1cafd-4599-4888-9f70-6a19beb75a4d	Update Frequency		d1bf1c03-df52-4e37-a5cc-e73d7546fefe	7235a0e8-d7e6-4ec8-80ba-3122e6060859	active	\N	2013-09-03 00:41:46.915928	9999-12-31 00:00:00	t
8b4cde7c-ce72-4443-94aa-697652e77925	4497f76a-7b3d-4194-9a08-5f64ab037350	Data Location	Linked	36790488-ad97-41a9-96da-65bf058e7638	8b4cde7c-ce72-4443-94aa-697652e77925	active	\N	2013-09-03 01:31:39.392228	9999-12-31 00:00:00	t
8a05ac1a-7f16-4ed3-b20d-ee8ba26ae893	5fa1cafd-4599-4888-9f70-6a19beb75a4d	Data updated	9/08/2013	d1bf1c03-df52-4e37-a5cc-e73d7546fefe	8a05ac1a-7f16-4ed3-b20d-ee8ba26ae893	active	\N	2013-09-03 00:41:46.915928	9999-12-31 00:00:00	t
8a05ac1a-7f16-4ed3-b20d-ee8ba26ae893	5fa1cafd-4599-4888-9f70-6a19beb75a4d	Data updated	Current	481c3f42-337c-4b8d-b1ec-2d0c6fe39289	8a05ac1a-7f16-4ed3-b20d-ee8ba26ae893	active	d1bf1c03-df52-4e37-a5cc-e73d7546fefe	2013-09-03 00:34:52.276783	2013-09-03 00:41:46.915928	f
669fce01-f1a2-4c05-9914-a653baec64bd	5fa1cafd-4599-4888-9f70-6a19beb75a4d	Update frequency	Ad Hoc	d1bf1c03-df52-4e37-a5cc-e73d7546fefe	669fce01-f1a2-4c05-9914-a653baec64bd	deleted	\N	2013-09-03 00:41:46.915928	9999-12-31 00:00:00	t
669fce01-f1a2-4c05-9914-a653baec64bd	5fa1cafd-4599-4888-9f70-6a19beb75a4d	Update frequency	Ad Hoc	481c3f42-337c-4b8d-b1ec-2d0c6fe39289	669fce01-f1a2-4c05-9914-a653baec64bd	active	d1bf1c03-df52-4e37-a5cc-e73d7546fefe	2013-09-03 00:34:52.276783	2013-09-03 00:41:46.915928	f
15ac9bd3-96ec-43f2-98d0-9eef7258c644	ace7352f-6c48-4a07-b846-2a7865791d87	Data Updated	22/03/2013	b2a2aeab-4322-4565-92ad-a22d1abdfdb2	15ac9bd3-96ec-43f2-98d0-9eef7258c644	active	\N	2013-09-03 01:34:19.380184	9999-12-31 00:00:00	t
47e27d91-398b-48d4-9448-c25a5ec4d22c	ace7352f-6c48-4a07-b846-2a7865791d87	Data Location	Linked	b2a2aeab-4322-4565-92ad-a22d1abdfdb2	47e27d91-398b-48d4-9448-c25a5ec4d22c	active	\N	2013-09-03 01:34:19.380184	9999-12-31 00:00:00	t
df303a25-b1c9-4d8d-a1c7-1a384218f589	968c8768-802a-48ed-92d9-eb927fe50c46	Data Location	Linked	38f3b103-2678-48e1-9a5d-13af524bd77f	df303a25-b1c9-4d8d-a1c7-1a384218f589	active	\N	2013-09-03 01:43:36.681054	9999-12-31 00:00:00	t
6932c89d-b5e3-4bc9-a4d7-969055f8b262	968c8768-802a-48ed-92d9-eb927fe50c46	Data Updated	20/08/2013	38f3b103-2678-48e1-9a5d-13af524bd77f	6932c89d-b5e3-4bc9-a4d7-969055f8b262	active	\N	2013-09-03 01:43:36.681054	9999-12-31 00:00:00	t
77e360b1-ee6f-4094-9f59-9ba749677587	5fb4e6d7-1afe-4f91-a575-f65b451b3c2b	Data update	Automatically	68b04c6f-85ce-4434-9401-c0e9b22a90e2	77e360b1-ee6f-4094-9f59-9ba749677587	deleted	\N	2013-09-03 01:45:05.370081	9999-12-31 00:00:00	t
8ca4166c-baff-43c6-af87-7e0398c2d73a	a6b78241-de36-4180-878b-d5d0db01d69a	Update Frequency	Ad Hoc	b2e8820c-674b-43ab-a001-eb316f350780	8ca4166c-baff-43c6-af87-7e0398c2d73a	deleted	\N	2013-09-03 01:52:54.173832	9999-12-31 00:00:00	t
8ca4166c-baff-43c6-af87-7e0398c2d73a	a6b78241-de36-4180-878b-d5d0db01d69a	Update Frequency	Ad Hoc	158da427-76e0-4854-93f6-a3c5c0a1253a	8ca4166c-baff-43c6-af87-7e0398c2d73a	active	b2e8820c-674b-43ab-a001-eb316f350780	2013-09-02 08:52:06.056926	2013-09-03 01:52:54.173832	f
5cf42b6a-e027-4a81-90fb-dd7317db1796	4cc17ac3-ce49-4525-971b-6122023b8937	Data Location	Linked	252b15c6-8513-4d9a-9429-bd577a2a5629	5cf42b6a-e027-4a81-90fb-dd7317db1796	active	\N	2013-09-03 01:53:54.052037	9999-12-31 00:00:00	t
2e5ab3b2-f2f0-4848-90df-0d1a867eda3b	77afe596-b5bb-4a7a-a8f3-f56848b975a8	Data updated	20/08/2013	43f260d7-772d-494a-a2e0-81ccca2f40d4	2e5ab3b2-f2f0-4848-90df-0d1a867eda3b	active	\N	2013-09-03 02:05:13.051023	9999-12-31 00:00:00	t
38865e11-1495-4eda-a9a7-a55beaf0e816	4cc17ac3-ce49-4525-971b-6122023b8937	Data updated	15/05/2013	252b15c6-8513-4d9a-9429-bd577a2a5629	38865e11-1495-4eda-a9a7-a55beaf0e816	active	6c2c2476-f5c1-49ee-8774-216a58a0f78c	2013-09-03 01:53:54.052037	2013-12-18 03:00:24.228419	f
77e360b1-ee6f-4094-9f59-9ba749677587	5fb4e6d7-1afe-4f91-a575-f65b451b3c2b	Data update	Automatically	44730bfe-82cc-41ca-8c4f-3ab6dbb00c22	77e360b1-ee6f-4094-9f59-9ba749677587	active	68b04c6f-85ce-4434-9401-c0e9b22a90e2	2013-09-02 08:55:49.636225	2013-09-03 01:45:05.370081	f
4e659f44-4a27-4dd0-983e-f4702d97e96f	5fb4e6d7-1afe-4f91-a575-f65b451b3c2b	Update Frequency	Weekly Automated	68b04c6f-85ce-4434-9401-c0e9b22a90e2	4e659f44-4a27-4dd0-983e-f4702d97e96f	active	\N	2013-09-03 01:45:05.370081	9999-12-31 00:00:00	t
4e659f44-4a27-4dd0-983e-f4702d97e96f	5fb4e6d7-1afe-4f91-a575-f65b451b3c2b	Update Frequency	Ad Hoc	44730bfe-82cc-41ca-8c4f-3ab6dbb00c22	4e659f44-4a27-4dd0-983e-f4702d97e96f	active	68b04c6f-85ce-4434-9401-c0e9b22a90e2	2013-09-02 08:55:49.636225	2013-09-03 01:45:05.370081	f
acb1b04d-d462-407e-9fe3-43a393eeae4f	5fb4e6d7-1afe-4f91-a575-f65b451b3c2b	Data updated	Automatically	68b04c6f-85ce-4434-9401-c0e9b22a90e2	acb1b04d-d462-407e-9fe3-43a393eeae4f	active	\N	2013-09-03 01:45:05.370081	9999-12-31 00:00:00	t
2b8e2e7a-0a37-4837-92a8-71eea7838757	0f2403fd-a8f9-4d4c-9fb3-8a613c7b4022	Geospatial Coverage	Adelaide & North Adelaide	c5f399ea-dcf1-4139-ae56-03b4af156bfa	2b8e2e7a-0a37-4837-92a8-71eea7838757	active	\N	2014-05-28 01:23:36.080119	9999-12-31 00:00:00	t
cbd3892f-ba4c-4d3c-bc5d-67c90f72c41b	0f2403fd-a8f9-4d4c-9fb3-8a613c7b4022	Data Granularity	Shows all the bike and pedestrian paths around the parklands area updated annually.	c5f399ea-dcf1-4139-ae56-03b4af156bfa	cbd3892f-ba4c-4d3c-bc5d-67c90f72c41b	active	\N	2014-05-28 01:23:36.080119	9999-12-31 00:00:00	t
2a6f19e0-c1a9-411e-a0df-d18f37c376b4	6459ec32-a165-4de6-9861-1466f910434d	Data Location	Linked	2c9f07ab-bd6f-4cdd-9a58-39b403fadbc5	2a6f19e0-c1a9-411e-a0df-d18f37c376b4	active	\N	2013-09-03 02:14:59.55945	9999-12-31 00:00:00	t
338e45f8-df0b-498c-af90-ef1454b5fdce	6459ec32-a165-4de6-9861-1466f910434d	Data updated	16/05/2013	2c9f07ab-bd6f-4cdd-9a58-39b403fadbc5	338e45f8-df0b-498c-af90-ef1454b5fdce	active	\N	2013-09-03 02:14:59.55945	9999-12-31 00:00:00	t
470c6d3a-40d6-4165-ac78-38257f10322f	38361477-6054-4bb4-abde-39f2b3982254	Geospatial Coverage	South Australia	31c70799-2062-4142-9f32-ff5c14d2f26c	470c6d3a-40d6-4165-ac78-38257f10322f	active	\N	2014-06-04 02:24:07.314832	9999-12-31 00:00:00	t
055aaf51-01dc-4d84-bfae-d01a9cc5967c	60aca0c6-0c84-4bac-8359-d736ad4a67e7	Temporal Coverage	1977-2009	0b943c0e-388d-4fe4-a2a4-f8d1e516992d	055aaf51-01dc-4d84-bfae-d01a9cc5967c	active	\N	2014-05-30 01:33:32.818	9999-12-31 00:00:00	t
de91bf8d-150f-420a-a4f7-70e1094d0a54	60aca0c6-0c84-4bac-8359-d736ad4a67e7	Update Frequency		0b943c0e-388d-4fe4-a2a4-f8d1e516992d	de91bf8d-150f-420a-a4f7-70e1094d0a54	active	\N	2014-05-30 01:33:32.818	9999-12-31 00:00:00	t
4717b9ce-83eb-4f12-b543-53e6beacd118	60aca0c6-0c84-4bac-8359-d736ad4a67e7	Geospatial Coverage	South Australia	0b943c0e-388d-4fe4-a2a4-f8d1e516992d	4717b9ce-83eb-4f12-b543-53e6beacd118	active	\N	2014-05-30 01:33:32.818	9999-12-31 00:00:00	t
8849d43a-dd8c-4724-8986-d49ed2cd2db1	60aca0c6-0c84-4bac-8359-d736ad4a67e7	Data Granularity	All cancer by gender, age group and year of diagnosis	0b943c0e-388d-4fe4-a2a4-f8d1e516992d	8849d43a-dd8c-4724-8986-d49ed2cd2db1	active	\N	2014-05-30 01:33:32.818	9999-12-31 00:00:00	t
b281195a-9b38-46dd-9cec-d8d374ffd6a7	f93aa37d-dc46-48da-ae65-7d44feb68559	Temporal Coverage	2012	1275ec28-72f3-46c7-a3db-2f517dbebec8	b281195a-9b38-46dd-9cec-d8d374ffd6a7	active	\N	2014-05-30 06:06:15.955127	9999-12-31 00:00:00	t
f63ea495-27d0-4cd1-824b-186f824757f8	e05b4646-3160-47c9-a9b7-817bd31b91fd	Update Frequency	Annually	defdbbd7-c46c-4d89-8463-65f061dc83b9	f63ea495-27d0-4cd1-824b-186f824757f8	active	\N	2014-06-01 06:53:12.316752	9999-12-31 00:00:00	t
a1131ead-1e2e-4c8a-83a5-ff907f15706c	e05b4646-3160-47c9-a9b7-817bd31b91fd	Temporal Coverage	Current	defdbbd7-c46c-4d89-8463-65f061dc83b9	a1131ead-1e2e-4c8a-83a5-ff907f15706c	active	\N	2014-06-01 06:53:12.316752	9999-12-31 00:00:00	t
c3c6b795-7076-4491-a307-e14f0b55402f	e05b4646-3160-47c9-a9b7-817bd31b91fd	Data Granularity	GPS location, bin type and features	defdbbd7-c46c-4d89-8463-65f061dc83b9	c3c6b795-7076-4491-a307-e14f0b55402f	active	\N	2014-06-01 06:53:12.316752	9999-12-31 00:00:00	t
a90155bb-7cac-4743-86de-7d5751700580	e05b4646-3160-47c9-a9b7-817bd31b91fd	Geospatial Coverage	Adelaide & North Adelaide	defdbbd7-c46c-4d89-8463-65f061dc83b9	a90155bb-7cac-4743-86de-7d5751700580	active	\N	2014-06-01 06:53:12.316752	9999-12-31 00:00:00	t
66af3330-52f2-49ab-bd6d-e1c8b9312f9d	38361477-6054-4bb4-abde-39f2b3982254	Update Frequency	Annually	31c70799-2062-4142-9f32-ff5c14d2f26c	66af3330-52f2-49ab-bd6d-e1c8b9312f9d	active	\N	2014-06-04 02:24:07.314832	9999-12-31 00:00:00	t
4196832e-9e31-4358-bada-4d61449d4751	8766ff8d-8883-48fb-9104-948ee31e2c95	Last Updated	2009	d85bc1d0-f5bb-49be-b970-24108547de96	4196832e-9e31-4358-bada-4d61449d4751	active	\N	2014-06-18 06:04:54.918647	9999-12-31 00:00:00	t
8c1e7006-4d89-46ce-a17d-2555477bb9db	54c50844-6653-4704-8dc8-5f5c8f5f14eb	Data Granularity	N/A	c327709b-7717-463c-9727-bbedfb2ff002	8c1e7006-4d89-46ce-a17d-2555477bb9db	active	\N	2014-06-10 13:41:00.390944	9999-12-31 00:00:00	t
0356c307-479c-4c96-806f-b5fda4885359	4c3d4dd6-3221-4678-b14f-bed30c94a47d	Geospatial Coverage	Adelaide & North Adelaide	d083462f-4155-4942-a094-a752ca0c3cb8	0356c307-479c-4c96-806f-b5fda4885359	active	\N	2014-06-01 07:19:17.070035	9999-12-31 00:00:00	t
c224c626-a5f6-4312-91b0-f81cfbe2bf26	4c3d4dd6-3221-4678-b14f-bed30c94a47d	Temporal Coverage	Current	d083462f-4155-4942-a094-a752ca0c3cb8	c224c626-a5f6-4312-91b0-f81cfbe2bf26	active	\N	2014-06-01 07:19:17.070035	9999-12-31 00:00:00	t
c7c63571-c633-4234-af48-eb5daca60357	4c3d4dd6-3221-4678-b14f-bed30c94a47d	Data Granularity	GPS location and the monument type	d083462f-4155-4942-a094-a752ca0c3cb8	c7c63571-c633-4234-af48-eb5daca60357	active	\N	2014-06-01 07:19:17.070035	9999-12-31 00:00:00	t
d1564558-736f-41bc-ad9c-de2f32501dce	4c3d4dd6-3221-4678-b14f-bed30c94a47d	Update Frequency	Annually	d083462f-4155-4942-a094-a752ca0c3cb8	d1564558-736f-41bc-ad9c-de2f32501dce	active	\N	2014-06-01 07:19:17.070035	9999-12-31 00:00:00	t
cb1661de-ec50-487b-9e6a-fe3b473651f3	0cb3b204-41f6-4703-aabf-c8c5adfc08d0	Update Frequency	weekly	0d0ec04f-56cd-4561-bc62-9d3c4d00f5ed	cb1661de-ec50-487b-9e6a-fe3b473651f3	active	\N	2014-06-02 13:02:54.864468	9999-12-31 00:00:00	t
29b68d34-8141-4e3c-881e-5fadcc3bf9aa	0cb3b204-41f6-4703-aabf-c8c5adfc08d0	Temporal Coverage	Current	0d0ec04f-56cd-4561-bc62-9d3c4d00f5ed	29b68d34-8141-4e3c-881e-5fadcc3bf9aa	active	\N	2014-06-02 13:02:54.864468	9999-12-31 00:00:00	t
14a4cedd-6d94-4337-bc19-775f74e1e06e	0cb3b204-41f6-4703-aabf-c8c5adfc08d0	Geospatial Coverage	Adelaide City Council boundary	0d0ec04f-56cd-4561-bc62-9d3c4d00f5ed	14a4cedd-6d94-4337-bc19-775f74e1e06e	active	\N	2014-06-02 13:02:54.864468	9999-12-31 00:00:00	t
a609ca27-11a0-45d3-8a95-239768dfa0e0	0cb3b204-41f6-4703-aabf-c8c5adfc08d0	Data Granularity	All restrictions & controls	0d0ec04f-56cd-4561-bc62-9d3c4d00f5ed	a609ca27-11a0-45d3-8a95-239768dfa0e0	active	\N	2014-06-02 13:02:54.864468	9999-12-31 00:00:00	t
ce1f4705-ff79-4753-9883-0cc32bf6ed42	f798f4cd-ce0a-4623-bb94-2b81c6bdf52a	Temporal Coverage	Current	0101adff-0f13-429f-a876-f5acdf304635	ce1f4705-ff79-4753-9883-0cc32bf6ed42	active	\N	2014-06-02 14:16:26.99502	9999-12-31 00:00:00	t
bb4dd627-292a-4b14-b104-f21ab1359ddd	f798f4cd-ce0a-4623-bb94-2b81c6bdf52a	Geospatial Coverage	Adelaide & North Adelaide	0101adff-0f13-429f-a876-f5acdf304635	bb4dd627-292a-4b14-b104-f21ab1359ddd	active	\N	2014-06-02 14:16:26.99502	9999-12-31 00:00:00	t
780dee7e-d463-4aa7-a659-c0bd19b36ea5	77afe596-b5bb-4a7a-a8f3-f56848b975a8	Data Location	Linked	43f260d7-772d-494a-a2e0-81ccca2f40d4	780dee7e-d463-4aa7-a659-c0bd19b36ea5	active	\N	2013-09-03 02:05:13.051023	9999-12-31 00:00:00	t
03fc163c-eb7f-4b5d-9c42-0446d1f1fff8	54c50844-6653-4704-8dc8-5f5c8f5f14eb	Temporal Coverage	1850-1920	c327709b-7717-463c-9727-bbedfb2ff002	03fc163c-eb7f-4b5d-9c42-0446d1f1fff8	active	\N	2014-06-10 13:41:00.390944	9999-12-31 00:00:00	t
3da99c0b-052f-4d80-bf68-c636644a6ba1	54c50844-6653-4704-8dc8-5f5c8f5f14eb	Geospatial Coverage	South Australia	c327709b-7717-463c-9727-bbedfb2ff002	3da99c0b-052f-4d80-bf68-c636644a6ba1	active	\N	2014-06-10 13:41:00.390944	9999-12-31 00:00:00	t
6cab7d4f-3976-476c-ae3e-da4c513f5f92	5a0381b3-1923-4ad3-b76b-c90e19fa2762	Data Location	Linked	068b11c9-8bc6-4761-8340-9054590256a4	6cab7d4f-3976-476c-ae3e-da4c513f5f92	active	\N	2013-09-03 02:06:56.407339	9999-12-31 00:00:00	t
ffd4552e-4350-46e0-aa8e-93046d617bfa	5a0381b3-1923-4ad3-b76b-c90e19fa2762	Data updated	20/08/2013	068b11c9-8bc6-4761-8340-9054590256a4	ffd4552e-4350-46e0-aa8e-93046d617bfa	active	\N	2013-09-03 02:06:56.407339	9999-12-31 00:00:00	t
fd434419-1183-46ff-86a6-867bba280a01	54c50844-6653-4704-8dc8-5f5c8f5f14eb	Update Frequency	Once off	c327709b-7717-463c-9727-bbedfb2ff002	fd434419-1183-46ff-86a6-867bba280a01	active	\N	2014-06-10 13:41:00.390944	9999-12-31 00:00:00	t
46fb42ea-93c0-41c0-a863-8d76f1740d4a	a6a7cac5-3016-4525-bf49-b0d33492a466	Update Frequency	Annually	ca605878-99c6-4eb3-9c17-07635813bfb7	46fb42ea-93c0-41c0-a863-8d76f1740d4a	active	\N	2014-05-28 01:47:57.354429	9999-12-31 00:00:00	t
0575e567-275c-4351-b0b0-5d5f0350d422	a6a7cac5-3016-4525-bf49-b0d33492a466	Geospatial Coverage	Adelaide and North Adelaide	ca605878-99c6-4eb3-9c17-07635813bfb7	0575e567-275c-4351-b0b0-5d5f0350d422	active	\N	2014-05-28 01:47:57.354429	9999-12-31 00:00:00	t
55308e4a-7444-4669-9525-4b5e07fc43f1	a6a7cac5-3016-4525-bf49-b0d33492a466	Data Granularity	Shows all the bike routes around the Adelaide city Council area along with its length	ca605878-99c6-4eb3-9c17-07635813bfb7	55308e4a-7444-4669-9525-4b5e07fc43f1	active	\N	2014-05-28 01:47:57.354429	9999-12-31 00:00:00	t
92526b68-9687-4943-9597-62351dbdcfaf	6f9688c0-6952-4805-8da8-8e090202c55c	Data Granularity	Employment numbers (part-time & full-time) aggregated down to city survey block level. Land use presented in higher and lower level divisions linking to employment numbers. 	86856cff-f3b5-4ca2-9c9b-3a31ff81bbd2	92526b68-9687-4943-9597-62351dbdcfaf	active	\N	2014-05-28 02:21:29.366452	9999-12-31 00:00:00	t
dd0690a3-86fe-4c2c-b389-96bedb029ada	6f9688c0-6952-4805-8da8-8e090202c55c	Geospatial Coverage	Employment numbers (part-time & full-time) aggregated down to city survey block level. Land use presented in higher and lower level divisions linking to employment numbers. 	86856cff-f3b5-4ca2-9c9b-3a31ff81bbd2	dd0690a3-86fe-4c2c-b389-96bedb029ada	active	7554cfa4-c55f-4d7a-aee9-f842772d46fa	2014-05-28 02:21:29.366452	2014-05-28 02:23:03.842474	f
dd0690a3-86fe-4c2c-b389-96bedb029ada	6f9688c0-6952-4805-8da8-8e090202c55c	Geospatial Coverage	Adelaide and North Adelaide	7554cfa4-c55f-4d7a-aee9-f842772d46fa	dd0690a3-86fe-4c2c-b389-96bedb029ada	active	\N	2014-05-28 02:23:03.842474	9999-12-31 00:00:00	t
734516f9-0dc6-4d6a-8ff1-cfeb2b781fbe	6f9688c0-6952-4805-8da8-8e090202c55c	Update Frequency	Employment numbers (part-time & full-time) aggregated down to city survey block level. Land use presented in higher and lower level divisions linking to employment numbers. 	86856cff-f3b5-4ca2-9c9b-3a31ff81bbd2	734516f9-0dc6-4d6a-8ff1-cfeb2b781fbe	active	7554cfa4-c55f-4d7a-aee9-f842772d46fa	2014-05-28 02:21:29.366452	2014-05-28 02:23:03.842474	f
734516f9-0dc6-4d6a-8ff1-cfeb2b781fbe	6f9688c0-6952-4805-8da8-8e090202c55c	Update Frequency	Every two to three years	7554cfa4-c55f-4d7a-aee9-f842772d46fa	734516f9-0dc6-4d6a-8ff1-cfeb2b781fbe	active	\N	2014-05-28 02:23:03.842474	9999-12-31 00:00:00	t
086f68ab-47be-4f89-9771-67ed1c732874	719c3371-c845-42fd-aa29-24b89f3a150c	Geospatial Coverage	Metropolitan Adelaide	0ff43e80-0830-4406-aac8-4be99ff22ecc	086f68ab-47be-4f89-9771-67ed1c732874	active	\N	2014-05-28 05:15:19.524336	9999-12-31 00:00:00	t
abe8b9fa-563d-44d2-b7f8-3d166f03e2fe	719c3371-c845-42fd-aa29-24b89f3a150c	Update Frequency	Annually	0ff43e80-0830-4406-aac8-4be99ff22ecc	abe8b9fa-563d-44d2-b7f8-3d166f03e2fe	active	\N	2014-05-28 05:15:19.524336	9999-12-31 00:00:00	t
f5234b69-ec1b-4ac5-ab09-daa19bb5e6b0	719c3371-c845-42fd-aa29-24b89f3a150c	Data Granularity	Unit records	0ff43e80-0830-4406-aac8-4be99ff22ecc	f5234b69-ec1b-4ac5-ab09-daa19bb5e6b0	active	\N	2014-05-28 05:15:19.524336	9999-12-31 00:00:00	t
d4cc4f44-9f28-4eeb-b190-c56bb2857af3	719c3371-c845-42fd-aa29-24b89f3a150c	Temporal Coverage	1986-2013	0ff43e80-0830-4406-aac8-4be99ff22ecc	d4cc4f44-9f28-4eeb-b190-c56bb2857af3	active	\N	2014-05-28 05:15:19.524336	9999-12-31 00:00:00	t
190135dd-cb9e-418b-99ee-1f304c515751	e0752905-814d-4cb6-a0cd-538b66079688	Geospatial Coverage	South Australia	b0d28e21-2273-4b95-b01b-fe51f4bc4d75	190135dd-cb9e-418b-99ee-1f304c515751	active	\N	2014-05-28 07:40:51.044823	9999-12-31 00:00:00	t
fde0c610-d45f-4ed8-8f2d-62439d19cfb7	e0752905-814d-4cb6-a0cd-538b66079688	Update Frequency	Annually	b0d28e21-2273-4b95-b01b-fe51f4bc4d75	fde0c610-d45f-4ed8-8f2d-62439d19cfb7	active	\N	2014-05-28 07:40:51.044823	9999-12-31 00:00:00	t
0d670459-5e45-494c-a7ce-964a6beeb091	e0752905-814d-4cb6-a0cd-538b66079688	Data Granularity	Aggregated by Local Health Networks	b0d28e21-2273-4b95-b01b-fe51f4bc4d75	0d670459-5e45-494c-a7ce-964a6beeb091	active	\N	2014-05-28 07:40:51.044823	9999-12-31 00:00:00	t
1a187dff-914f-4b69-8dfc-b1c59d3bc046	1f232b6f-4e90-4ebf-9dcd-ad3d84cf2d8d	Update Frequency	Annually	2a003a1c-4169-41fd-9243-a4c96bb82493	1a187dff-914f-4b69-8dfc-b1c59d3bc046	active	\N	2014-05-29 00:32:48.705017	9999-12-31 00:00:00	t
7ce7d8f9-1c4a-4e1a-bc23-2964e4d96595	1f232b6f-4e90-4ebf-9dcd-ad3d84cf2d8d	Data Granularity	Across the Council	2a003a1c-4169-41fd-9243-a4c96bb82493	7ce7d8f9-1c4a-4e1a-bc23-2964e4d96595	active	\N	2014-05-29 00:32:48.705017	9999-12-31 00:00:00	t
79ce678e-cc6b-4087-985e-e4102baf7676	1f232b6f-4e90-4ebf-9dcd-ad3d84cf2d8d	Geospatial Coverage	Adelaide & North Adelaide	2a003a1c-4169-41fd-9243-a4c96bb82493	79ce678e-cc6b-4087-985e-e4102baf7676	active	\N	2014-05-29 00:32:48.705017	9999-12-31 00:00:00	t
54caf632-b1c5-42f9-9a81-00af8470d670	bc38db4a-2694-4639-a27f-8aa85eea2f3f	Data Granularity		77b45465-3bb0-4d5b-b848-51de8ed90bb1	54caf632-b1c5-42f9-9a81-00af8470d670	active	\N	2014-05-29 00:51:05.90947	9999-12-31 00:00:00	t
eea96de7-0611-4e3d-96db-7637f4c30790	bc38db4a-2694-4639-a27f-8aa85eea2f3f	Temporal Coverage	2011-12	77b45465-3bb0-4d5b-b848-51de8ed90bb1	eea96de7-0611-4e3d-96db-7637f4c30790	active	\N	2014-05-29 00:51:05.90947	9999-12-31 00:00:00	t
876e6d47-cc78-4b48-8ece-531a2ba47a03	bc38db4a-2694-4639-a27f-8aa85eea2f3f	Update Frequency	Annually	77b45465-3bb0-4d5b-b848-51de8ed90bb1	876e6d47-cc78-4b48-8ece-531a2ba47a03	active	\N	2014-05-29 00:51:05.90947	9999-12-31 00:00:00	t
6526c8ba-6478-42e8-a989-0845fc9e9ee8	e0752905-814d-4cb6-a0cd-538b66079688	Temporal Coverage	2007 - 2011	2c709a23-92cc-41f3-8126-e2b853b3295e	6526c8ba-6478-42e8-a989-0845fc9e9ee8	active	870b7af1-354a-4746-bcc2-efa7d635d80a	2014-05-28 07:41:26.722375	2014-06-04 01:51:42.306816	f
3356424d-cf5d-4bb5-b672-e2d3a4fb41ea	e4d3a355-29d7-4bdc-a81d-13fd5ed09ef9	Data Location	Linked	0d6d0890-447a-499a-bcb8-0fdbb8c807db	3356424d-cf5d-4bb5-b672-e2d3a4fb41ea	active	\N	2013-09-03 02:16:52.065057	9999-12-31 00:00:00	t
143b4261-1bae-4883-b071-a5bb4fe27d84	e4d3a355-29d7-4bdc-a81d-13fd5ed09ef9	Data updated	19/08/2013	0d6d0890-447a-499a-bcb8-0fdbb8c807db	143b4261-1bae-4883-b071-a5bb4fe27d84	active	\N	2013-09-03 02:16:52.065057	9999-12-31 00:00:00	t
4eef1e89-e8a2-4b54-91d8-df72212600d1	bc38db4a-2694-4639-a27f-8aa85eea2f3f	Geospatial Coverage	Adelaide & North Adelaide	77b45465-3bb0-4d5b-b848-51de8ed90bb1	4eef1e89-e8a2-4b54-91d8-df72212600d1	active	\N	2014-05-29 00:51:05.90947	9999-12-31 00:00:00	t
0eaed9ff-6877-4775-841a-79d1930867d9	f93aa37d-dc46-48da-ae65-7d44feb68559	Geospatial Coverage	South Australia	1275ec28-72f3-46c7-a3db-2f517dbebec8	0eaed9ff-6877-4775-841a-79d1930867d9	active	\N	2014-05-30 06:06:15.955127	9999-12-31 00:00:00	t
bca9a07d-d3c9-400b-8da7-4287e7bfb683	0ddf2305-c116-4d5d-a197-736122fa67b6	Data Location	Data.sa	f6328176-73a9-41fe-818e-7662166d6e51	bca9a07d-d3c9-400b-8da7-4287e7bfb683	active	\N	2013-09-03 07:00:04.609363	9999-12-31 00:00:00	t
6edb48f3-5232-43f4-a4e4-28382505951c	0ddf2305-c116-4d5d-a197-736122fa67b6	Data updated	03/09/2013	f6328176-73a9-41fe-818e-7662166d6e51	6edb48f3-5232-43f4-a4e4-28382505951c	active	\N	2013-09-03 07:00:04.609363	9999-12-31 00:00:00	t
690d7834-e46f-48a6-a737-f9faba3c9219	f93aa37d-dc46-48da-ae65-7d44feb68559	Update Frequency	2 Yearly	1275ec28-72f3-46c7-a3db-2f517dbebec8	690d7834-e46f-48a6-a737-f9faba3c9219	active	\N	2014-05-30 06:06:15.955127	9999-12-31 00:00:00	t
42ee7853-438f-45a3-b7f7-2922a4e8e295	f93aa37d-dc46-48da-ae65-7d44feb68559	Data Granularity	Statistical Local Area	1275ec28-72f3-46c7-a3db-2f517dbebec8	42ee7853-438f-45a3-b7f7-2922a4e8e295	active	\N	2014-05-30 06:06:15.955127	9999-12-31 00:00:00	t
029d71f5-0529-4a5b-ad1b-2f027eb298ae	9b934ea1-856c-4dcc-b2b3-6f4f04a49476	Data Location	Data.sa	80d2eb92-789f-4ab1-b9e7-85a15a2da407	029d71f5-0529-4a5b-ad1b-2f027eb298ae	active	\N	2013-09-04 00:02:41.649067	9999-12-31 00:00:00	t
fcbcd249-be95-4dc4-ad19-26dfdee5b3a3	9b934ea1-856c-4dcc-b2b3-6f4f04a49476	Data updated	03/09/2013	80d2eb92-789f-4ab1-b9e7-85a15a2da407	fcbcd249-be95-4dc4-ad19-26dfdee5b3a3	active	\N	2013-09-04 00:02:41.649067	9999-12-31 00:00:00	t
0ccede80-b07f-46ed-b5d7-fe93506b5f30	8766ff8d-8883-48fb-9104-948ee31e2c95	Refresh Frequency	Ad Hoc	d8f15ea2-1ee6-4d70-a55e-958bd983b1d9	0ccede80-b07f-46ed-b5d7-fe93506b5f30	active	d85bc1d0-f5bb-49be-b970-24108547de96	2013-08-01 05:16:50.141674	2014-06-18 06:04:54.918647	f
0ccede80-b07f-46ed-b5d7-fe93506b5f30	8766ff8d-8883-48fb-9104-948ee31e2c95	Refresh Frequency	Ad Hoc	d85bc1d0-f5bb-49be-b970-24108547de96	0ccede80-b07f-46ed-b5d7-fe93506b5f30	deleted	\N	2014-06-18 06:04:54.918647	9999-12-31 00:00:00	t
4ae054c4-e268-4ede-8042-3da373e955b1	cf466291-8740-4b54-ae11-8c98c347f201	Data updated	03/09/2013	188c4d62-755d-4e2d-8dce-033fa21ff965	4ae054c4-e268-4ede-8042-3da373e955b1	active	\N	2013-09-04 00:03:24.708766	9999-12-31 00:00:00	t
4b673eca-80cf-4877-aea9-1558a225cfee	cf466291-8740-4b54-ae11-8c98c347f201	Data Location	Data.sa	188c4d62-755d-4e2d-8dce-033fa21ff965	4b673eca-80cf-4877-aea9-1558a225cfee	active	\N	2013-09-04 00:03:24.708766	9999-12-31 00:00:00	t
be2c7434-a710-4b19-a880-311337e4a32c	61d45b48-85bc-4691-968f-3c8d5d23564b	Data Location	Data.sa	a6b3ea52-518b-40ac-bc8d-6acacd5af99e	be2c7434-a710-4b19-a880-311337e4a32c	active	\N	2013-09-04 00:04:11.711463	9999-12-31 00:00:00	t
34421b4e-9e51-4681-a2f7-b04a7d1ff415	61d45b48-85bc-4691-968f-3c8d5d23564b	Data updated	03/09/2013	a6b3ea52-518b-40ac-bc8d-6acacd5af99e	34421b4e-9e51-4681-a2f7-b04a7d1ff415	active	\N	2013-09-04 00:04:11.711463	9999-12-31 00:00:00	t
1a99d2ba-2693-4598-98e7-3a62bc46080a	d002ac71-239c-491a-97c8-6150d10dbdae	Data Location	Linked	c7fd4a7c-5d27-4bbe-bd09-22b9c5f5e86d	1a99d2ba-2693-4598-98e7-3a62bc46080a	active	\N	2013-09-06 01:19:48.630434	9999-12-31 00:00:00	t
38865e11-1495-4eda-a9a7-a55beaf0e816	4cc17ac3-ce49-4525-971b-6122023b8937	Data updated	Automatically	6c2c2476-f5c1-49ee-8774-216a58a0f78c	38865e11-1495-4eda-a9a7-a55beaf0e816	active	\N	2013-12-18 03:00:24.228419	9999-12-31 00:00:00	t
add9a100-b245-498b-ac52-606750be7616	b667a56a-8959-41bc-a7cc-68e5bc858841	Update frequency	5 years	55210322-a2b1-48b6-a0d8-810d02f0ceff	add9a100-b245-498b-ac52-606750be7616	active	\N	2014-02-28 05:43:58.373803	9999-12-31 00:00:00	t
55e97083-802b-4201-95e8-e12c09627bb3	b667a56a-8959-41bc-a7cc-68e5bc858841	Creation Date	2011	55210322-a2b1-48b6-a0d8-810d02f0ceff	55e97083-802b-4201-95e8-e12c09627bb3	active	\N	2014-02-28 05:43:58.373803	9999-12-31 00:00:00	t
fe5a7896-11b7-4686-b8b7-12e9640fd65a	7b3c68d7-ca6f-46c7-bf81-9f7ee498e740	Temporal Coverage	Current	30e34be9-8ff4-4e2b-8f67-29ee6f237d2b	fe5a7896-11b7-4686-b8b7-12e9640fd65a	active	\N	2014-05-26 04:22:51.896972	9999-12-31 00:00:00	t
ba90d0a5-c025-47c8-a299-bd92dbf2dbd1	7b3c68d7-ca6f-46c7-bf81-9f7ee498e740	Update frequency	Automatic	30e34be9-8ff4-4e2b-8f67-29ee6f237d2b	ba90d0a5-c025-47c8-a299-bd92dbf2dbd1	active	\N	2014-05-26 04:22:51.896972	9999-12-31 00:00:00	t
fb4df258-dfea-4abb-a6c5-94025cfd3436	7b3c68d7-ca6f-46c7-bf81-9f7ee498e740	Gepspatial Coverage	Adelaide & North Adelaide	30e34be9-8ff4-4e2b-8f67-29ee6f237d2b	fb4df258-dfea-4abb-a6c5-94025cfd3436	active	\N	2014-05-26 04:22:51.896972	9999-12-31 00:00:00	t
e2af28a0-752c-47dc-a026-8ee06c21312b	68ce82f9-f1dc-4cb2-9080-e5c5f0cf0eb0	Data Granularity	Provides location and time information on traffic restrictions	7261832e-1740-48ca-9fa7-30b7d17aa34c	e2af28a0-752c-47dc-a026-8ee06c21312b	active	\N	2014-05-26 05:32:07.554878	9999-12-31 00:00:00	t
60148fb9-ccad-4279-91c2-7b5383a4a85b	68ce82f9-f1dc-4cb2-9080-e5c5f0cf0eb0	Geospatial Coverage	Adelaide and North Adelaide	7261832e-1740-48ca-9fa7-30b7d17aa34c	60148fb9-ccad-4279-91c2-7b5383a4a85b	active	\N	2014-05-26 05:32:07.554878	9999-12-31 00:00:00	t
a1a09752-b285-4d32-ba92-01dd094ec46c	68ce82f9-f1dc-4cb2-9080-e5c5f0cf0eb0	Update Frequency	When new traffic restrictions are submitted	7261832e-1740-48ca-9fa7-30b7d17aa34c	a1a09752-b285-4d32-ba92-01dd094ec46c	active	\N	2014-05-26 05:32:07.554878	9999-12-31 00:00:00	t
bf1f7c29-f0c9-44ec-ae89-ff64c7fb8793	a43891a8-c765-46cd-84ad-e1c4f6c1c97c	Update Frequency	Annually	f7f717ff-84af-444f-a7be-2ea0ccf88add	bf1f7c29-f0c9-44ec-ae89-ff64c7fb8793	active	\N	2014-05-27 05:50:39.778603	9999-12-31 00:00:00	t
8aa68d3d-ff5e-44ea-85ec-c5b041491900	a43891a8-c765-46cd-84ad-e1c4f6c1c97c	Data Granularity	Provides toilet data illustrating GPS location and toilet facilities	f7f717ff-84af-444f-a7be-2ea0ccf88add	8aa68d3d-ff5e-44ea-85ec-c5b041491900	active	\N	2014-05-27 05:50:39.778603	9999-12-31 00:00:00	t
59fae6cb-ffcb-4756-9e19-300221fe671f	a43891a8-c765-46cd-84ad-e1c4f6c1c97c	Geospatial Coverage	Adelaide and North Adelaide	f7f717ff-84af-444f-a7be-2ea0ccf88add	59fae6cb-ffcb-4756-9e19-300221fe671f	active	\N	2014-05-27 05:50:39.778603	9999-12-31 00:00:00	t
2a410530-4eb4-4f40-b6fe-8afd023c7361	5f716adc-739e-4050-bb49-76abdadd89b9	Temporal Coverage	Current	90383066-e56d-4dbe-83dd-071819d42118	2a410530-4eb4-4f40-b6fe-8afd023c7361	active	\N	2014-05-27 06:54:38.745366	9999-12-31 00:00:00	t
6d20aaf1-b03c-4377-a9ce-584e4042e723	5f716adc-739e-4050-bb49-76abdadd89b9	Data Granularity	Provides BBQ data with its GPS coordinate and type of BBQ e.g. Christie 2 plate bbq, green 2 plate bbq. 	90383066-e56d-4dbe-83dd-071819d42118	6d20aaf1-b03c-4377-a9ce-584e4042e723	active	\N	2014-05-27 06:54:38.745366	9999-12-31 00:00:00	t
b2236812-9db4-43a8-95c4-82f14c99a6d5	5f716adc-739e-4050-bb49-76abdadd89b9	Geospatial Coverage	Adelaide and North Adelaide	90383066-e56d-4dbe-83dd-071819d42118	b2236812-9db4-43a8-95c4-82f14c99a6d5	active	\N	2014-05-27 06:54:38.745366	9999-12-31 00:00:00	t
c196aa18-5bff-4390-8dd3-f1834269e09c	5f716adc-739e-4050-bb49-76abdadd89b9	Update Frequency	Annually	90383066-e56d-4dbe-83dd-071819d42118	c196aa18-5bff-4390-8dd3-f1834269e09c	active	\N	2014-05-27 06:54:38.745366	9999-12-31 00:00:00	t
e6a6e668-1908-4a80-bc93-3cd29ea6ef77	3b437900-7c4c-485b-91df-c3daec69b07b	Geospatial Coverage	The Plant Accelerator Southwest Smarthouse, Hartley Grove, Urrbrae, South Australia. Approximately: 34°58'17.3"S 138°38'22.4"E	6ed5354e-1444-43c4-b78d-3e0548264f51	e6a6e668-1908-4a80-bc93-3cd29ea6ef77	active	\N	2014-06-04 03:41:48.243284	9999-12-31 00:00:00	t
0d256823-49ea-4ffe-84cd-b9a1d268304d	d618faaa-c14c-4014-afde-5929b0a96eef	Geospatial Coverage	Spencer Gulf Region	57c9f810-0ce8-4317-8e68-8147da4783c0	0d256823-49ea-4ffe-84cd-b9a1d268304d	active	\N	2014-06-22 15:39:11.890233	9999-12-31 00:00:00	t
a1747d5f-2c4b-49e2-ba25-ac07e1b954c2	e6e0a010-7074-4776-ad48-b168a1b90b27	Update Frequency	Annually	7f79613f-70c3-4010-ab71-7f47a1a7c801	a1747d5f-2c4b-49e2-ba25-ac07e1b954c2	active	\N	2014-05-27 07:09:02.166968	9999-12-31 00:00:00	t
dc3e6f93-b562-4474-a02e-5e51f88c66a9	e6e0a010-7074-4776-ad48-b168a1b90b27	Geospatial Coverage	Adelaide and North Adelaide	7f79613f-70c3-4010-ab71-7f47a1a7c801	dc3e6f93-b562-4474-a02e-5e51f88c66a9	active	\N	2014-05-27 07:09:02.166968	9999-12-31 00:00:00	t
1a875deb-38ee-47cf-93b9-b739d34e33b3	1a36b15d-7f2a-4ef9-8c71-1f1da954da36	Update Frequency	Annually	770e3d02-73b0-42d2-bf99-d2d2bd7fee21	1a875deb-38ee-47cf-93b9-b739d34e33b3	active	\N	2014-06-03 01:16:48.665157	9999-12-31 00:00:00	t
7cedda67-4efb-4f15-bd27-2f092ca9d432	e6e0a010-7074-4776-ad48-b168a1b90b27	Data Granularity	Provides bollards data illustrating GPS location, its material and type.	7f79613f-70c3-4010-ab71-7f47a1a7c801	7cedda67-4efb-4f15-bd27-2f092ca9d432	active	\N	2014-05-27 07:09:02.166968	9999-12-31 00:00:00	t
b2c7587c-92d6-49e0-879e-809427447007	e6e0a010-7074-4776-ad48-b168a1b90b27	Temporal Coverage	Current	7f79613f-70c3-4010-ab71-7f47a1a7c801	b2c7587c-92d6-49e0-879e-809427447007	active	\N	2014-05-27 07:09:02.166968	9999-12-31 00:00:00	t
cf782beb-7ad6-4e3a-8ac8-896ee963e4e7	35711273-b0b0-49ab-9d42-f92cc27b0912	Update Frequency	daily	3c13bd11-976e-44bc-806c-accabec179e7	cf782beb-7ad6-4e3a-8ac8-896ee963e4e7	active	\N	2014-05-29 01:39:55.831189	9999-12-31 00:00:00	t
3887264a-5303-4d42-8cfa-c62cb30da0e4	35711273-b0b0-49ab-9d42-f92cc27b0912	Data Granularity		3c13bd11-976e-44bc-806c-accabec179e7	3887264a-5303-4d42-8cfa-c62cb30da0e4	active	\N	2014-05-29 01:39:55.831189	9999-12-31 00:00:00	t
36095b33-6d56-4958-8d40-1abfbce2f46e	35711273-b0b0-49ab-9d42-f92cc27b0912	Temporal Coverage		3c13bd11-976e-44bc-806c-accabec179e7	36095b33-6d56-4958-8d40-1abfbce2f46e	active	\N	2014-05-29 01:39:55.831189	9999-12-31 00:00:00	t
d52f5e1c-acc0-4161-9fc1-711b246ce5af	32deed74-3050-4b48-acca-64d575f38ab5	Update Frequency	Annually	00247e8b-34d6-4a2c-a2c5-d5d2f83ca087	d52f5e1c-acc0-4161-9fc1-711b246ce5af	active	\N	2014-05-27 07:36:02.571217	9999-12-31 00:00:00	t
61328a81-25f5-476b-ab5a-319af53969ce	32deed74-3050-4b48-acca-64d575f38ab5	Geospatial Coverage	Adelaide and North Adelaide	00247e8b-34d6-4a2c-a2c5-d5d2f83ca087	61328a81-25f5-476b-ab5a-319af53969ce	active	\N	2014-05-27 07:36:02.571217	9999-12-31 00:00:00	t
d23c0f24-280e-4554-ba19-12ecfcc7a47e	32deed74-3050-4b48-acca-64d575f38ab5	Data Granularity	Provides bike rack data illustrating GPS location and bike rack type. 	00247e8b-34d6-4a2c-a2c5-d5d2f83ca087	d23c0f24-280e-4554-ba19-12ecfcc7a47e	active	\N	2014-05-27 07:36:02.571217	9999-12-31 00:00:00	t
89238dc3-c30e-44f2-ac08-0fe48c82fa75	35711273-b0b0-49ab-9d42-f92cc27b0912	Geospatial Coverage	Adelaide and North Adelaide	3c13bd11-976e-44bc-806c-accabec179e7	89238dc3-c30e-44f2-ac08-0fe48c82fa75	active	\N	2014-05-29 01:39:55.831189	9999-12-31 00:00:00	t
3246103c-306b-4cf5-bc0e-cef10e587161	db944224-9a45-42ce-b657-0aac25f1681f	Geospatial Coverage	South Australia	ece238c2-00d3-46cc-8403-115d30e124a0	3246103c-306b-4cf5-bc0e-cef10e587161	active	\N	2014-05-27 08:01:26.227465	9999-12-31 00:00:00	t
ce5def70-6ab5-4237-b665-edd4fa69d6dc	ec5b0373-63a2-4193-b095-2dd5b66edf3f	Update Frequency	Reviewed annually	c9c935da-6e8c-467c-8453-ecb4008bc26b	ce5def70-6ab5-4237-b665-edd4fa69d6dc	active	\N	2014-05-27 08:09:47.663482	9999-12-31 00:00:00	t
71f788c2-6ebc-4d4c-8083-16e7ca9d0e84	ec5b0373-63a2-4193-b095-2dd5b66edf3f	Geospatial Coverage	South Australia	c9c935da-6e8c-467c-8453-ecb4008bc26b	71f788c2-6ebc-4d4c-8083-16e7ca9d0e84	active	\N	2014-05-27 08:09:47.663482	9999-12-31 00:00:00	t
124bbca7-517f-4421-a7fc-ccb4d032cfb0	f9e4a4f6-6ca6-41b8-805b-f39543590b71	Geospatial Coverage	Adelaide & North Adelaide	3807f120-b017-4883-a349-5cbaab39fdf1	124bbca7-517f-4421-a7fc-ccb4d032cfb0	active	\N	2014-05-29 07:18:26.65435	9999-12-31 00:00:00	t
5bd88549-9e04-4283-a0b3-8a91ade616e2	bdaa49aa-7d03-4508-8990-ab800db9e232	Update Frequency	Reviewed annually	116e49f6-02c3-47ff-b595-dd011d5d4b3a	5bd88549-9e04-4283-a0b3-8a91ade616e2	active	\N	2014-05-27 08:13:10.217048	9999-12-31 00:00:00	t
1f89429b-1004-4524-b03b-16eab2365ab6	bdaa49aa-7d03-4508-8990-ab800db9e232	Geospatial Coverage	South Australia	116e49f6-02c3-47ff-b595-dd011d5d4b3a	1f89429b-1004-4524-b03b-16eab2365ab6	active	\N	2014-05-27 08:13:10.217048	9999-12-31 00:00:00	t
d42a08dc-45ca-4fbe-bf2b-610ea0534b38	f9e4a4f6-6ca6-41b8-805b-f39543590b71	Temporal Coverage	Current	3807f120-b017-4883-a349-5cbaab39fdf1	d42a08dc-45ca-4fbe-bf2b-610ea0534b38	active	\N	2014-05-29 07:18:26.65435	9999-12-31 00:00:00	t
b24b493a-ce64-4b8f-88b4-c10600b8f827	f9e4a4f6-6ca6-41b8-805b-f39543590b71	Update Frequency	Annually	3807f120-b017-4883-a349-5cbaab39fdf1	b24b493a-ce64-4b8f-88b4-c10600b8f827	active	\N	2014-05-29 07:18:26.65435	9999-12-31 00:00:00	t
3a1284d2-181b-4242-8437-b92fb917ca16	147ab4cc-60a1-4c49-a213-5a3805551283	Geospatial Coverage	Adelaide and North Adelaide	1b5e7c69-453c-4261-a8ef-d2aa1adeae4e	3a1284d2-181b-4242-8437-b92fb917ca16	active	\N	2014-05-28 00:59:56.891403	9999-12-31 00:00:00	t
7e810d61-1386-4ff1-af08-1375cfdec4d1	147ab4cc-60a1-4c49-a213-5a3805551283	Data Granularity	Defines maximum height of buildings for specific geographical areas updated annually.	1b5e7c69-453c-4261-a8ef-d2aa1adeae4e	7e810d61-1386-4ff1-af08-1375cfdec4d1	active	\N	2014-05-28 00:59:56.891403	9999-12-31 00:00:00	t
75b5b68f-c7c4-42a0-b2d9-7cc0e2ba89d1	147ab4cc-60a1-4c49-a213-5a3805551283	Update Frequency	Annually	1b5e7c69-453c-4261-a8ef-d2aa1adeae4e	75b5b68f-c7c4-42a0-b2d9-7cc0e2ba89d1	active	\N	2014-05-28 00:59:56.891403	9999-12-31 00:00:00	t
d3378723-8ecb-4cbd-8b88-1f26b73adfba	0b10eea8-149d-4719-9702-c45f12630d0a	Geospatial Coverage	South Australia	ca62d013-c69e-4d91-9675-e8615da462d3	d3378723-8ecb-4cbd-8b88-1f26b73adfba	active	\N	2014-05-30 00:28:47.272629	9999-12-31 00:00:00	t
e8360c73-82cd-4585-b4cd-f1b87baa6cbd	0b10eea8-149d-4719-9702-c45f12630d0a	Temporal Coverage	2008 to Current	ca62d013-c69e-4d91-9675-e8615da462d3	e8360c73-82cd-4585-b4cd-f1b87baa6cbd	active	\N	2014-05-30 00:28:47.272629	9999-12-31 00:00:00	t
c50b59e0-3470-4755-a912-40bf0c989453	0b10eea8-149d-4719-9702-c45f12630d0a	Update Frequency	As Required	ca62d013-c69e-4d91-9675-e8615da462d3	c50b59e0-3470-4755-a912-40bf0c989453	active	\N	2014-05-30 00:28:47.272629	9999-12-31 00:00:00	t
62067cf0-8f48-4f8c-a1be-6700058bf97c	f798f4cd-ce0a-4623-bb94-2b81c6bdf52a	Data Granularity	GPS location, monument type and brief descrition	0101adff-0f13-429f-a876-f5acdf304635	62067cf0-8f48-4f8c-a1be-6700058bf97c	active	\N	2014-06-02 14:16:26.99502	9999-12-31 00:00:00	t
d27dda45-ef39-41ec-acca-ae5098f486e3	f798f4cd-ce0a-4623-bb94-2b81c6bdf52a	Update Frequency	Annually	0101adff-0f13-429f-a876-f5acdf304635	d27dda45-ef39-41ec-acca-ae5098f486e3	active	\N	2014-06-02 14:16:26.99502	9999-12-31 00:00:00	t
fa9da4f3-1524-402b-a513-23defc78be65	3b437900-7c4c-485b-91df-c3daec69b07b	Data Granularity	One snapshot of three images (two side views and top view) taken three times per week per plant. Per plant image analysis results.	6ed5354e-1444-43c4-b78d-3e0548264f51	fa9da4f3-1524-402b-a513-23defc78be65	active	\N	2014-06-04 03:41:48.243284	9999-12-31 00:00:00	t
4b7317a5-72c7-404b-9f06-c04c15d64681	3b437900-7c4c-485b-91df-c3daec69b07b	Temporal Coverage	2011-06-27 to 2011-07-27	6ed5354e-1444-43c4-b78d-3e0548264f51	4b7317a5-72c7-404b-9f06-c04c15d64681	active	1c551d1a-8742-4ead-aaf9-e30c6c93f815	2014-06-04 03:41:48.243284	2014-06-04 06:22:10.960408	f
4b7317a5-72c7-404b-9f06-c04c15d64681	3b437900-7c4c-485b-91df-c3daec69b07b	Temporal Coverage	27-06-2011 to 27-07-2011	1c551d1a-8742-4ead-aaf9-e30c6c93f815	4b7317a5-72c7-404b-9f06-c04c15d64681	active	\N	2014-06-04 06:22:10.960408	9999-12-31 00:00:00	t
edfc2152-1195-4b3d-a4c9-91ad1229075d	d618faaa-c14c-4014-afde-5929b0a96eef	Update Frequency	Annually	57c9f810-0ce8-4317-8e68-8147da4783c0	edfc2152-1195-4b3d-a4c9-91ad1229075d	active	\N	2014-06-22 15:39:11.890233	9999-12-31 00:00:00	t
ae3d7d80-e1c2-40a1-960d-a55a892438a5	1a36b15d-7f2a-4ef9-8c71-1f1da954da36	Temporal Coverage	Current	770e3d02-73b0-42d2-bf99-d2d2bd7fee21	ae3d7d80-e1c2-40a1-960d-a55a892438a5	active	\N	2014-06-03 01:16:48.665157	9999-12-31 00:00:00	t
8e7d775f-8c6a-416f-ad9e-a7b5fd9c02df	1a36b15d-7f2a-4ef9-8c71-1f1da954da36	Geospatial Coverage	Adelaide and North Adelaide	770e3d02-73b0-42d2-bf99-d2d2bd7fee21	8e7d775f-8c6a-416f-ad9e-a7b5fd9c02df	active	\N	2014-06-03 01:16:48.665157	9999-12-31 00:00:00	t
75a7fe12-4b63-4c7b-a4c8-1ffea90bfbaf	1a36b15d-7f2a-4ef9-8c71-1f1da954da36	Data Granularity	Provides street tree data illustrating GPS location, circumference, vigour, height, structure, species and common name.	770e3d02-73b0-42d2-bf99-d2d2bd7fee21	75a7fe12-4b63-4c7b-a4c8-1ffea90bfbaf	active	\N	2014-06-03 01:16:48.665157	9999-12-31 00:00:00	t
c554a3f4-6746-4e0c-ba69-e845fb56aa41	3b437900-7c4c-485b-91df-c3daec69b07b	Currency	2011-07-27	6ed5354e-1444-43c4-b78d-3e0548264f51	c554a3f4-6746-4e0c-ba69-e845fb56aa41	active	1c551d1a-8742-4ead-aaf9-e30c6c93f815	2014-06-04 03:41:48.243284	2014-06-04 06:22:10.960408	f
c554a3f4-6746-4e0c-ba69-e845fb56aa41	3b437900-7c4c-485b-91df-c3daec69b07b	Currency	27-07-2011	1c551d1a-8742-4ead-aaf9-e30c6c93f815	c554a3f4-6746-4e0c-ba69-e845fb56aa41	active	\N	2014-06-04 06:22:10.960408	9999-12-31 00:00:00	t
6b40ef71-88d3-4a5e-b2c9-8c2c25b7bdc1	d618faaa-c14c-4014-afde-5929b0a96eef	Data Granularity	10 minute averaged data	57c9f810-0ce8-4317-8e68-8147da4783c0	6b40ef71-88d3-4a5e-b2c9-8c2c25b7bdc1	active	\N	2014-06-22 15:39:11.890233	9999-12-31 00:00:00	t
d7f093e0-466d-43c7-afee-9428bbb59583	d618faaa-c14c-4014-afde-5929b0a96eef	Temporal Coverage	2013	57c9f810-0ce8-4317-8e68-8147da4783c0	d7f093e0-466d-43c7-afee-9428bbb59583	active	\N	2014-06-22 15:39:11.890233	9999-12-31 00:00:00	t
089e0f9e-d175-493c-b369-d2a49973c9d7	2ed254ca-8cd6-4387-ba90-e019d0db3be3	Temporal Coverage	Current	747475ec-5905-4eb5-9884-30bb3e4125a6	089e0f9e-d175-493c-b369-d2a49973c9d7	active	\N	2014-06-03 01:31:39.454994	9999-12-31 00:00:00	t
919c764b-6250-4787-920e-11eace175f3f	2ed254ca-8cd6-4387-ba90-e019d0db3be3	Geospatial Coverage	Adelaide and North Adelaide	747475ec-5905-4eb5-9884-30bb3e4125a6	919c764b-6250-4787-920e-11eace175f3f	active	\N	2014-06-03 01:31:39.454994	9999-12-31 00:00:00	t
e253e02d-193d-4b6a-8ddd-411390f66b89	2ed254ca-8cd6-4387-ba90-e019d0db3be3	Data Granularity	Illustrates parklands sports facilities with its current park location and a description of the facility e.g. tennis courts, golf courses etc. updated annually.	747475ec-5905-4eb5-9884-30bb3e4125a6	e253e02d-193d-4b6a-8ddd-411390f66b89	active	\N	2014-06-03 01:31:39.454994	9999-12-31 00:00:00	t
00100c48-8df2-4a73-8134-53da5a9de216	2ed254ca-8cd6-4387-ba90-e019d0db3be3	Update Frequency	Annually	747475ec-5905-4eb5-9884-30bb3e4125a6	00100c48-8df2-4a73-8134-53da5a9de216	active	\N	2014-06-03 01:31:39.454994	9999-12-31 00:00:00	t
b953d829-e847-4882-979c-af770435da5a	28baf505-4c5f-4e45-9fae-2605ee1cf7c1	Update Frequency	Once off	c46be6e9-edaa-4ec0-b67a-ef4b86072e88	b953d829-e847-4882-979c-af770435da5a	active	\N	2014-06-10 13:57:18.318088	9999-12-31 00:00:00	t
1a62a71d-963f-46e8-8e54-56f2743aa1eb	1436651b-0684-42f1-b2e3-7dd113e2c007	Data Granularity	Individual specimen records.	bed51a95-ded9-4866-8b70-85a13c8e5e50	1a62a71d-963f-46e8-8e54-56f2743aa1eb	active	\N	2014-06-04 07:07:56.235279	9999-12-31 00:00:00	t
ef7cbd48-f8da-42fa-90ab-5b53255a55ae	1436651b-0684-42f1-b2e3-7dd113e2c007	Update Frequency	Annually	bed51a95-ded9-4866-8b70-85a13c8e5e50	ef7cbd48-f8da-42fa-90ab-5b53255a55ae	active	\N	2014-06-04 07:07:56.235279	9999-12-31 00:00:00	t
0577a4c1-b24c-4884-92c9-834b4889548d	1436651b-0684-42f1-b2e3-7dd113e2c007	Geospatial Coverage	Primarily whole of Australia, some international records.	bed51a95-ded9-4866-8b70-85a13c8e5e50	0577a4c1-b24c-4884-92c9-834b4889548d	active	\N	2014-06-04 07:07:56.235279	9999-12-31 00:00:00	t
787e3331-a039-4bc4-92e4-2fd4c013b5aa	7c92fd11-a2f4-4ca6-b7f2-f23bf123dff9	Update Frequency	Annually	e3a86241-4ea8-43f9-9726-2ada675811cf	787e3331-a039-4bc4-92e4-2fd4c013b5aa	active	\N	2014-06-03 01:32:53.07786	9999-12-31 00:00:00	t
5b61624f-579b-4836-a5b0-991dd41a7618	7c92fd11-a2f4-4ca6-b7f2-f23bf123dff9	Data Granularity	GPS location, max parking hours, rate per hour, operational time and maximum number of bays	e3a86241-4ea8-43f9-9726-2ada675811cf	5b61624f-579b-4836-a5b0-991dd41a7618	active	\N	2014-06-03 01:32:53.07786	9999-12-31 00:00:00	t
89f3620c-1f55-407d-9865-a54de45931c7	7c92fd11-a2f4-4ca6-b7f2-f23bf123dff9	Geospatial Coverage	Adelaide & North Adelaide	e3a86241-4ea8-43f9-9726-2ada675811cf	89f3620c-1f55-407d-9865-a54de45931c7	active	\N	2014-06-03 01:32:53.07786	9999-12-31 00:00:00	t
4ecbdafe-b012-473c-84cf-84ddfc95259a	7c92fd11-a2f4-4ca6-b7f2-f23bf123dff9	Temporal Coverage	Current	e3a86241-4ea8-43f9-9726-2ada675811cf	4ecbdafe-b012-473c-84cf-84ddfc95259a	active	\N	2014-06-03 01:32:53.07786	9999-12-31 00:00:00	t
6526c8ba-6478-42e8-a989-0845fc9e9ee8	e0752905-814d-4cb6-a0cd-538b66079688	Temporal Coverage	2007 - 2012	870b7af1-354a-4746-bcc2-efa7d635d80a	6526c8ba-6478-42e8-a989-0845fc9e9ee8	active	\N	2014-06-04 01:51:42.306816	9999-12-31 00:00:00	t
2e8e80af-6a36-4954-b1cd-9726c00f194f	1436651b-0684-42f1-b2e3-7dd113e2c007	Temporal Coverage	1860-2014	185a195c-ce35-4f0e-a9ed-8d3c678810b0	2e8e80af-6a36-4954-b1cd-9726c00f194f	active	\N	2014-06-04 07:13:51.73106	9999-12-31 00:00:00	t
b95c4a88-6973-4ee2-9d9c-acab9a0b31b2	fe72a51c-def3-4229-b58c-cf9fef5d30ba	Temporal Coverage	1865-2014	594fb77e-ca29-4b21-98aa-73ce77b9362f	b95c4a88-6973-4ee2-9d9c-acab9a0b31b2	active	\N	2014-06-04 07:25:03.630659	9999-12-31 00:00:00	t
783a0e99-c511-43ea-9852-a1a86dd507a5	fe72a51c-def3-4229-b58c-cf9fef5d30ba	Update Frequency	Annually	594fb77e-ca29-4b21-98aa-73ce77b9362f	783a0e99-c511-43ea-9852-a1a86dd507a5	active	\N	2014-06-04 07:25:03.630659	9999-12-31 00:00:00	t
2e4778da-6232-4dff-9cd8-6131669f94d8	fe72a51c-def3-4229-b58c-cf9fef5d30ba	Geospatial Coverage	Primarily whole of Australia, some international records.	594fb77e-ca29-4b21-98aa-73ce77b9362f	2e4778da-6232-4dff-9cd8-6131669f94d8	active	\N	2014-06-04 07:25:03.630659	9999-12-31 00:00:00	t
c47940dd-f1c0-4db1-9b5a-898971e3b68c	fe72a51c-def3-4229-b58c-cf9fef5d30ba	Data Granularity	Individual specimen records.	594fb77e-ca29-4b21-98aa-73ce77b9362f	c47940dd-f1c0-4db1-9b5a-898971e3b68c	active	\N	2014-06-04 07:25:03.630659	9999-12-31 00:00:00	t
a75a166d-e8f3-40e1-bdde-57de2412088a	28baf505-4c5f-4e45-9fae-2605ee1cf7c1	Data Granularity	N/A	c46be6e9-edaa-4ec0-b67a-ef4b86072e88	a75a166d-e8f3-40e1-bdde-57de2412088a	active	\N	2014-06-10 13:57:18.318088	9999-12-31 00:00:00	t
91b29ef5-ea3a-414a-9f95-b1f7f174e26d	28baf505-4c5f-4e45-9fae-2605ee1cf7c1	Geospatial Coverage	South Australia	c46be6e9-edaa-4ec0-b67a-ef4b86072e88	91b29ef5-ea3a-414a-9f95-b1f7f174e26d	active	\N	2014-06-10 13:57:18.318088	9999-12-31 00:00:00	t
acab472d-65c3-4c60-8f9a-bf37a1c89244	28baf505-4c5f-4e45-9fae-2605ee1cf7c1	Temporal Coverage	1865-1902	c46be6e9-edaa-4ec0-b67a-ef4b86072e88	acab472d-65c3-4c60-8f9a-bf37a1c89244	active	\N	2014-06-10 13:57:18.318088	9999-12-31 00:00:00	t
9b0dc624-4387-42df-9c9c-c5eec60b9558	7cd90f98-1d89-4921-8373-151f4ad5d1a1	Data Granularity	N/A	4b13433c-9629-4927-9e3f-4a7d55c0bbc7	9b0dc624-4387-42df-9c9c-c5eec60b9558	active	\N	2014-06-19 03:41:54.723844	9999-12-31 00:00:00	t
afe7970c-0765-4a44-9db5-f16d282b1c6e	f47e5aea-fbcc-49b8-b1b3-b48dca31ec79	Update Frequency	Annually	c6ce89bb-d820-4a6f-b4db-4d2bdb68155b	afe7970c-0765-4a44-9db5-f16d282b1c6e	active	\N	2014-06-04 07:35:54.425364	9999-12-31 00:00:00	t
fa2645b0-14f4-4727-af24-01b6f9b4f789	f47e5aea-fbcc-49b8-b1b3-b48dca31ec79	Temporal Coverage	1860-2014	c6ce89bb-d820-4a6f-b4db-4d2bdb68155b	fa2645b0-14f4-4727-af24-01b6f9b4f789	active	\N	2014-06-04 07:35:54.425364	9999-12-31 00:00:00	t
7533519d-8df1-4f80-aa66-46bca6c3a913	f47e5aea-fbcc-49b8-b1b3-b48dca31ec79	Geospatial Coverage	Primarily whole of Australia, some international records.	c6ce89bb-d820-4a6f-b4db-4d2bdb68155b	7533519d-8df1-4f80-aa66-46bca6c3a913	active	\N	2014-06-04 07:35:54.425364	9999-12-31 00:00:00	t
6a13c64e-b7c7-45e3-b9a9-ba033551c932	f47e5aea-fbcc-49b8-b1b3-b48dca31ec79	Data Granularity	Individual specimen records	c6ce89bb-d820-4a6f-b4db-4d2bdb68155b	6a13c64e-b7c7-45e3-b9a9-ba033551c932	active	\N	2014-06-04 07:35:54.425364	9999-12-31 00:00:00	t
7ea00f6f-d3a2-4179-a4e6-21a34a962d7b	08119936-12ac-40d9-85ec-75fafcd60156	Temporal Coverage	1926-1975	97fe8786-bbbc-4761-bcc0-669fdab69f38	7ea00f6f-d3a2-4179-a4e6-21a34a962d7b	active	\N	2014-06-11 07:34:22.266932	9999-12-31 00:00:00	t
7c385604-746b-4a31-897c-98125f2c8675	7cd90f98-1d89-4921-8373-151f4ad5d1a1	Temporal Coverage	1836-2010	4b13433c-9629-4927-9e3f-4a7d55c0bbc7	7c385604-746b-4a31-897c-98125f2c8675	active	\N	2014-06-19 03:41:54.723844	9999-12-31 00:00:00	t
c950563a-bf22-4609-90ac-51a2718fe188	08119936-12ac-40d9-85ec-75fafcd60156	Update Frequency	Once off	97fe8786-bbbc-4761-bcc0-669fdab69f38	c950563a-bf22-4609-90ac-51a2718fe188	active	\N	2014-06-11 07:34:22.266932	9999-12-31 00:00:00	t
c950563a-bf22-4609-90ac-51a2718fe188	08119936-12ac-40d9-85ec-75fafcd60156	Update Frequency	Ad-Hoc	273529b0-0766-4647-ab98-b887263e1cb9	c950563a-bf22-4609-90ac-51a2718fe188	active	97fe8786-bbbc-4761-bcc0-669fdab69f38	2013-11-19 01:02:23.951802	2014-06-11 07:34:22.266932	f
0271d672-bbb5-41a6-bdcc-8508b46d2751	08119936-12ac-40d9-85ec-75fafcd60156	Data Granularity	N/A	97fe8786-bbbc-4761-bcc0-669fdab69f38	0271d672-bbb5-41a6-bdcc-8508b46d2751	active	\N	2014-06-11 07:34:22.266932	9999-12-31 00:00:00	t
028a3a2a-24fc-4dc2-954d-0112df65658c	7cd90f98-1d89-4921-8373-151f4ad5d1a1	Geospatial Coverage	South Australia	4b13433c-9629-4927-9e3f-4a7d55c0bbc7	028a3a2a-24fc-4dc2-954d-0112df65658c	active	\N	2014-06-19 03:41:54.723844	9999-12-31 00:00:00	t
20b21f92-32ef-4277-b4a6-50969bb527ed	08119936-12ac-40d9-85ec-75fafcd60156	Last Update	19/11/2013	97fe8786-bbbc-4761-bcc0-669fdab69f38	20b21f92-32ef-4277-b4a6-50969bb527ed	deleted	\N	2014-06-11 07:34:22.266932	9999-12-31 00:00:00	t
20b21f92-32ef-4277-b4a6-50969bb527ed	08119936-12ac-40d9-85ec-75fafcd60156	Last Update	19/11/2013	273529b0-0766-4647-ab98-b887263e1cb9	20b21f92-32ef-4277-b4a6-50969bb527ed	active	97fe8786-bbbc-4761-bcc0-669fdab69f38	2013-11-19 01:02:23.951802	2014-06-11 07:34:22.266932	f
615789c0-f013-4e6f-8c74-915cfac837e6	7cd90f98-1d89-4921-8373-151f4ad5d1a1	Update Frequency	Once off	4b13433c-9629-4927-9e3f-4a7d55c0bbc7	615789c0-f013-4e6f-8c74-915cfac837e6	active	\N	2014-06-19 03:41:54.723844	9999-12-31 00:00:00	t
c0700840-63ab-4030-bdbc-d01d19afa875	08119936-12ac-40d9-85ec-75fafcd60156	Data Location	Linked	97fe8786-bbbc-4761-bcc0-669fdab69f38	c0700840-63ab-4030-bdbc-d01d19afa875	deleted	\N	2014-06-11 07:34:22.266932	9999-12-31 00:00:00	t
c0700840-63ab-4030-bdbc-d01d19afa875	08119936-12ac-40d9-85ec-75fafcd60156	Data Location	Linked	273529b0-0766-4647-ab98-b887263e1cb9	c0700840-63ab-4030-bdbc-d01d19afa875	active	97fe8786-bbbc-4761-bcc0-669fdab69f38	2013-11-19 01:02:23.951802	2014-06-11 07:34:22.266932	f
66b4194b-a283-4f40-af83-5028a54a04e7	08119936-12ac-40d9-85ec-75fafcd60156	Geospatial Coverage	Australia, England	97fe8786-bbbc-4761-bcc0-669fdab69f38	66b4194b-a283-4f40-af83-5028a54a04e7	active	\N	2014-06-11 07:34:22.266932	9999-12-31 00:00:00	t
b82fcdc0-e021-4aa4-8f6f-28ff446c550b	dad92d3b-c6cd-4f88-b2ac-2f6aa3ea46e3	Temporal Coverage	as at 6th June 2014	09725c68-5b25-4632-a891-fee31f33acd1	b82fcdc0-e021-4aa4-8f6f-28ff446c550b	active	\N	2014-06-11 08:30:22.283623	9999-12-31 00:00:00	t
a8ae9f8b-15a0-4806-a68d-300355ef1c59	dad92d3b-c6cd-4f88-b2ac-2f6aa3ea46e3	Geospatial Coverage		09725c68-5b25-4632-a891-fee31f33acd1	a8ae9f8b-15a0-4806-a68d-300355ef1c59	active	\N	2014-06-11 08:30:22.283623	9999-12-31 00:00:00	t
d6423d51-f782-4663-8bc0-75c36866cf2e	dad92d3b-c6cd-4f88-b2ac-2f6aa3ea46e3	Update Frequency	Annually	09725c68-5b25-4632-a891-fee31f33acd1	d6423d51-f782-4663-8bc0-75c36866cf2e	active	\N	2014-06-11 08:30:22.283623	9999-12-31 00:00:00	t
d7af719e-d15a-4e9a-a69e-f141c2afe005	dad92d3b-c6cd-4f88-b2ac-2f6aa3ea46e3	Data Granularity		09725c68-5b25-4632-a891-fee31f33acd1	d7af719e-d15a-4e9a-a69e-f141c2afe005	active	\N	2014-06-11 08:30:22.283623	9999-12-31 00:00:00	t
468fc6ff-e40d-4962-88ba-cfd6de817599	f4bb2023-b68f-4868-b0c9-b23a6d69045a	Update Frequency	Ad-hoc	03720d08-3dd3-4b06-8a3f-b5b4e1251c06	468fc6ff-e40d-4962-88ba-cfd6de817599	active	\N	2014-06-12 03:34:30.030609	9999-12-31 00:00:00	t
be4e4a8e-6b1d-4faf-92e2-1ee448d7f4a9	f4bb2023-b68f-4868-b0c9-b23a6d69045a	Geospatial Coverage	Australia	03720d08-3dd3-4b06-8a3f-b5b4e1251c06	be4e4a8e-6b1d-4faf-92e2-1ee448d7f4a9	active	\N	2014-06-12 03:34:30.030609	9999-12-31 00:00:00	t
0d16e4ab-c4d8-4a6c-be5a-c6b70e6773fb	f4bb2023-b68f-4868-b0c9-b23a6d69045a	Temporal Coverage	2000 and 2010	03720d08-3dd3-4b06-8a3f-b5b4e1251c06	0d16e4ab-c4d8-4a6c-be5a-c6b70e6773fb	active	\N	2014-06-12 03:34:30.030609	9999-12-31 00:00:00	t
f7b8412c-64b4-4b6f-b2b7-84707ee7e8ea	f4bb2023-b68f-4868-b0c9-b23a6d69045a	Data Granularity	Regional	03720d08-3dd3-4b06-8a3f-b5b4e1251c06	f7b8412c-64b4-4b6f-b2b7-84707ee7e8ea	active	\N	2014-06-12 03:34:30.030609	9999-12-31 00:00:00	t
f59dc2e0-316c-4514-a4a4-70afd0241ef4	53e0a256-d7e9-4500-af06-38b84d66abde	Update Frequency	Ad-hoc	524b276f-369c-48c7-8ad6-83ca5069725c	f59dc2e0-316c-4514-a4a4-70afd0241ef4	active	\N	2014-06-12 04:10:28.232564	9999-12-31 00:00:00	t
a9adf3b3-f810-4a66-a032-c69dfa29cebf	53e0a256-d7e9-4500-af06-38b84d66abde	Temporal Coverage	1999-2008	524b276f-369c-48c7-8ad6-83ca5069725c	a9adf3b3-f810-4a66-a032-c69dfa29cebf	active	\N	2014-06-12 04:10:28.232564	9999-12-31 00:00:00	t
16abb740-fa67-4008-b946-850ae7f123d8	a81870be-82eb-4868-81e9-0a8d11622675	Update Frequency	Quarterly	6f2a8751-fdde-4987-b5a1-c389922df5fe	16abb740-fa67-4008-b946-850ae7f123d8	active	\N	2014-06-04 08:16:00.848574	9999-12-31 00:00:00	t
16dcec4e-1eaa-47a3-bdef-06e9da81fcff	a81870be-82eb-4868-81e9-0a8d11622675	Data Granularity	Individual specimen records	6f2a8751-fdde-4987-b5a1-c389922df5fe	16dcec4e-1eaa-47a3-bdef-06e9da81fcff	active	\N	2014-06-04 08:16:00.848574	9999-12-31 00:00:00	t
e33a4180-2ea5-4178-a3ca-9cdf1a2caf2f	a81870be-82eb-4868-81e9-0a8d11622675	Temporal Coverage	1860-2014	6f2a8751-fdde-4987-b5a1-c389922df5fe	e33a4180-2ea5-4178-a3ca-9cdf1a2caf2f	active	\N	2014-06-04 08:16:00.848574	9999-12-31 00:00:00	t
b5dba950-de0b-459a-a02a-0dfb248b8acb	a81870be-82eb-4868-81e9-0a8d11622675	Geospatial Coverage	Primarily whole of Australia, some international records.	6f2a8751-fdde-4987-b5a1-c389922df5fe	b5dba950-de0b-459a-a02a-0dfb248b8acb	active	\N	2014-06-04 08:16:00.848574	9999-12-31 00:00:00	t
c6482c07-9b0d-4848-ab55-f1f8f9512d31	d618faaa-c14c-4014-afde-5929b0a96eef	Data Location	Hosted	57c9f810-0ce8-4317-8e68-8147da4783c0	c6482c07-9b0d-4848-ab55-f1f8f9512d31	active	\N	2014-06-22 15:39:11.890233	9999-12-31 00:00:00	t
62347b7d-ebab-419f-bb80-bb1daa77efae	7358f6f6-befd-43e4-8ef5-7a6882044312	Update Frequency	Annually	2bc768b2-8977-4803-bb68-3ad702384e5f	62347b7d-ebab-419f-bb80-bb1daa77efae	active	\N	2014-07-01 23:56:40.171832	9999-12-31 00:00:00	t
ab9912f7-1339-40bb-8d97-a275d33b910a	3622df16-089c-4fdb-9e97-f64637c7669d	Data Granularity	Annually	bfa4b77f-6d36-4848-aea7-a5bbf14546ac	ab9912f7-1339-40bb-8d97-a275d33b910a	active	\N	2014-06-26 05:59:35.273069	9999-12-31 00:00:00	t
4554eb97-b1f6-407a-8051-d828fd9d5a26	3622df16-089c-4fdb-9e97-f64637c7669d	Data Status	 Active	bfa4b77f-6d36-4848-aea7-a5bbf14546ac	4554eb97-b1f6-407a-8051-d828fd9d5a26	active	\N	2014-06-26 05:59:35.273069	9999-12-31 00:00:00	t
aa53a9bd-adc5-44cf-9ff7-b66f242a1b64	a4fbf1a3-bb6f-4b59-860a-3283200e7a90	Data Granularity	Individual specimen records	f2e0376e-3c3a-4de7-a0f5-0e33cbd53965	aa53a9bd-adc5-44cf-9ff7-b66f242a1b64	active	\N	2014-06-04 08:28:09.394513	9999-12-31 00:00:00	t
d6492f86-5267-427a-a85f-b0962e26f9d3	a4fbf1a3-bb6f-4b59-860a-3283200e7a90	Update Frequency	Quarterly	f2e0376e-3c3a-4de7-a0f5-0e33cbd53965	d6492f86-5267-427a-a85f-b0962e26f9d3	active	\N	2014-06-04 08:28:09.394513	9999-12-31 00:00:00	t
e4d9dac0-2be2-4422-91d8-e4088cb2376a	a4fbf1a3-bb6f-4b59-860a-3283200e7a90	Temporal Coverage	1860-2014	f2e0376e-3c3a-4de7-a0f5-0e33cbd53965	e4d9dac0-2be2-4422-91d8-e4088cb2376a	active	\N	2014-06-04 08:28:09.394513	9999-12-31 00:00:00	t
6f9c8ce2-f463-4075-9e08-e99a72e1de24	a4fbf1a3-bb6f-4b59-860a-3283200e7a90	Geospatial Coverage	Primarily whole of Australia, some international records	f2e0376e-3c3a-4de7-a0f5-0e33cbd53965	6f9c8ce2-f463-4075-9e08-e99a72e1de24	active	\N	2014-06-04 08:28:09.394513	9999-12-31 00:00:00	t
04b5148b-6341-481f-898e-81d83a38b4a0	a09d615c-79f1-4918-9cb4-8c4c636c80eb	Temporal Coverage	1880-2014	c05ee173-66b2-470d-afed-5ce788e4cf26	04b5148b-6341-481f-898e-81d83a38b4a0	active	\N	2014-06-04 08:34:38.29727	9999-12-31 00:00:00	t
5f3b8ca1-b79f-4bbc-b19d-8cf88e73f464	a09d615c-79f1-4918-9cb4-8c4c636c80eb	Geospatial Coverage	Primarily whole of Australia, some international records	c05ee173-66b2-470d-afed-5ce788e4cf26	5f3b8ca1-b79f-4bbc-b19d-8cf88e73f464	active	\N	2014-06-04 08:34:38.29727	9999-12-31 00:00:00	t
652c26c1-695c-4b5f-b983-e299accdf7a8	a09d615c-79f1-4918-9cb4-8c4c636c80eb	Data Granularity	Individual specimen records	c05ee173-66b2-470d-afed-5ce788e4cf26	652c26c1-695c-4b5f-b983-e299accdf7a8	active	\N	2014-06-04 08:34:38.29727	9999-12-31 00:00:00	t
129ad653-c458-4c39-ad1b-d0999b2e2e86	a09d615c-79f1-4918-9cb4-8c4c636c80eb	Update Frequency	Quarterly	c05ee173-66b2-470d-afed-5ce788e4cf26	129ad653-c458-4c39-ad1b-d0999b2e2e86	active	\N	2014-06-04 08:34:38.29727	9999-12-31 00:00:00	t
66cbfd27-ca8d-480d-bb56-66f79e840434	35f2b0e5-a207-4114-b2c5-b2f12aa8b8ad	Data Granularity	Individual specimen records	405396cc-96ea-4f80-b595-9fe11cd7893e	66cbfd27-ca8d-480d-bb56-66f79e840434	active	\N	2014-06-04 08:38:28.625017	9999-12-31 00:00:00	t
337b955b-5939-4d45-a569-f3b016a22642	35f2b0e5-a207-4114-b2c5-b2f12aa8b8ad	Geospatial Coverage	Primarily whole of Australia, some international records 	405396cc-96ea-4f80-b595-9fe11cd7893e	337b955b-5939-4d45-a569-f3b016a22642	active	\N	2014-06-04 08:38:28.625017	9999-12-31 00:00:00	t
c9c488a8-8f6a-4f04-9024-a6675b4e0a96	35f2b0e5-a207-4114-b2c5-b2f12aa8b8ad	Update Frequency	Quarterly	405396cc-96ea-4f80-b595-9fe11cd7893e	c9c488a8-8f6a-4f04-9024-a6675b4e0a96	active	\N	2014-06-04 08:38:28.625017	9999-12-31 00:00:00	t
428508fc-a002-4964-974d-5df280dbb2f6	35f2b0e5-a207-4114-b2c5-b2f12aa8b8ad	Temporal Coverage	1880-2014	405396cc-96ea-4f80-b595-9fe11cd7893e	428508fc-a002-4964-974d-5df280dbb2f6	active	\N	2014-06-04 08:38:28.625017	9999-12-31 00:00:00	t
96a1c50c-55b1-4f12-a3d4-4d506e690ec4	e0cc2850-5096-44ec-9602-7b5abfaa2094	Temporal Coverage	1880-2014	494fda43-f38a-426f-957a-48b587f13b9d	96a1c50c-55b1-4f12-a3d4-4d506e690ec4	active	\N	2014-06-04 08:43:16.481125	9999-12-31 00:00:00	t
f3e0596c-966e-4116-b52f-2a8fc8e52342	e0cc2850-5096-44ec-9602-7b5abfaa2094	Data Granularity	Individual specimen records	494fda43-f38a-426f-957a-48b587f13b9d	f3e0596c-966e-4116-b52f-2a8fc8e52342	active	\N	2014-06-04 08:43:16.481125	9999-12-31 00:00:00	t
0aec2620-7331-4958-b6cb-79b9b6dc446d	e0cc2850-5096-44ec-9602-7b5abfaa2094	Update Frequency	Quarterly	494fda43-f38a-426f-957a-48b587f13b9d	0aec2620-7331-4958-b6cb-79b9b6dc446d	active	\N	2014-06-04 08:43:16.481125	9999-12-31 00:00:00	t
c750e7ab-7f9c-49d0-8359-b7ad37c07322	e0cc2850-5096-44ec-9602-7b5abfaa2094	Geospatial Coverage	Primarily whole of Australia, some international records (4.4%)	494fda43-f38a-426f-957a-48b587f13b9d	c750e7ab-7f9c-49d0-8359-b7ad37c07322	active	\N	2014-06-04 08:43:16.481125	9999-12-31 00:00:00	t
9874cc09-cc0e-4018-b59c-d4108aefe030	6553ff25-8b5c-462b-906c-cbfdda54b68b	Temporal Coverage	Current	34cc0682-f701-42fd-b1d5-60b22902c30f	9874cc09-cc0e-4018-b59c-d4108aefe030	active	\N	2014-06-05 01:50:06.861426	9999-12-31 00:00:00	t
94dafa30-4e44-45c4-be61-43644b4599c0	6553ff25-8b5c-462b-906c-cbfdda54b68b	Update Frequency	Annually	34cc0682-f701-42fd-b1d5-60b22902c30f	94dafa30-4e44-45c4-be61-43644b4599c0	active	\N	2014-06-05 01:50:06.861426	9999-12-31 00:00:00	t
30e5393f-0ae7-48c0-b656-e6afb721e03b	6553ff25-8b5c-462b-906c-cbfdda54b68b	Geospatial Coverage	Adelaide & North Adelaide	34cc0682-f701-42fd-b1d5-60b22902c30f	30e5393f-0ae7-48c0-b656-e6afb721e03b	active	\N	2014-06-05 01:50:06.861426	9999-12-31 00:00:00	t
21046b10-1c00-417c-92d9-583e534131f3	6553ff25-8b5c-462b-906c-cbfdda54b68b	Data Granularity	GPS location and the table type	34cc0682-f701-42fd-b1d5-60b22902c30f	21046b10-1c00-417c-92d9-583e534131f3	active	\N	2014-06-05 01:50:06.861426	9999-12-31 00:00:00	t
50f01b21-5872-468e-a341-10996c0ea929	50c46577-62c0-4479-aa21-df3fcc3c0aae	Temporal Coverage	Current	8faed5f0-b28b-4ae6-ba05-c76082bf0128	50f01b21-5872-468e-a341-10996c0ea929	active	\N	2014-06-05 01:54:52.829107	9999-12-31 00:00:00	t
ebcef293-581f-42fd-a179-06e6a5e4ad89	50c46577-62c0-4479-aa21-df3fcc3c0aae	Update Frequency	Annually	8faed5f0-b28b-4ae6-ba05-c76082bf0128	ebcef293-581f-42fd-a179-06e6a5e4ad89	active	\N	2014-06-05 01:54:52.829107	9999-12-31 00:00:00	t
c929644f-4b6d-4ee6-95c5-2099823b3845	50c46577-62c0-4479-aa21-df3fcc3c0aae	Data Granularity	Shows annual planning and policy zone areas 	8faed5f0-b28b-4ae6-ba05-c76082bf0128	c929644f-4b6d-4ee6-95c5-2099823b3845	active	\N	2014-06-05 01:54:52.829107	9999-12-31 00:00:00	t
d480f918-d5d5-4c5c-aaf9-43d58c8e2d97	50c46577-62c0-4479-aa21-df3fcc3c0aae	Geospatial Coverage	Adelaide & North Adelaide	8faed5f0-b28b-4ae6-ba05-c76082bf0128	d480f918-d5d5-4c5c-aaf9-43d58c8e2d97	active	\N	2014-06-05 01:54:52.829107	9999-12-31 00:00:00	t
dc563b2a-c17b-4793-adea-d24c259f9279	d2633f93-d2e9-4d32-acb8-2c3883db8651	Update Frequency	Once off	295def00-a11d-45b3-a3f0-007988413777	dc563b2a-c17b-4793-adea-d24c259f9279	active	\N	2014-06-10 14:12:27.14846	9999-12-31 00:00:00	t
edb0e643-00b8-4598-96d2-aed06a21a4d0	d2633f93-d2e9-4d32-acb8-2c3883db8651	Geospatial Coverage	South Australia	295def00-a11d-45b3-a3f0-007988413777	edb0e643-00b8-4598-96d2-aed06a21a4d0	active	\N	2014-06-10 14:12:27.14846	9999-12-31 00:00:00	t
f9c60f39-6819-4f13-b67f-c00a3547979d	d2633f93-d2e9-4d32-acb8-2c3883db8651	Temporal Coverage	1879-2012	295def00-a11d-45b3-a3f0-007988413777	f9c60f39-6819-4f13-b67f-c00a3547979d	active	\N	2014-06-10 14:12:27.14846	9999-12-31 00:00:00	t
f411052e-cbb2-4e4a-a4bc-678b7c77173c	d2633f93-d2e9-4d32-acb8-2c3883db8651	Data Granularity	N/A	295def00-a11d-45b3-a3f0-007988413777	f411052e-cbb2-4e4a-a4bc-678b7c77173c	active	\N	2014-06-10 14:12:27.14846	9999-12-31 00:00:00	t
c41257d6-7924-4f5b-b9dc-a2d900d5439b	5a9a4f27-0098-48ef-b13d-c321a96e1d23	Temporal Coverage	Current	50b9ceb0-a43d-4667-8d2e-cd6389ee02aa	c41257d6-7924-4f5b-b9dc-a2d900d5439b	active	\N	2014-06-05 02:08:45.075493	9999-12-31 00:00:00	t
76a74724-3a1c-460b-a27b-c8d4b94827ef	5a9a4f27-0098-48ef-b13d-c321a96e1d23	Update Frequency	Annually	50b9ceb0-a43d-4667-8d2e-cd6389ee02aa	76a74724-3a1c-460b-a27b-c8d4b94827ef	active	\N	2014-06-05 02:08:45.075493	9999-12-31 00:00:00	t
70bc13aa-f266-4d39-b167-c7dcf95542ef	5a9a4f27-0098-48ef-b13d-c321a96e1d23	Data Granularity	parklands playground by name	50b9ceb0-a43d-4667-8d2e-cd6389ee02aa	70bc13aa-f266-4d39-b167-c7dcf95542ef	active	\N	2014-06-05 02:08:45.075493	9999-12-31 00:00:00	t
94121c5e-c467-4270-9904-c85d72577587	5a9a4f27-0098-48ef-b13d-c321a96e1d23	Geospatial Coverage	Adelaide & North Adelaide	50b9ceb0-a43d-4667-8d2e-cd6389ee02aa	94121c5e-c467-4270-9904-c85d72577587	active	\N	2014-06-05 02:08:45.075493	9999-12-31 00:00:00	t
2c0485d9-85fa-4b05-b82a-440545f78813	d8ceffe5-0528-46ec-8506-970c09325881	Geospatial Coverage	Adelaide & North Adelaide	974389e4-4848-4faf-8e1b-4856ae609588	2c0485d9-85fa-4b05-b82a-440545f78813	active	\N	2014-06-05 02:46:08.852212	9999-12-31 00:00:00	t
137781d7-da12-4894-b06d-7e7a76e7e295	d8ceffe5-0528-46ec-8506-970c09325881	Temporal Coverage	Current	974389e4-4848-4faf-8e1b-4856ae609588	137781d7-da12-4894-b06d-7e7a76e7e295	active	\N	2014-06-05 02:46:08.852212	9999-12-31 00:00:00	t
b22b6e5c-bf55-4c2b-8622-69155049b0dc	d8ceffe5-0528-46ec-8506-970c09325881	Data Granularity	information on allotment 	974389e4-4848-4faf-8e1b-4856ae609588	b22b6e5c-bf55-4c2b-8622-69155049b0dc	active	\N	2014-06-05 02:46:08.852212	9999-12-31 00:00:00	t
5ccc9469-d056-482c-bd2e-4870926c45bb	d8ceffe5-0528-46ec-8506-970c09325881	Update Frequency	Annually	974389e4-4848-4faf-8e1b-4856ae609588	5ccc9469-d056-482c-bd2e-4870926c45bb	active	\N	2014-06-05 02:46:08.852212	9999-12-31 00:00:00	t
3eeed9fd-7655-4ddb-8172-e232cd503e21	c29960ca-24a9-47c5-a0cf-aa094f663202	Update Frequency	Annually	7c3ab9f9-f242-46fb-bd17-540aeff9a083	3eeed9fd-7655-4ddb-8172-e232cd503e21	active	\N	2014-06-05 04:07:50.606056	9999-12-31 00:00:00	t
ccc5aeeb-f9f8-458a-926e-31cd55c71a66	c29960ca-24a9-47c5-a0cf-aa094f663202	Geospatial Coverage	Adelaide and North Adelaide	7c3ab9f9-f242-46fb-bd17-540aeff9a083	ccc5aeeb-f9f8-458a-926e-31cd55c71a66	active	\N	2014-06-05 04:07:50.606056	9999-12-31 00:00:00	t
cbdf62fe-2dc4-4c5c-be4a-dbf961f47cdd	c29960ca-24a9-47c5-a0cf-aa094f663202	Temporal Coverage	Current	7c3ab9f9-f242-46fb-bd17-540aeff9a083	cbdf62fe-2dc4-4c5c-be4a-dbf961f47cdd	active	\N	2014-06-05 04:07:50.606056	9999-12-31 00:00:00	t
857cfde9-4ff4-4d20-8c33-248cf35d3e3c	c29960ca-24a9-47c5-a0cf-aa094f663202	Data Granularity	Illustrates parklands sports facilities with its current park location and a description of the facility e.g. tennis courts, golf courses etc. updated annually.	7c3ab9f9-f242-46fb-bd17-540aeff9a083	857cfde9-4ff4-4d20-8c33-248cf35d3e3c	active	\N	2014-06-05 04:07:50.606056	9999-12-31 00:00:00	t
61118c29-2fea-414a-bda0-1fa23625dbc2	8aa33af5-4146-447e-b9e9-0c00b616cd38	Update Frequency	Annually	132d0cc1-fdd2-4621-80e6-555e4226da61	61118c29-2fea-414a-bda0-1fa23625dbc2	active	\N	2014-06-05 04:52:52.587432	9999-12-31 00:00:00	t
62ef3a35-d596-4bca-8293-8437f8fa524c	8aa33af5-4146-447e-b9e9-0c00b616cd38	Temporal Coverage	Current	132d0cc1-fdd2-4621-80e6-555e4226da61	62ef3a35-d596-4bca-8293-8437f8fa524c	active	\N	2014-06-05 04:52:52.587432	9999-12-31 00:00:00	t
5093efb7-6c06-4bb9-b33f-118d343cf535	8aa33af5-4146-447e-b9e9-0c00b616cd38	Data Granularity	Provides summary data about the dog, does not include ownership or address details. 	132d0cc1-fdd2-4621-80e6-555e4226da61	5093efb7-6c06-4bb9-b33f-118d343cf535	active	\N	2014-06-05 04:52:52.587432	9999-12-31 00:00:00	t
a923b899-a78e-43ba-ace3-27d378d9296e	8aa33af5-4146-447e-b9e9-0c00b616cd38	Geospatial Coverage	Adelaide and North Adelaide	132d0cc1-fdd2-4621-80e6-555e4226da61	a923b899-a78e-43ba-ace3-27d378d9296e	active	\N	2014-06-05 04:52:52.587432	9999-12-31 00:00:00	t
d8342b5c-ee87-4c59-b729-90dac15b6766	0a66175c-e9d4-4513-ad8e-83c0f1b845ef	Temporal Coverage	Current	1152286a-fe7c-4179-bd1d-c2b8b1bc8232	d8342b5c-ee87-4c59-b729-90dac15b6766	active	\N	2014-06-05 05:27:07.379575	9999-12-31 00:00:00	t
338b9f24-42bc-47fb-bb20-37ad7b00abd2	0a66175c-e9d4-4513-ad8e-83c0f1b845ef	Geospatial Coverage	Adelaide City Council Boundary	1152286a-fe7c-4179-bd1d-c2b8b1bc8232	338b9f24-42bc-47fb-bb20-37ad7b00abd2	active	\N	2014-06-05 05:27:07.379575	9999-12-31 00:00:00	t
10f37a87-8697-4a02-b04f-3c39dbc57f38	0a66175c-e9d4-4513-ad8e-83c0f1b845ef	Data Granularity	Off street parking data for UPARK car parks showing number of spaces currently available, updated every two minutes.	1152286a-fe7c-4179-bd1d-c2b8b1bc8232	10f37a87-8697-4a02-b04f-3c39dbc57f38	active	\N	2014-06-05 05:27:07.379575	9999-12-31 00:00:00	t
00125dbf-61fc-4c4e-be0a-d325beddb78e	0a66175c-e9d4-4513-ad8e-83c0f1b845ef	Update Frequency	Every 2 minutes	1152286a-fe7c-4179-bd1d-c2b8b1bc8232	00125dbf-61fc-4c4e-be0a-d325beddb78e	active	\N	2014-06-05 05:27:07.379575	9999-12-31 00:00:00	t
b1601476-d2b5-42a0-89c1-54b2ef77e35e	a3a87b53-3971-4876-95a0-aac2add781af	Geospatial Coverage	Adelaide and North Adelaide	75a18689-6915-47ab-90c7-66fd64e40b89	b1601476-d2b5-42a0-89c1-54b2ef77e35e	active	\N	2014-06-05 05:46:37.608646	9999-12-31 00:00:00	t
4fdf9fa4-0b10-4fe2-83eb-02a1e679c4b9	a3a87b53-3971-4876-95a0-aac2add781af	Temporal Coverage	Current	75a18689-6915-47ab-90c7-66fd64e40b89	4fdf9fa4-0b10-4fe2-83eb-02a1e679c4b9	active	\N	2014-06-05 05:46:37.608646	9999-12-31 00:00:00	t
30a33a23-fc09-4686-98a5-2817af34991c	a3a87b53-3971-4876-95a0-aac2add781af	Update Frequency	Annually	75a18689-6915-47ab-90c7-66fd64e40b89	30a33a23-fc09-4686-98a5-2817af34991c	active	\N	2014-06-05 05:46:37.608646	9999-12-31 00:00:00	t
8cb7dc22-8e82-4c97-b0d4-094e540f3f26	a3a87b53-3971-4876-95a0-aac2add781af	Data Granularity	Parklands path route with associated status updated annually.	75a18689-6915-47ab-90c7-66fd64e40b89	8cb7dc22-8e82-4c97-b0d4-094e540f3f26	active	\N	2014-06-05 05:46:37.608646	9999-12-31 00:00:00	t
f61a692c-ebd2-4e4e-896f-f898264ef282	b3238d77-5866-434a-8360-fb9a22c001cf	Geospatial Coverage	Adelaide and North Adelaide	76254d03-88b1-4d1a-b9af-b80838769051	f61a692c-ebd2-4e4e-896f-f898264ef282	active	\N	2014-06-05 06:37:15.640343	9999-12-31 00:00:00	t
56aafc39-373d-407a-9112-28f35fc69469	b3238d77-5866-434a-8360-fb9a22c001cf	Temporal Coverage	Current	76254d03-88b1-4d1a-b9af-b80838769051	56aafc39-373d-407a-9112-28f35fc69469	active	\N	2014-06-05 06:37:15.640343	9999-12-31 00:00:00	t
b9d3489d-779f-47b6-8dde-3630275fe49f	b3238d77-5866-434a-8360-fb9a22c001cf	Update Frequency	Annually	76254d03-88b1-4d1a-b9af-b80838769051	b9d3489d-779f-47b6-8dde-3630275fe49f	active	\N	2014-06-05 06:37:15.640343	9999-12-31 00:00:00	t
d5c007f9-8704-41cf-8ca4-f4cec5bbbb35	b3238d77-5866-434a-8360-fb9a22c001cf	Data Granularity	Provides BBQ data with its GPS coordinate and type of BBQ e.g. Christie 2 plate bbq, green 2 plate bbq. 	76254d03-88b1-4d1a-b9af-b80838769051	d5c007f9-8704-41cf-8ca4-f4cec5bbbb35	active	\N	2014-06-05 06:37:15.640343	9999-12-31 00:00:00	t
3fff4500-a4ba-45ab-a337-287428c784fa	02f2e8e0-f843-4a37-9e0a-eeb4d366991c	Update Frequency	Once off	b225fc1e-096a-4064-b284-51a871f02ca4	3fff4500-a4ba-45ab-a337-287428c784fa	active	\N	2014-06-19 03:51:38.376677	9999-12-31 00:00:00	t
cf1a3d8d-8a41-4502-98f1-c53870b04514	02f2e8e0-f843-4a37-9e0a-eeb4d366991c	Temporal Coverage	1852-1927	b225fc1e-096a-4064-b284-51a871f02ca4	cf1a3d8d-8a41-4502-98f1-c53870b04514	active	\N	2014-06-19 03:51:38.376677	9999-12-31 00:00:00	t
b3a24af3-9622-4d80-9775-edc5b85079ac	02f2e8e0-f843-4a37-9e0a-eeb4d366991c	Data Granularity	N/A	b225fc1e-096a-4064-b284-51a871f02ca4	b3a24af3-9622-4d80-9775-edc5b85079ac	active	\N	2014-06-19 03:51:38.376677	9999-12-31 00:00:00	t
b4f618a2-4190-4103-bcb4-d8b4a08f6e2b	02f2e8e0-f843-4a37-9e0a-eeb4d366991c	Geospatial Coverage	South Australia	b225fc1e-096a-4064-b284-51a871f02ca4	b4f618a2-4190-4103-bcb4-d8b4a08f6e2b	active	\N	2014-06-19 03:51:38.376677	9999-12-31 00:00:00	t
5ecc2256-2ed6-4227-9545-91d334e0e55f	2f8d50dd-da9f-4c71-b278-8d787c1114fd	Geospatial Coverage	Adelaide and North Adelaide	ff3e9568-c3de-4bc0-b00e-57fd58621ccc	5ecc2256-2ed6-4227-9545-91d334e0e55f	active	\N	2014-06-05 07:00:13.090934	9999-12-31 00:00:00	t
61741fc9-5e40-4696-8f76-f50200130630	2f8d50dd-da9f-4c71-b278-8d787c1114fd	Data Granularity	Contains link to each referenced photo in JPEG format	ff3e9568-c3de-4bc0-b00e-57fd58621ccc	61741fc9-5e40-4696-8f76-f50200130630	active	\N	2014-06-05 07:00:13.090934	9999-12-31 00:00:00	t
74c58de9-83fb-4803-b50b-d024eb1e9808	2f8d50dd-da9f-4c71-b278-8d787c1114fd	Temporal Coverage	Current	ff3e9568-c3de-4bc0-b00e-57fd58621ccc	74c58de9-83fb-4803-b50b-d024eb1e9808	active	\N	2014-06-05 07:00:13.090934	9999-12-31 00:00:00	t
c1cbb2c3-5047-4448-860e-1b2b90c33de8	2f8d50dd-da9f-4c71-b278-8d787c1114fd	Update Frequency	Periodically when historic photos of Adelaide are digitised by Adelaide City Council Archives and added to the collection.  Last updated in May 2014.	ff3e9568-c3de-4bc0-b00e-57fd58621ccc	c1cbb2c3-5047-4448-860e-1b2b90c33de8	active	\N	2014-06-05 07:00:13.090934	9999-12-31 00:00:00	t
61c986e7-3b1e-4f17-9a91-964876e9b74a	0e4a82b7-b1d9-47d8-8c74-3cb2ac296661	Temporal Coverage	1847-1940	2403b251-e6e2-4558-a7db-ed16fbbee40d	61c986e7-3b1e-4f17-9a91-964876e9b74a	active	\N	2014-06-10 15:04:46.495761	9999-12-31 00:00:00	t
7a2818dd-4ce5-4204-a11a-33d9284ec805	0e4a82b7-b1d9-47d8-8c74-3cb2ac296661	Geospatial Coverage	South Australia	2403b251-e6e2-4558-a7db-ed16fbbee40d	7a2818dd-4ce5-4204-a11a-33d9284ec805	active	\N	2014-06-10 15:04:46.495761	9999-12-31 00:00:00	t
6c34b1ff-4395-425b-bdb0-448dd9928642	0e4a82b7-b1d9-47d8-8c74-3cb2ac296661	Update Frequency	Annually	2403b251-e6e2-4558-a7db-ed16fbbee40d	6c34b1ff-4395-425b-bdb0-448dd9928642	active	\N	2014-06-10 15:04:46.495761	9999-12-31 00:00:00	t
3680f792-689b-427f-a75a-2dd9d3ffd046	0e4a82b7-b1d9-47d8-8c74-3cb2ac296661	Data Granularity	N/A	2403b251-e6e2-4558-a7db-ed16fbbee40d	3680f792-689b-427f-a75a-2dd9d3ffd046	active	\N	2014-06-10 15:04:46.495761	9999-12-31 00:00:00	t
d0b67e10-9b2e-4fac-a921-159806d5263c	4ca19b06-a079-4a21-a452-2b56fba257d7	Geospatial Coverage	Adelaide and North Adelaide	c90dae9d-3fdc-4909-bd5b-c972c7e8a7fe	d0b67e10-9b2e-4fac-a921-159806d5263c	active	\N	2014-06-05 07:27:51.174699	9999-12-31 00:00:00	t
cf7f4aaf-aa0f-4757-a389-c062bbd90420	4ca19b06-a079-4a21-a452-2b56fba257d7	Update Frequency	Annually	c90dae9d-3fdc-4909-bd5b-c972c7e8a7fe	cf7f4aaf-aa0f-4757-a389-c062bbd90420	active	\N	2014-06-05 07:27:51.174699	9999-12-31 00:00:00	t
fcad5d99-53c7-4ed1-b0a8-d5a550595889	4ca19b06-a079-4a21-a452-2b56fba257d7	Temporal Coverage	Current	c90dae9d-3fdc-4909-bd5b-c972c7e8a7fe	fcad5d99-53c7-4ed1-b0a8-d5a550595889	active	\N	2014-06-05 07:27:51.174699	9999-12-31 00:00:00	t
48bb621f-21bc-44ab-9db5-b1a8418efe31	4ca19b06-a079-4a21-a452-2b56fba257d7	Data Granularity	Provides seat data illustrating GPS location and the seat type.	c90dae9d-3fdc-4909-bd5b-c972c7e8a7fe	48bb621f-21bc-44ab-9db5-b1a8418efe31	active	\N	2014-06-05 07:27:51.174699	9999-12-31 00:00:00	t
49366298-0050-4d6a-9313-47b9aff3548f	8b6bb491-d9e3-48dc-8230-08a24de1773e	Update Frequency	Annually	5b6baad2-cef9-4d5f-91a5-e952fb9cc8ca	49366298-0050-4d6a-9313-47b9aff3548f	active	\N	2014-06-05 07:48:15.26855	9999-12-31 00:00:00	t
ed3b0b41-eb87-4bdc-83c6-0a85cbfaeb9b	8b6bb491-d9e3-48dc-8230-08a24de1773e	Temporal Coverage	Current	5b6baad2-cef9-4d5f-91a5-e952fb9cc8ca	ed3b0b41-eb87-4bdc-83c6-0a85cbfaeb9b	active	\N	2014-06-05 07:48:15.26855	9999-12-31 00:00:00	t
c8877896-4b10-4de5-b9ad-88b49ccf5aaf	8b6bb491-d9e3-48dc-8230-08a24de1773e	Geospatial Coverage	Adelaide and North Adelaide	5b6baad2-cef9-4d5f-91a5-e952fb9cc8ca	c8877896-4b10-4de5-b9ad-88b49ccf5aaf	active	\N	2014-06-05 07:48:15.26855	9999-12-31 00:00:00	t
e09f8ce9-770b-4831-9d55-1a225a8e5845	8b6bb491-d9e3-48dc-8230-08a24de1773e	Data Granularity	Illustrates parkland parks, its number associated to the parklands pocket guide map and its traditional aboriginal name updated annually.	5b6baad2-cef9-4d5f-91a5-e952fb9cc8ca	e09f8ce9-770b-4831-9d55-1a225a8e5845	active	\N	2014-06-05 07:48:15.26855	9999-12-31 00:00:00	t
a31b5bb7-4562-4442-a911-23ad46ebf7b8	2b292e74-0e72-421f-be81-a3c7d9438ffa	Temporal Coverage	Current	b65da817-4231-487a-bf93-ad617051fc5d	a31b5bb7-4562-4442-a911-23ad46ebf7b8	active	\N	2014-06-06 03:27:27.162077	9999-12-31 00:00:00	t
d962affb-055e-4fbf-9a64-edd881255de4	2b292e74-0e72-421f-be81-a3c7d9438ffa	Data Granularity		b65da817-4231-487a-bf93-ad617051fc5d	d962affb-055e-4fbf-9a64-edd881255de4	active	\N	2014-06-06 03:27:27.162077	9999-12-31 00:00:00	t
b013c17f-4e3d-400c-9c39-e26413f22f04	2b292e74-0e72-421f-be81-a3c7d9438ffa	Geospatial Coverage	South Australia	b65da817-4231-487a-bf93-ad617051fc5d	b013c17f-4e3d-400c-9c39-e26413f22f04	active	\N	2014-06-06 03:27:27.162077	9999-12-31 00:00:00	t
0cc0503e-5845-46d7-9d06-373c44ce967f	2b292e74-0e72-421f-be81-a3c7d9438ffa	Update Frequency	Annually	b65da817-4231-487a-bf93-ad617051fc5d	0cc0503e-5845-46d7-9d06-373c44ce967f	active	\N	2014-06-06 03:27:27.162077	9999-12-31 00:00:00	t
f1757314-9053-4085-b0e2-164d806c4a13	97f60b3e-9b50-4cc2-9960-73288d076c51	Temporal Coverage	1856-1887	eab0f98a-0236-4ac4-985f-5a479fa7d4fe	f1757314-9053-4085-b0e2-164d806c4a13	active	\N	2014-06-10 13:21:15.40488	9999-12-31 00:00:00	t
4ba73854-0389-4fd0-a462-f2bc26c173f0	97f60b3e-9b50-4cc2-9960-73288d076c51	Data Granularity	N/A	eab0f98a-0236-4ac4-985f-5a479fa7d4fe	4ba73854-0389-4fd0-a462-f2bc26c173f0	active	\N	2014-06-10 13:21:15.40488	9999-12-31 00:00:00	t
24bb0cd3-d40f-4e9e-b839-e91ea2c7669e	97f60b3e-9b50-4cc2-9960-73288d076c51	Update Frequency	Once off	eab0f98a-0236-4ac4-985f-5a479fa7d4fe	24bb0cd3-d40f-4e9e-b839-e91ea2c7669e	active	\N	2014-06-10 13:21:15.40488	9999-12-31 00:00:00	t
9f1ff414-2e4a-46e3-a6ea-3661f1f38822	97f60b3e-9b50-4cc2-9960-73288d076c51	Geospatial Coverage	South Australia	eab0f98a-0236-4ac4-985f-5a479fa7d4fe	9f1ff414-2e4a-46e3-a6ea-3661f1f38822	active	\N	2014-06-10 13:21:15.40488	9999-12-31 00:00:00	t
15d406a4-9b69-4ca3-8dee-617744614bbb	53e0a256-d7e9-4500-af06-38b84d66abde	Data Granularity	Regional	524b276f-369c-48c7-8ad6-83ca5069725c	15d406a4-9b69-4ca3-8dee-617744614bbb	active	\N	2014-06-12 04:10:28.232564	9999-12-31 00:00:00	t
a17dd506-d1f9-4c24-b9a8-a388daf8a83d	53e0a256-d7e9-4500-af06-38b84d66abde	Geospatial Coverage	Australia	524b276f-369c-48c7-8ad6-83ca5069725c	a17dd506-d1f9-4c24-b9a8-a388daf8a83d	active	\N	2014-06-12 04:10:28.232564	9999-12-31 00:00:00	t
eb2c7a64-82cf-4df7-9ad3-ab8a13c9b9e7	3622df16-089c-4fdb-9e97-f64637c7669d	Data Location	Hosted	bfa4b77f-6d36-4848-aea7-a5bbf14546ac	eb2c7a64-82cf-4df7-9ad3-ab8a13c9b9e7	active	\N	2014-06-26 05:59:35.273069	9999-12-31 00:00:00	t
4204720d-3d85-47da-8874-3fa5d680ed09	3622df16-089c-4fdb-9e97-f64637c7669d	Geospatial Coverage	South Australia	bfa4b77f-6d36-4848-aea7-a5bbf14546ac	4204720d-3d85-47da-8874-3fa5d680ed09	active	\N	2014-06-26 05:59:35.273069	9999-12-31 00:00:00	t
1a9e3846-3bcd-4f97-9f61-d34bb5e3589a	3622df16-089c-4fdb-9e97-f64637c7669d	Update Frequency	Annually	bfa4b77f-6d36-4848-aea7-a5bbf14546ac	1a9e3846-3bcd-4f97-9f61-d34bb5e3589a	active	\N	2014-06-26 05:59:35.273069	9999-12-31 00:00:00	t
d37808bd-af1a-4ef8-89ac-8a3ea265c256	3622df16-089c-4fdb-9e97-f64637c7669d	Temporal Coverage	2010-2014	bfa4b77f-6d36-4848-aea7-a5bbf14546ac	d37808bd-af1a-4ef8-89ac-8a3ea265c256	active	\N	2014-06-26 05:59:35.273069	9999-12-31 00:00:00	t
09cb7187-4205-40e8-a24f-fedb0b33ceda	4cb3fb7f-67d3-44c8-b08f-3c891d009859	Geospatial Coverage	Global	ee9cef4c-eaaf-4cba-97b0-61f0842c00e7	09cb7187-4205-40e8-a24f-fedb0b33ceda	active	\N	2014-06-12 04:36:04.138475	9999-12-31 00:00:00	t
1a683138-bd31-4a8f-ae57-befcedefc1dc	4cb3fb7f-67d3-44c8-b08f-3c891d009859	Data Granularity	Country	ee9cef4c-eaaf-4cba-97b0-61f0842c00e7	1a683138-bd31-4a8f-ae57-befcedefc1dc	active	\N	2014-06-12 04:36:04.138475	9999-12-31 00:00:00	t
4de9d51b-57f6-4d91-b39a-616022913260	4cb3fb7f-67d3-44c8-b08f-3c891d009859	Update Frequency	Ad-hoc	ee9cef4c-eaaf-4cba-97b0-61f0842c00e7	4de9d51b-57f6-4d91-b39a-616022913260	active	\N	2014-06-12 04:36:04.138475	9999-12-31 00:00:00	t
0207f5b4-2b89-4bea-9886-acdee35f6b48	4cb3fb7f-67d3-44c8-b08f-3c891d009859	Temporal Coverage	1961-2009	ee9cef4c-eaaf-4cba-97b0-61f0842c00e7	0207f5b4-2b89-4bea-9886-acdee35f6b48	active	\N	2014-06-12 04:36:04.138475	9999-12-31 00:00:00	t
40665d5b-9571-46af-bfb0-cfe4ae9258b1	b1b64b79-e634-4c79-a52f-1680b3ef5c9c	Temporal Coverage	Current	1bf9af93-0675-45de-8ec2-9ebb9a32eb05	40665d5b-9571-46af-bfb0-cfe4ae9258b1	active	\N	2014-06-12 05:37:20.44137	9999-12-31 00:00:00	t
d2ae4494-6c56-488e-b1b6-9423f129379d	b1b64b79-e634-4c79-a52f-1680b3ef5c9c	Geospatial Coverage	South Australia	1bf9af93-0675-45de-8ec2-9ebb9a32eb05	d2ae4494-6c56-488e-b1b6-9423f129379d	active	\N	2014-06-12 05:37:20.44137	9999-12-31 00:00:00	t
e83e19cd-c715-488b-a056-bcf3905485e7	b1b64b79-e634-4c79-a52f-1680b3ef5c9c	Update Frequency	Annually	1bf9af93-0675-45de-8ec2-9ebb9a32eb05	e83e19cd-c715-488b-a056-bcf3905485e7	active	\N	2014-06-12 05:37:20.44137	9999-12-31 00:00:00	t
4ae3c3ad-5f9e-4433-a5b9-5b70ae7a9fe1	b1b64b79-e634-4c79-a52f-1680b3ef5c9c	Data Granularity	Postcode	1bf9af93-0675-45de-8ec2-9ebb9a32eb05	4ae3c3ad-5f9e-4433-a5b9-5b70ae7a9fe1	active	\N	2014-06-12 05:37:20.44137	9999-12-31 00:00:00	t
5e3fc975-ab6e-4315-8ed8-f32446cb2b6b	f2204ad8-f815-4241-8344-7ce28a7f9906	Update Frequency	Annually	2fa0bb40-55ab-4b9f-8c86-735dffa32cfc	5e3fc975-ab6e-4315-8ed8-f32446cb2b6b	active	\N	2014-06-12 07:34:24.805763	9999-12-31 00:00:00	t
12a12809-71bc-46a6-97c6-03f74be3cf23	f2204ad8-f815-4241-8344-7ce28a7f9906	Temporal Coverage	From 29th November 2007 to Current	2fa0bb40-55ab-4b9f-8c86-735dffa32cfc	12a12809-71bc-46a6-97c6-03f74be3cf23	active	\N	2014-06-12 07:34:24.805763	9999-12-31 00:00:00	t
b99745e1-7e09-4b4d-a6cf-e546cb22004f	f2204ad8-f815-4241-8344-7ce28a7f9906	Geospatial Coverage	South Australia and jurisdictional waters	2fa0bb40-55ab-4b9f-8c86-735dffa32cfc	b99745e1-7e09-4b4d-a6cf-e546cb22004f	active	\N	2014-06-12 07:34:24.805763	9999-12-31 00:00:00	t
c0c4b4ee-8863-415d-8039-2e65f52fade5	f2204ad8-f815-4241-8344-7ce28a7f9906	Data Granularity	Attribute level	2fa0bb40-55ab-4b9f-8c86-735dffa32cfc	c0c4b4ee-8863-415d-8039-2e65f52fade5	active	\N	2014-06-12 07:34:24.805763	9999-12-31 00:00:00	t
26d3c830-9eb0-4523-8014-9d8f877af865	00468af7-ef81-46f3-9d77-d0cdeae6df62	Data Granularity	Attribute level	8ce4e6f8-84ea-4dca-8bc5-3330c0d80299	26d3c830-9eb0-4523-8014-9d8f877af865	active	\N	2014-06-15 22:33:40.609951	9999-12-31 00:00:00	t
93f2c940-a754-4afe-90c8-fcf1b49d5b86	00468af7-ef81-46f3-9d77-d0cdeae6df62	Temporal Coverage	From 29th November 2007 to June 2014	8ce4e6f8-84ea-4dca-8bc5-3330c0d80299	93f2c940-a754-4afe-90c8-fcf1b49d5b86	active	\N	2014-06-15 22:33:40.609951	9999-12-31 00:00:00	t
2566007c-9207-4c9d-8224-dcee213274ec	00468af7-ef81-46f3-9d77-d0cdeae6df62	Update Frequency	Annually	8ce4e6f8-84ea-4dca-8bc5-3330c0d80299	2566007c-9207-4c9d-8224-dcee213274ec	active	\N	2014-06-15 22:33:40.609951	9999-12-31 00:00:00	t
fc2d1854-24ac-404d-9d4e-6980635c073e	00468af7-ef81-46f3-9d77-d0cdeae6df62	Geospatial Coverage	South Australia and jurisdictional waters	8ce4e6f8-84ea-4dca-8bc5-3330c0d80299	fc2d1854-24ac-404d-9d4e-6980635c073e	active	\N	2014-06-15 22:33:40.609951	9999-12-31 00:00:00	t
2b21f0d0-51f9-45cc-8d34-ca0be0b2e895	37c8fd28-8db8-4d4b-8b85-3bdbae7b2f3d	Update Frequency	Daily on the website	f2017c5c-652e-4a8c-b6b4-4c4887851c3a	2b21f0d0-51f9-45cc-8d34-ca0be0b2e895	active	\N	2014-06-16 02:10:31.908529	9999-12-31 00:00:00	t
8ae55dac-c832-42aa-81f4-4376ce3034f0	37c8fd28-8db8-4d4b-8b85-3bdbae7b2f3d	Temporal Coverage	Dataset Timespan	f2017c5c-652e-4a8c-b6b4-4c4887851c3a	8ae55dac-c832-42aa-81f4-4376ce3034f0	active	\N	2014-06-16 02:10:31.908529	9999-12-31 00:00:00	t
9e6a438a-4b46-41b4-98a6-83ca0c9eefeb	37c8fd28-8db8-4d4b-8b85-3bdbae7b2f3d	Data Granularity		f2017c5c-652e-4a8c-b6b4-4c4887851c3a	9e6a438a-4b46-41b4-98a6-83ca0c9eefeb	active	\N	2014-06-16 02:10:31.908529	9999-12-31 00:00:00	t
327ce3d7-a876-484d-9263-48e6403712c7	37c8fd28-8db8-4d4b-8b85-3bdbae7b2f3d	Geospatial Coverage	Mount Gambier or South Australia	f2017c5c-652e-4a8c-b6b4-4c4887851c3a	327ce3d7-a876-484d-9263-48e6403712c7	active	\N	2014-06-16 02:10:31.908529	9999-12-31 00:00:00	t
51a9095a-c03a-43f0-968a-9100f96c1ca6	123073c1-5f3c-4f28-a4db-54705a40c7e0	Update Frequency	Daily on the website	f18d41d2-6d46-4363-9f01-b84c9834f3e8	51a9095a-c03a-43f0-968a-9100f96c1ca6	active	\N	2014-06-16 02:30:48.502115	9999-12-31 00:00:00	t
20ef64fe-1204-486b-acf6-ac1b41316c9a	123073c1-5f3c-4f28-a4db-54705a40c7e0	Temporal Coverage	Various periodic water sampling	f18d41d2-6d46-4363-9f01-b84c9834f3e8	20ef64fe-1204-486b-acf6-ac1b41316c9a	active	\N	2014-06-16 02:30:48.502115	9999-12-31 00:00:00	t
443b1bff-509d-4846-95c9-eea0b47ee9f3	123073c1-5f3c-4f28-a4db-54705a40c7e0	Data Granularity	Frequency of water sampling varies between wells	f18d41d2-6d46-4363-9f01-b84c9834f3e8	443b1bff-509d-4846-95c9-eea0b47ee9f3	active	\N	2014-06-16 02:30:48.502115	9999-12-31 00:00:00	t
26882d84-0a3f-4247-91f0-505935d50841	123073c1-5f3c-4f28-a4db-54705a40c7e0	Geospatial Coverage	Mount Gambier Local Government Area, South Australia	f18d41d2-6d46-4363-9f01-b84c9834f3e8	26882d84-0a3f-4247-91f0-505935d50841	active	\N	2014-06-16 02:30:48.502115	9999-12-31 00:00:00	t
776772df-1c60-41cb-89d4-376cff12aa0f	3755e524-fc7b-48ab-a9c1-f9f35a26e315	Update Frequency	Annually	15949eb4-b07a-426b-bf81-feeb19ba96a5	776772df-1c60-41cb-89d4-376cff12aa0f	active	\N	2014-06-16 02:46:12.74754	9999-12-31 00:00:00	t
0281d718-3e0e-4582-8329-1a196bf60102	3755e524-fc7b-48ab-a9c1-f9f35a26e315	Temporal Coverage	Well construction to last water chemistry sampling and testing	15949eb4-b07a-426b-bf81-feeb19ba96a5	0281d718-3e0e-4582-8329-1a196bf60102	active	\N	2014-06-16 02:46:12.74754	9999-12-31 00:00:00	t
7b04f5a8-8c3e-4cff-a881-34dddac1381f	3755e524-fc7b-48ab-a9c1-f9f35a26e315	Geospatial Coverage	Great Artesian Basin, Far North, South Australia	15949eb4-b07a-426b-bf81-feeb19ba96a5	7b04f5a8-8c3e-4cff-a881-34dddac1381f	active	\N	2014-06-16 02:46:12.74754	9999-12-31 00:00:00	t
22a935c1-cc2f-431b-a5f8-1d196bdf0f61	3755e524-fc7b-48ab-a9c1-f9f35a26e315	Data Granularity	Various periodic monitoring cycles	15949eb4-b07a-426b-bf81-feeb19ba96a5	22a935c1-cc2f-431b-a5f8-1d196bdf0f61	active	\N	2014-06-16 02:46:12.74754	9999-12-31 00:00:00	t
3fb7f080-7ccb-4e7c-a510-e2fff4611b97	a3fe22b1-0807-4409-bdab-46dbbad6c300	Geospatial Coverage	South Australia, Egypt, Turkey, Dardanelles, France belgium	b6b6d390-48d2-475c-b8a1-c50c1772fbaa	3fb7f080-7ccb-4e7c-a510-e2fff4611b97	active	\N	2014-06-19 04:08:10.565712	9999-12-31 00:00:00	t
72359bc6-0033-4d8e-8562-379afd1bcf97	a3fe22b1-0807-4409-bdab-46dbbad6c300	Update Frequency	Once off	b6b6d390-48d2-475c-b8a1-c50c1772fbaa	72359bc6-0033-4d8e-8562-379afd1bcf97	active	\N	2014-06-19 04:08:10.565712	9999-12-31 00:00:00	t
031265f6-7985-4b7a-a5ff-8dfdf7fd6dff	a3fe22b1-0807-4409-bdab-46dbbad6c300	Temporal Coverage	1915-1919	b6b6d390-48d2-475c-b8a1-c50c1772fbaa	031265f6-7985-4b7a-a5ff-8dfdf7fd6dff	active	\N	2014-06-19 04:08:10.565712	9999-12-31 00:00:00	t
deefd29e-e60d-4ece-8171-9ed972b9ccf7	a3fe22b1-0807-4409-bdab-46dbbad6c300	Data Granularity	N/A	b6b6d390-48d2-475c-b8a1-c50c1772fbaa	deefd29e-e60d-4ece-8171-9ed972b9ccf7	active	\N	2014-06-19 04:08:10.565712	9999-12-31 00:00:00	t
5c6b4995-f230-4133-b0db-a61f3fff5faa	c62d0989-33bd-4423-ac8f-53377891714f	Update Frequency	Recorded hourly; data presented as daily mean on the website	b6507508-835c-4dbc-8c6c-7f92a54bc028	5c6b4995-f230-4133-b0db-a61f3fff5faa	active	\N	2014-06-16 05:08:39.456311	9999-12-31 00:00:00	t
1eb1bd02-cb12-46a0-aa36-ccf3e5ee68d3	c62d0989-33bd-4423-ac8f-53377891714f	Geospatial Coverage	Mt Gambier, South Australia	b6507508-835c-4dbc-8c6c-7f92a54bc028	1eb1bd02-cb12-46a0-aa36-ccf3e5ee68d3	active	\N	2014-06-16 05:08:39.456311	9999-12-31 00:00:00	t
0c5ac59d-a8dc-4d99-b27d-a66836c7e99f	c62d0989-33bd-4423-ac8f-53377891714f	Data Granularity		b6507508-835c-4dbc-8c6c-7f92a54bc028	0c5ac59d-a8dc-4d99-b27d-a66836c7e99f	active	\N	2014-06-16 05:08:39.456311	9999-12-31 00:00:00	t
9dd5fff2-41cb-4065-ad7d-b56d95285571	c62d0989-33bd-4423-ac8f-53377891714f	Temporal Coverage	Current	b6507508-835c-4dbc-8c6c-7f92a54bc028	9dd5fff2-41cb-4065-ad7d-b56d95285571	active	\N	2014-06-16 05:08:39.456311	9999-12-31 00:00:00	t
3b8e902c-4735-4c00-874d-a7ea4435a536	6c73c59c-0101-4df0-bbdd-d38936bff19a	Data Granularity	Daily By Location	d8a1c36d-7dfe-4d17-b0ff-89fc71492d0c	3b8e902c-4735-4c00-874d-a7ea4435a536	active	\N	2014-06-16 05:30:26.6276	9999-12-31 00:00:00	t
22d6b3bb-0123-4f20-97a9-89e61c04bc29	6c73c59c-0101-4df0-bbdd-d38936bff19a	Geospatial Coverage	Lock 9 on the River Murray to Wellington, South Australia	d8a1c36d-7dfe-4d17-b0ff-89fc71492d0c	22d6b3bb-0123-4f20-97a9-89e61c04bc29	active	\N	2014-06-16 05:30:26.6276	9999-12-31 00:00:00	t
499312c0-0101-4141-822d-bd3f9b478faa	6c73c59c-0101-4df0-bbdd-d38936bff19a	Update Frequency	Hourly as daily means, on the website	d8a1c36d-7dfe-4d17-b0ff-89fc71492d0c	499312c0-0101-4141-822d-bd3f9b478faa	active	\N	2014-06-16 05:30:26.6276	9999-12-31 00:00:00	t
10424885-d65b-47a3-b652-768e50361723	6c73c59c-0101-4df0-bbdd-d38936bff19a	Temporal Coverage	365 days to current date	d8a1c36d-7dfe-4d17-b0ff-89fc71492d0c	10424885-d65b-47a3-b652-768e50361723	active	\N	2014-06-16 05:30:26.6276	9999-12-31 00:00:00	t
dff9f14c-8ffc-4fd7-bb0d-eba3d34fd16b	c2192907-c5e2-42ec-9cbd-41f6123030d9	Update Frequency	Daily on the website	8eaf4443-79ea-4d98-8d68-b48200588039	dff9f14c-8ffc-4fd7-bb0d-eba3d34fd16b	active	\N	2014-06-16 06:21:00.154392	9999-12-31 00:00:00	t
2a5ad327-32e2-4526-94b8-899727036321	c2192907-c5e2-42ec-9cbd-41f6123030d9	Temporal Coverage	Various periodic water sampling	8eaf4443-79ea-4d98-8d68-b48200588039	2a5ad327-32e2-4526-94b8-899727036321	active	\N	2014-06-16 06:21:00.154392	9999-12-31 00:00:00	t
ba572da0-1558-4e3d-9fa0-eb44edf0594c	c2192907-c5e2-42ec-9cbd-41f6123030d9	Geospatial Coverage	Drawn box from Naracoorte to Millicent, South Australia	8eaf4443-79ea-4d98-8d68-b48200588039	ba572da0-1558-4e3d-9fa0-eb44edf0594c	active	\N	2014-06-16 06:21:00.154392	9999-12-31 00:00:00	t
2e2e22ec-b8e3-42fc-a1e5-ef592ee34fcd	c2192907-c5e2-42ec-9cbd-41f6123030d9	Data Granularity	Frequency of water level readings varies between wells	8eaf4443-79ea-4d98-8d68-b48200588039	2e2e22ec-b8e3-42fc-a1e5-ef592ee34fcd	active	\N	2014-06-16 06:21:00.154392	9999-12-31 00:00:00	t
295708a1-4e73-4aaa-a7dd-718156b70497	4666f1a7-cde4-40d0-85ef-f7ec2aec7ca9	Update Frequency	Daily on the website	a12c9464-fb4d-4e75-816b-c042b7e3d229	295708a1-4e73-4aaa-a7dd-718156b70497	active	\N	2014-06-16 06:41:27.568529	9999-12-31 00:00:00	t
ada19dd9-cf92-44b3-8749-1a11b5b149d4	4666f1a7-cde4-40d0-85ef-f7ec2aec7ca9	Temporal Coverage	Various periodic water sampling	a12c9464-fb4d-4e75-816b-c042b7e3d229	ada19dd9-cf92-44b3-8749-1a11b5b149d4	active	\N	2014-06-16 06:41:27.568529	9999-12-31 00:00:00	t
000fd0b0-ca5a-4e9e-a495-79d6f9a16234	4666f1a7-cde4-40d0-85ef-f7ec2aec7ca9	Data Granularity	Frequency of water sampling varies between wells	a12c9464-fb4d-4e75-816b-c042b7e3d229	000fd0b0-ca5a-4e9e-a495-79d6f9a16234	active	\N	2014-06-16 06:41:27.568529	9999-12-31 00:00:00	t
55061cd8-b4ac-414e-a446-54b50cacca15	4666f1a7-cde4-40d0-85ef-f7ec2aec7ca9	Geospatial Coverage	Drawn box from Naracoorte to Millicent, South Australia	a12c9464-fb4d-4e75-816b-c042b7e3d229	55061cd8-b4ac-414e-a446-54b50cacca15	active	\N	2014-06-16 06:41:27.568529	9999-12-31 00:00:00	t
9a58b0e8-f354-4cae-afb5-050c9dfcacc0	9afa8373-7fd1-4ad9-86a2-b680476df232	Update Frequency	Hourly on the website	4f635a01-a9cc-41d6-a94d-98483ab918b5	9a58b0e8-f354-4cae-afb5-050c9dfcacc0	active	\N	2014-06-16 07:00:06.837411	9999-12-31 00:00:00	t
4f4a50bb-f7a8-483c-b844-50c6fd0827af	9afa8373-7fd1-4ad9-86a2-b680476df232	Data Granularity	Hourly tidal observations	4f635a01-a9cc-41d6-a94d-98483ab918b5	4f4a50bb-f7a8-483c-b844-50c6fd0827af	active	\N	2014-06-16 07:00:06.837411	9999-12-31 00:00:00	t
fab396b0-31dc-4b82-a880-8ec167f4ef3c	9afa8373-7fd1-4ad9-86a2-b680476df232	Temporal Coverage	365 days to current date	4f635a01-a9cc-41d6-a94d-98483ab918b5	fab396b0-31dc-4b82-a880-8ec167f4ef3c	active	\N	2014-06-16 07:00:06.837411	9999-12-31 00:00:00	t
1bd83324-f5a2-4678-ac44-e78d0b9f4cbc	9afa8373-7fd1-4ad9-86a2-b680476df232	Geospatial Coverage	Tauwitchere Barrage, Coorong, South Australia	4f635a01-a9cc-41d6-a94d-98483ab918b5	1bd83324-f5a2-4678-ac44-e78d0b9f4cbc	active	\N	2014-06-16 07:00:06.837411	9999-12-31 00:00:00	t
3d77e01a-2018-4739-87ff-9b3a89d7fd34	07b0857c-7d28-4fe5-aed8-146a7cf6b717	Update Frequency	Daily	7ecd33fd-de09-459b-b158-521033fb10f5	3d77e01a-2018-4739-87ff-9b3a89d7fd34	active	\N	2014-06-16 07:57:07.054465	9999-12-31 00:00:00	t
e156f134-7cbf-4486-b697-97cd0742dcba	07b0857c-7d28-4fe5-aed8-146a7cf6b717	Data Granularity		7ecd33fd-de09-459b-b158-521033fb10f5	e156f134-7cbf-4486-b697-97cd0742dcba	active	\N	2014-06-16 07:57:07.054465	9999-12-31 00:00:00	t
c3597822-f98a-490d-af64-bb5aa4bf481c	07b0857c-7d28-4fe5-aed8-146a7cf6b717	Geospatial Coverage	South Australia	7ecd33fd-de09-459b-b158-521033fb10f5	c3597822-f98a-490d-af64-bb5aa4bf481c	active	\N	2014-06-16 07:57:07.054465	9999-12-31 00:00:00	t
fb62221a-9ec0-470c-bef7-77522902c8f7	07b0857c-7d28-4fe5-aed8-146a7cf6b717	Temporal Coverage	Current	7ecd33fd-de09-459b-b158-521033fb10f5	fb62221a-9ec0-470c-bef7-77522902c8f7	active	\N	2014-06-16 07:57:07.054465	9999-12-31 00:00:00	t
20c0779f-7a87-45a8-9e01-9767c49e8e9c	4f9cce24-1ed0-40cb-9e9b-bd49ad8b17cf	Geospatial Coverage	Adelaide Hills (DC) Local Government Area	68605461-2aa4-45a3-a56e-e670ce6062e8	20c0779f-7a87-45a8-9e01-9767c49e8e9c	active	\N	2014-07-01 05:33:37.826652	9999-12-31 00:00:00	t
322cbfaf-6abc-4c47-b4e7-301f5df7de69	0c085f98-5cc4-41f0-9eb9-5be42df73cdb	Geospatial Coverage	Spencer Gulf Region	5c259e90-bff5-477d-af6e-083ee44adcc4	322cbfaf-6abc-4c47-b4e7-301f5df7de69	active	\N	2014-06-22 15:50:13.122743	9999-12-31 00:00:00	t
9a25f52a-2a63-4e2d-8842-cf2d5237c672	0c085f98-5cc4-41f0-9eb9-5be42df73cdb	Data Location	Hosted	5c259e90-bff5-477d-af6e-083ee44adcc4	9a25f52a-2a63-4e2d-8842-cf2d5237c672	active	\N	2014-06-22 15:50:13.122743	9999-12-31 00:00:00	t
9623f98e-7af4-4603-8f19-a2016808d181	e10d41fb-f1e6-4161-9f9a-f2386d9417bb	Geospatial Coverage	South Australia	4a0b5cd2-8d5b-4044-a97a-9d8d8a51ce47	9623f98e-7af4-4603-8f19-a2016808d181	active	\N	2014-06-17 06:17:48.344918	9999-12-31 00:00:00	t
c2bdd046-f4d1-41bf-b26a-b4b93099dba2	e10d41fb-f1e6-4161-9f9a-f2386d9417bb	Update Frequency	Monthly	4a0b5cd2-8d5b-4044-a97a-9d8d8a51ce47	c2bdd046-f4d1-41bf-b26a-b4b93099dba2	active	\N	2014-06-17 06:17:48.344918	9999-12-31 00:00:00	t
9bb55c1e-7837-4439-988d-2efbd12985b1	e10d41fb-f1e6-4161-9f9a-f2386d9417bb	Data Granularity	Data is typically updated on a catchment, basin or administrative region basis and frequency ranges from annually for high rainfall areas through to five yearly or more for arid regions. 	4a0b5cd2-8d5b-4044-a97a-9d8d8a51ce47	9bb55c1e-7837-4439-988d-2efbd12985b1	active	\N	2014-06-17 06:17:48.344918	9999-12-31 00:00:00	t
da9fa54c-c9e1-421f-9a9d-a210b7b211a8	e10d41fb-f1e6-4161-9f9a-f2386d9417bb	Temporal Coverage	Current	4a0b5cd2-8d5b-4044-a97a-9d8d8a51ce47	da9fa54c-c9e1-421f-9a9d-a210b7b211a8	active	\N	2014-06-17 06:17:48.344918	9999-12-31 00:00:00	t
c4d1c95e-1eed-44c1-9dc2-10dc04c35262	11ed7815-8efa-4e72-a932-aea9f00e3d4f	Temporal Coverage	1915-1919	a3266bee-bdda-48d2-98a5-01ed1b497d38	c4d1c95e-1eed-44c1-9dc2-10dc04c35262	active	\N	2014-06-19 04:46:27.182281	9999-12-31 00:00:00	t
0d4a5ca2-70aa-429d-acd9-f71120f21256	11ed7815-8efa-4e72-a932-aea9f00e3d4f	Geospatial Coverage	South Australia, Egypt, Turkey, Dardanelles, France belgium	a3266bee-bdda-48d2-98a5-01ed1b497d38	0d4a5ca2-70aa-429d-acd9-f71120f21256	active	\N	2014-06-19 04:46:27.182281	9999-12-31 00:00:00	t
2e5ba475-3098-4d75-9391-e733f329d8c5	11ed7815-8efa-4e72-a932-aea9f00e3d4f	Update Frequency	Once off	a3266bee-bdda-48d2-98a5-01ed1b497d38	2e5ba475-3098-4d75-9391-e733f329d8c5	active	\N	2014-06-19 04:46:27.182281	9999-12-31 00:00:00	t
6638907e-a46e-4ea4-8c0b-c0b494b1da7c	11ed7815-8efa-4e72-a932-aea9f00e3d4f	Data Granularity	N/A	a3266bee-bdda-48d2-98a5-01ed1b497d38	6638907e-a46e-4ea4-8c0b-c0b494b1da7c	active	\N	2014-06-19 04:46:27.182281	9999-12-31 00:00:00	t
6ae5ebbb-3480-495d-8d81-f1fec438b589	e0f40ff2-8ba2-43dd-a129-84e7c19e654c	Update Frequency	Monthly	72e94ea0-5f49-4a3b-b3d4-d9079ec80e00	6ae5ebbb-3480-495d-8d81-f1fec438b589	active	\N	2014-06-17 06:39:37.846746	9999-12-31 00:00:00	t
7b567e50-4bc8-4284-b0d6-4062321e5666	e0f40ff2-8ba2-43dd-a129-84e7c19e654c	Temporal Coverage	Current	72e94ea0-5f49-4a3b-b3d4-d9079ec80e00	7b567e50-4bc8-4284-b0d6-4062321e5666	active	\N	2014-06-17 06:39:37.846746	9999-12-31 00:00:00	t
2d301d13-69f3-41a4-a084-de4136baeb48	e0f40ff2-8ba2-43dd-a129-84e7c19e654c	Geospatial Coverage	South Australia	72e94ea0-5f49-4a3b-b3d4-d9079ec80e00	2d301d13-69f3-41a4-a084-de4136baeb48	active	\N	2014-06-17 06:39:37.846746	9999-12-31 00:00:00	t
2c25676a-ff17-4da9-a34a-c59625a498dc	e0f40ff2-8ba2-43dd-a129-84e7c19e654c	Data Granularity	Data is typically updated on a catchment, basin or administrative region basis and frequency ranges from annually for high rainfall areas through to five yearly or more for arid regions.	72e94ea0-5f49-4a3b-b3d4-d9079ec80e00	2c25676a-ff17-4da9-a34a-c59625a498dc	active	\N	2014-06-17 06:39:37.846746	9999-12-31 00:00:00	t
a1d37d96-f460-4c03-b150-2be906fa042e	35381991-7dc3-42cc-b742-1c8dedc3dfa0	Last Update 	December 2011	45a52d25-77ec-4123-90d4-0fdc413e55c8	a1d37d96-f460-4c03-b150-2be906fa042e	active	\N	2014-06-18 01:37:37.855439	9999-12-31 00:00:00	t
a5b6e9a8-2f24-42f7-bc3b-93bd2d62b677	167684de-6a7a-4957-9bb7-b14c26660127	Geospatial Coverage	South Australia	108045d3-b7cb-4b45-80bc-3081d22bae03	a5b6e9a8-2f24-42f7-bc3b-93bd2d62b677	active	\N	2014-06-19 05:05:51.220713	9999-12-31 00:00:00	t
f824eb22-ca2d-4327-9ff8-ad288d9faf0f	921d83cc-bf41-48da-9781-07a8af8e3007	Temporal Coverage	Current	08b7a777-34f9-48ff-94f7-117c81327a5b	f824eb22-ca2d-4327-9ff8-ad288d9faf0f	active	\N	2014-06-18 04:21:28.780399	9999-12-31 00:00:00	t
cb5385b3-bd4e-4902-992f-d1ef2b698791	921d83cc-bf41-48da-9781-07a8af8e3007	Last Updated 	2009	08b7a777-34f9-48ff-94f7-117c81327a5b	cb5385b3-bd4e-4902-992f-d1ef2b698791	deleted	\N	2014-06-18 04:21:28.780399	9999-12-31 00:00:00	t
47ea8b8a-61f2-459b-9875-b41cd82c12d8	921d83cc-bf41-48da-9781-07a8af8e3007	Update Frequency		08b7a777-34f9-48ff-94f7-117c81327a5b	47ea8b8a-61f2-459b-9875-b41cd82c12d8	active	\N	2014-06-18 04:21:28.780399	9999-12-31 00:00:00	t
17470235-9706-41ab-b69c-dec2c425e39a	167684de-6a7a-4957-9bb7-b14c26660127	Temporal Coverage	1815-1951	108045d3-b7cb-4b45-80bc-3081d22bae03	17470235-9706-41ab-b69c-dec2c425e39a	active	\N	2014-06-19 05:05:51.220713	9999-12-31 00:00:00	t
55c7463d-7777-4b55-95e2-203744debccb	868db81d-021c-4aed-994b-403e29afdd43	Refresh Frequency	Ad Hoc	9c9dfbea-1088-4df3-9acd-6d0ba3596415	55c7463d-7777-4b55-95e2-203744debccb	deleted	\N	2014-06-18 05:01:38.509464	9999-12-31 00:00:00	t
a263556d-ae94-49c9-972e-b107641ffc62	167684de-6a7a-4957-9bb7-b14c26660127	Update Frequency	Once off	108045d3-b7cb-4b45-80bc-3081d22bae03	a263556d-ae94-49c9-972e-b107641ffc62	active	\N	2014-06-19 05:05:51.220713	9999-12-31 00:00:00	t
7c5332d2-4d68-43a4-bdf2-a43eeef1a99e	f33c5b36-a450-4755-837c-6e0cf289e20e	Update Frequency	Ad-hoc	12d276d8-8635-4fcc-acae-88a8c78977ed	7c5332d2-4d68-43a4-bdf2-a43eeef1a99e	active	\N	2014-06-18 05:53:11.476447	9999-12-31 00:00:00	t
e90f6206-c7a8-4626-91c9-c5fefa1a7881	f33c5b36-a450-4755-837c-6e0cf289e20e	Last Updated	2007	12d276d8-8635-4fcc-acae-88a8c78977ed	e90f6206-c7a8-4626-91c9-c5fefa1a7881	deleted	\N	2014-06-18 05:53:11.476447	9999-12-31 00:00:00	t
804028bd-ee84-41e4-b755-29b302165b2f	6c32ef31-aa23-4377-926b-bb9fa4038f89	Update Frequency	Ad-hoc	4c0aa4b8-c456-4214-b48c-d88ae4da051b	804028bd-ee84-41e4-b755-29b302165b2f	active	\N	2014-06-18 05:54:06.165701	9999-12-31 00:00:00	t
4349c3e3-88f5-40da-b70f-540855385e57	6c32ef31-aa23-4377-926b-bb9fa4038f89	Last Updated	2001	4c0aa4b8-c456-4214-b48c-d88ae4da051b	4349c3e3-88f5-40da-b70f-540855385e57	deleted	\N	2014-06-18 05:54:06.165701	9999-12-31 00:00:00	t
0214c2c9-7741-44d6-8754-e87bd852b4ca	3666bf95-528f-4cef-a955-1e35a89855a9	Refresh Frequency	Ad Hoc	f1e62db9-3b99-44a4-8c46-9d472b53e169	0214c2c9-7741-44d6-8754-e87bd852b4ca	deleted	\N	2014-06-18 05:55:36.905413	9999-12-31 00:00:00	t
3e234bee-39bd-4b02-b8ce-17aaf649f151	3666bf95-528f-4cef-a955-1e35a89855a9	Update Frequency	Ad Hoc	f1e62db9-3b99-44a4-8c46-9d472b53e169	3e234bee-39bd-4b02-b8ce-17aaf649f151	active	\N	2014-06-18 05:55:36.905413	9999-12-31 00:00:00	t
624a239f-7978-4152-a2f1-fc6b9e4564eb	978b650a-ba51-48d2-87c2-7ad20892f4ec	Last Updated	May 2011	52931619-548a-4717-8362-edc322d35028	624a239f-7978-4152-a2f1-fc6b9e4564eb	active	\N	2014-06-18 06:04:00.831091	9999-12-31 00:00:00	t
110715a0-ccb1-4387-9512-cca4b259763a	167684de-6a7a-4957-9bb7-b14c26660127	Data Granularity	N/A	108045d3-b7cb-4b45-80bc-3081d22bae03	110715a0-ccb1-4387-9512-cca4b259763a	active	\N	2014-06-19 05:05:51.220713	9999-12-31 00:00:00	t
1f10dea4-4173-44f5-bc02-214d47d5bba8	0c085f98-5cc4-41f0-9eb9-5be42df73cdb	Temporal Coverage	2013	5c259e90-bff5-477d-af6e-083ee44adcc4	1f10dea4-4173-44f5-bc02-214d47d5bba8	active	\N	2014-06-22 15:50:13.122743	9999-12-31 00:00:00	t
0d66c034-0220-4023-a521-2bdfb1417064	0c085f98-5cc4-41f0-9eb9-5be42df73cdb	Update Frequency	Annually	5c259e90-bff5-477d-af6e-083ee44adcc4	0d66c034-0220-4023-a521-2bdfb1417064	active	\N	2014-06-22 15:50:13.122743	9999-12-31 00:00:00	t
474b4a15-bf8d-4eba-8cdc-dd52e01761ac	0c085f98-5cc4-41f0-9eb9-5be42df73cdb	Data Granularity	10 minute averaged data	5c259e90-bff5-477d-af6e-083ee44adcc4	474b4a15-bf8d-4eba-8cdc-dd52e01761ac	active	\N	2014-06-22 15:50:13.122743	9999-12-31 00:00:00	t
06483133-989d-4cdd-a10a-e097dcee93df	8b8040ac-c71c-4c9b-b361-be84b4cd3dc6	Temporal Coverage	June 2014	5642f4c7-a7f6-446b-b1e5-ab78ab8a0f86	06483133-989d-4cdd-a10a-e097dcee93df	active	\N	2014-06-25 00:46:52.808633	9999-12-31 00:00:00	t
5e078d85-36c0-49dc-90f3-10d89e6311df	fdb37fa4-83e9-4daf-8ad0-66a63d8c7c88	Temporal Coverage	1815-1951	7b803e1c-7772-4f94-95b9-4cdc004673cd	5e078d85-36c0-49dc-90f3-10d89e6311df	active	\N	2014-06-19 05:15:17.630934	9999-12-31 00:00:00	t
b9c01fa7-c4cc-4b8a-8d9f-1f734c90b5d6	fdb37fa4-83e9-4daf-8ad0-66a63d8c7c88	Update Frequency	Once off	7b803e1c-7772-4f94-95b9-4cdc004673cd	b9c01fa7-c4cc-4b8a-8d9f-1f734c90b5d6	active	\N	2014-06-19 05:15:17.630934	9999-12-31 00:00:00	t
ef011169-d9a2-4ec0-9320-3bf8eac51624	fdb37fa4-83e9-4daf-8ad0-66a63d8c7c88	Geospatial Coverage	South Australia	7b803e1c-7772-4f94-95b9-4cdc004673cd	ef011169-d9a2-4ec0-9320-3bf8eac51624	active	\N	2014-06-19 05:15:17.630934	9999-12-31 00:00:00	t
1217f24a-6e68-4262-be05-fdb9bfbc66b5	fdb37fa4-83e9-4daf-8ad0-66a63d8c7c88	Data Granularity	N/A	7b803e1c-7772-4f94-95b9-4cdc004673cd	1217f24a-6e68-4262-be05-fdb9bfbc66b5	active	\N	2014-06-19 05:15:17.630934	9999-12-31 00:00:00	t
bca68360-6982-486e-8a50-850c9532d507	70a74bde-2be4-4e1c-92b8-7c2e8be53e20	Update Frequency	Once off	2e703f0b-00bf-4fde-876a-a55e1d19a42c	bca68360-6982-486e-8a50-850c9532d507	active	\N	2014-06-19 05:24:21.463472	9999-12-31 00:00:00	t
09b7a613-01bb-4653-9246-80683ed89dac	70a74bde-2be4-4e1c-92b8-7c2e8be53e20	Geospatial Coverage	South Australia	2e703f0b-00bf-4fde-876a-a55e1d19a42c	09b7a613-01bb-4653-9246-80683ed89dac	active	\N	2014-06-19 05:24:21.463472	9999-12-31 00:00:00	t
c8399417-dd45-4ffb-9cec-ee960447d15d	70a74bde-2be4-4e1c-92b8-7c2e8be53e20	Temporal Coverage	1846-1975	2e703f0b-00bf-4fde-876a-a55e1d19a42c	c8399417-dd45-4ffb-9cec-ee960447d15d	active	\N	2014-06-19 05:24:21.463472	9999-12-31 00:00:00	t
bf8f52b3-28c6-44d1-ab75-3c7ca2b9cb80	70a74bde-2be4-4e1c-92b8-7c2e8be53e20	Data Granularity	N/A	2e703f0b-00bf-4fde-876a-a55e1d19a42c	bf8f52b3-28c6-44d1-ab75-3c7ca2b9cb80	active	\N	2014-06-19 05:24:21.463472	9999-12-31 00:00:00	t
7baceb98-1664-4991-8bb3-39b871ad8ab2	02ae1642-b8cc-4c98-a7d7-6e2c7e1ec7cb	Data Granularity	N/A	1042da93-8381-49f1-a691-14e2f3f40f6a	7baceb98-1664-4991-8bb3-39b871ad8ab2	active	\N	2014-06-19 05:32:36.351799	9999-12-31 00:00:00	t
bf2409a6-f72c-4173-9330-cb3ebccd471d	02ae1642-b8cc-4c98-a7d7-6e2c7e1ec7cb	Geospatial Coverage	Murray Bridge	1042da93-8381-49f1-a691-14e2f3f40f6a	bf2409a6-f72c-4173-9330-cb3ebccd471d	active	\N	2014-06-19 05:32:36.351799	9999-12-31 00:00:00	t
5f6493f9-f3ef-4ad7-96f3-3d8aeadecbce	02ae1642-b8cc-4c98-a7d7-6e2c7e1ec7cb	Temporal Coverage	1870-1975	1042da93-8381-49f1-a691-14e2f3f40f6a	5f6493f9-f3ef-4ad7-96f3-3d8aeadecbce	active	\N	2014-06-19 05:32:36.351799	9999-12-31 00:00:00	t
9e0fc6b0-4b0f-4707-a3ad-946b749f41c3	02ae1642-b8cc-4c98-a7d7-6e2c7e1ec7cb	Update Frequency	Once off	1042da93-8381-49f1-a691-14e2f3f40f6a	9e0fc6b0-4b0f-4707-a3ad-946b749f41c3	active	\N	2014-06-19 05:32:36.351799	9999-12-31 00:00:00	t
b4ec17ee-2a2f-47a5-846f-dc1ed00c5c80	2b0e3d83-159f-4118-a7e2-9612367372ed	Temporal Coverage	1846-1966	e8fb61f3-795d-47e3-bca7-f2c9a9a83857	b4ec17ee-2a2f-47a5-846f-dc1ed00c5c80	active	\N	2014-06-19 06:47:28.632458	9999-12-31 00:00:00	t
916a9ab6-d23f-4c49-82dd-630e24365338	2b0e3d83-159f-4118-a7e2-9612367372ed	Geospatial Coverage	Adelaide	e8fb61f3-795d-47e3-bca7-f2c9a9a83857	916a9ab6-d23f-4c49-82dd-630e24365338	active	\N	2014-06-19 06:47:28.632458	9999-12-31 00:00:00	t
0a165bea-7b46-485b-9496-8dbfd365ef36	2b0e3d83-159f-4118-a7e2-9612367372ed	Update Frequency	Ad-hoc	e8fb61f3-795d-47e3-bca7-f2c9a9a83857	0a165bea-7b46-485b-9496-8dbfd365ef36	active	\N	2014-06-19 06:47:28.632458	9999-12-31 00:00:00	t
e4e94956-0ed5-4c41-a389-9c7acaff23a3	2b0e3d83-159f-4118-a7e2-9612367372ed	Data Granularity	N/A	e8fb61f3-795d-47e3-bca7-f2c9a9a83857	e4e94956-0ed5-4c41-a389-9c7acaff23a3	active	\N	2014-06-19 06:47:28.632458	9999-12-31 00:00:00	t
3b007100-4559-46d4-b93b-681fd0250726	a8332257-a1db-47f6-a138-930b715f57d4	Temporal Coverage	2012-2013	5cd8a610-cfb4-4875-ac2c-19eabacb738c	3b007100-4559-46d4-b93b-681fd0250726	active	\N	2014-06-20 02:22:29.632704	9999-12-31 00:00:00	t
be709483-fce6-4493-b4b7-cb6dfa609e56	a8332257-a1db-47f6-a138-930b715f57d4	Data Granularity	Annual facility data provided to Commonwealth and reviewed by SA EPA	5cd8a610-cfb4-4875-ac2c-19eabacb738c	be709483-fce6-4493-b4b7-cb6dfa609e56	active	\N	2014-06-20 02:22:29.632704	9999-12-31 00:00:00	t
a408e430-5308-47f4-be1b-b1bced18bcb4	a8332257-a1db-47f6-a138-930b715f57d4	Geospatial Coverage	South Australia	5cd8a610-cfb4-4875-ac2c-19eabacb738c	a408e430-5308-47f4-be1b-b1bced18bcb4	active	\N	2014-06-20 02:22:29.632704	9999-12-31 00:00:00	t
e2abb82f-c457-4d6a-891e-a40e82624c71	a8332257-a1db-47f6-a138-930b715f57d4	Update Frequency	Annually	5cd8a610-cfb4-4875-ac2c-19eabacb738c	e2abb82f-c457-4d6a-891e-a40e82624c71	active	\N	2014-06-20 02:22:29.632704	9999-12-31 00:00:00	t
2eda0740-bc47-48c4-ab3b-44cb527f6cf5	05994de3-25c2-4378-bb0a-62e02097d130	Temporal Coverage	2012-13	4ae6b6f2-106f-4a8b-b365-b50d67a20b95	2eda0740-bc47-48c4-ab3b-44cb527f6cf5	active	\N	2014-06-20 02:58:19.439314	9999-12-31 00:00:00	t
e270fb0d-f548-42bf-a94f-3b74382f928c	05994de3-25c2-4378-bb0a-62e02097d130	Update Frequency	Annually	4ae6b6f2-106f-4a8b-b365-b50d67a20b95	e270fb0d-f548-42bf-a94f-3b74382f928c	active	\N	2014-06-20 02:58:19.439314	9999-12-31 00:00:00	t
8821b569-0bfa-4d40-941e-b6363ec245ef	05994de3-25c2-4378-bb0a-62e02097d130	Geospatial Coverage	Australia & South Australia	4ae6b6f2-106f-4a8b-b365-b50d67a20b95	8821b569-0bfa-4d40-941e-b6363ec245ef	active	\N	2014-06-20 02:58:19.439314	9999-12-31 00:00:00	t
d85501ef-7940-4a5f-86b6-86f4b3b2253b	05994de3-25c2-4378-bb0a-62e02097d130	Data Granularity	AHECC 8 digit trade data	4ae6b6f2-106f-4a8b-b365-b50d67a20b95	d85501ef-7940-4a5f-86b6-86f4b3b2253b	active	\N	2014-06-20 02:58:19.439314	9999-12-31 00:00:00	t
0dbd2273-e845-4d22-b0a0-24cf17142d5e	c1a77b0e-84df-4ac7-9f4d-bf1f6b92d265	Update Frequency	Annually	7d610700-af7d-4c4d-9009-33ef31086254	0dbd2273-e845-4d22-b0a0-24cf17142d5e	active	\N	2014-06-20 03:17:39.926271	9999-12-31 00:00:00	t
d69e8bb9-aae6-4dda-82c8-758fe9a316f8	c1a77b0e-84df-4ac7-9f4d-bf1f6b92d265	Temporal Coverage	2003 to 2013	7d610700-af7d-4c4d-9009-33ef31086254	d69e8bb9-aae6-4dda-82c8-758fe9a316f8	active	\N	2014-06-20 03:17:39.926271	9999-12-31 00:00:00	t
0f03e4f9-372b-4993-974e-bac52c2d55e9	c1a77b0e-84df-4ac7-9f4d-bf1f6b92d265	Data Granularity	Breakdowns by age, sex and other demographic variables	7d610700-af7d-4c4d-9009-33ef31086254	0f03e4f9-372b-4993-974e-bac52c2d55e9	active	\N	2014-06-20 03:17:39.926271	9999-12-31 00:00:00	t
7157f5cc-dae9-42bf-9bea-967df1c637d1	c1a77b0e-84df-4ac7-9f4d-bf1f6b92d265	Geospatial Coverage	State as a whole, and large geographical areas such as Local Health Networks and Medicare Locals	7d610700-af7d-4c4d-9009-33ef31086254	7157f5cc-dae9-42bf-9bea-967df1c637d1	active	\N	2014-06-20 03:17:39.926271	9999-12-31 00:00:00	t
271d16b7-335d-47d9-b571-62279e10e0fe	19e266ca-9ad1-481d-b8a3-3fcd714be326	Update Frequency	Daily	9a06880a-85e7-4e59-b381-502162d17339	271d16b7-335d-47d9-b571-62279e10e0fe	active	\N	2014-06-26 06:26:02.042267	9999-12-31 00:00:00	t
aef73a01-0271-4747-b977-0d03e87c41d0	1d753d8e-99b0-4619-932c-b0d05bd02975	Update Frequency	Daily	3ff14bd8-cbfd-4171-8f09-5fb468da0bbd	aef73a01-0271-4747-b977-0d03e87c41d0	active	\N	2014-06-27 02:50:38.421223	9999-12-31 00:00:00	t
b450fdda-a1d0-428a-bfe6-b40db9f92b93	4f0afb46-fbf9-4462-b21b-3229da6bd525	Data Status	Active	678dbd26-76dc-41b2-97c2-9b1c7d44d42a	b450fdda-a1d0-428a-bfe6-b40db9f92b93	active	\N	2014-06-27 08:07:39.133805	9999-12-31 00:00:00	t
c431ccec-93df-4898-9b67-fda15c1fa456	4f0afb46-fbf9-4462-b21b-3229da6bd525	Geospatial Coverage	South Australia	678dbd26-76dc-41b2-97c2-9b1c7d44d42a	c431ccec-93df-4898-9b67-fda15c1fa456	active	\N	2014-06-27 08:07:39.133805	9999-12-31 00:00:00	t
ffb4b92a-78b8-4d3a-8b30-c995984f852d	a9077319-d3b7-4f52-b9b7-04cb786ccca1	Update Frequency	Once off	d0cf0cd3-85cf-408c-adbf-67329b41e112	ffb4b92a-78b8-4d3a-8b30-c995984f852d	active	\N	2014-06-20 03:25:56.190081	9999-12-31 00:00:00	t
9c8c1a0d-a33b-45c8-8cd6-8c5c274a3b91	a9077319-d3b7-4f52-b9b7-04cb786ccca1	Temporal Coverage	2013	d0cf0cd3-85cf-408c-adbf-67329b41e112	9c8c1a0d-a33b-45c8-8cd6-8c5c274a3b91	active	\N	2014-06-20 03:25:56.190081	9999-12-31 00:00:00	t
77632ddc-f33e-4c82-816d-f8d82a2ba92f	a9077319-d3b7-4f52-b9b7-04cb786ccca1	Data Granularity	Monthly	d0cf0cd3-85cf-408c-adbf-67329b41e112	77632ddc-f33e-4c82-816d-f8d82a2ba92f	active	\N	2014-06-20 03:25:56.190081	9999-12-31 00:00:00	t
44321cc9-e708-412f-82e6-2d24e2a76f28	a9077319-d3b7-4f52-b9b7-04cb786ccca1	Geospatial Coverage	N/A	d0cf0cd3-85cf-408c-adbf-67329b41e112	44321cc9-e708-412f-82e6-2d24e2a76f28	active	\N	2014-06-20 03:25:56.190081	9999-12-31 00:00:00	t
58fd8314-7316-44be-8523-b3f81457adcb	7f64127e-792f-4d33-ba4d-9aa02c451c5a	Geospatial Coverage	Australia & South Australia	1e983a5f-9549-4917-b27e-9da9727a9581	58fd8314-7316-44be-8523-b3f81457adcb	active	\N	2014-06-20 06:57:12.444313	9999-12-31 00:00:00	t
3ce1e96b-0f27-4403-a797-0e3b2de64fd8	7f64127e-792f-4d33-ba4d-9aa02c451c5a	Update Frequency	Annually	1e983a5f-9549-4917-b27e-9da9727a9581	3ce1e96b-0f27-4403-a797-0e3b2de64fd8	active	\N	2014-06-20 06:57:12.444313	9999-12-31 00:00:00	t
fdec02cc-a4b1-4620-8171-63f57cc41560	7f64127e-792f-4d33-ba4d-9aa02c451c5a	Data Granularity	AHECC 8 digit trade data	1e983a5f-9549-4917-b27e-9da9727a9581	fdec02cc-a4b1-4620-8171-63f57cc41560	active	\N	2014-06-20 06:57:12.444313	9999-12-31 00:00:00	t
35b9ba08-8422-4803-be53-0f44d2dd289f	063ff486-6828-41f0-a814-0901137d0923	Data Granularity	AHECC 8 digit trade data	9236ea58-f52d-4461-a91e-b240e5e0dc08	35b9ba08-8422-4803-be53-0f44d2dd289f	active	\N	2014-06-20 07:03:47.740463	9999-12-31 00:00:00	t
9040359c-e9e5-441e-82da-d194a4715163	063ff486-6828-41f0-a814-0901137d0923	Geospatial Coverage	Australia & South Australia	9236ea58-f52d-4461-a91e-b240e5e0dc08	9040359c-e9e5-441e-82da-d194a4715163	active	\N	2014-06-20 07:03:47.740463	9999-12-31 00:00:00	t
ee20d848-aaa7-4464-9bab-b5ab206473e4	063ff486-6828-41f0-a814-0901137d0923	Temporal Coverage	2009-10	9236ea58-f52d-4461-a91e-b240e5e0dc08	ee20d848-aaa7-4464-9bab-b5ab206473e4	active	\N	2014-06-20 07:03:47.740463	9999-12-31 00:00:00	t
b42a977d-9394-4d15-9045-977ea447d6b3	063ff486-6828-41f0-a814-0901137d0923	Update Frequency	Annually	9236ea58-f52d-4461-a91e-b240e5e0dc08	b42a977d-9394-4d15-9045-977ea447d6b3	active	\N	2014-06-20 07:03:47.740463	9999-12-31 00:00:00	t
bfb6ce58-34d6-4681-8d55-2e28dd27c1ef	dc662085-924d-4b6d-8043-8c6327f1caaa	Update Frequency	Annually	57ba1e31-98e4-4aa9-8800-224eb21c53e8	bfb6ce58-34d6-4681-8d55-2e28dd27c1ef	active	\N	2014-06-20 07:20:29.392593	9999-12-31 00:00:00	t
2e230867-62c7-4888-81b4-6b7413b8cc55	dc662085-924d-4b6d-8043-8c6327f1caaa	Data Granularity	AHECC 8 digit trade data	57ba1e31-98e4-4aa9-8800-224eb21c53e8	2e230867-62c7-4888-81b4-6b7413b8cc55	active	\N	2014-06-20 07:20:29.392593	9999-12-31 00:00:00	t
4eab1c01-5670-457c-8cf1-a3f062adfe0c	dc662085-924d-4b6d-8043-8c6327f1caaa	Geospatial Coverage	Australia & South Australia	57ba1e31-98e4-4aa9-8800-224eb21c53e8	4eab1c01-5670-457c-8cf1-a3f062adfe0c	active	\N	2014-06-20 07:20:29.392593	9999-12-31 00:00:00	t
4ee93292-e445-45cd-8475-6a25e95db0d1	dc662085-924d-4b6d-8043-8c6327f1caaa	Temporal Coverage	2010-11	57ba1e31-98e4-4aa9-8800-224eb21c53e8	4ee93292-e445-45cd-8475-6a25e95db0d1	active	\N	2014-06-20 07:20:29.392593	9999-12-31 00:00:00	t
e8bb6191-008b-4b80-a5b4-a016e7454ea4	f1b1cd4f-4d2d-416b-94d2-9695474f8a44	Data Granularity	AHECC 8 digit trade data	6e299be4-ab7a-4e4f-a2c9-b7ce2604f869	e8bb6191-008b-4b80-a5b4-a016e7454ea4	active	\N	2014-06-20 07:27:47.338529	9999-12-31 00:00:00	t
a68778b1-53b2-4c09-a675-c8ee978ae43c	f1b1cd4f-4d2d-416b-94d2-9695474f8a44	Geospatial Coverage	Australia & South Australia	6e299be4-ab7a-4e4f-a2c9-b7ce2604f869	a68778b1-53b2-4c09-a675-c8ee978ae43c	active	\N	2014-06-20 07:27:47.338529	9999-12-31 00:00:00	t
394d6e84-6568-4399-b484-9b1dbf45ee23	f1b1cd4f-4d2d-416b-94d2-9695474f8a44	Temporal Coverage	2011-12	6e299be4-ab7a-4e4f-a2c9-b7ce2604f869	394d6e84-6568-4399-b484-9b1dbf45ee23	active	\N	2014-06-20 07:27:47.338529	9999-12-31 00:00:00	t
8b0cf2c7-d6df-47da-b8e1-f919a133caa7	f1b1cd4f-4d2d-416b-94d2-9695474f8a44	Update Frequency	Annually	6e299be4-ab7a-4e4f-a2c9-b7ce2604f869	8b0cf2c7-d6df-47da-b8e1-f919a133caa7	active	\N	2014-06-20 07:27:47.338529	9999-12-31 00:00:00	t
771df584-99f1-4189-b744-bf8b1ac6425d	7f64127e-792f-4d33-ba4d-9aa02c451c5a	Temporal Coverage	2008-09	ca74a4f1-c185-4693-8586-6533f7ba9634	771df584-99f1-4189-b744-bf8b1ac6425d	active	\N	2014-06-20 07:28:49.782133	9999-12-31 00:00:00	t
771df584-99f1-4189-b744-bf8b1ac6425d	7f64127e-792f-4d33-ba4d-9aa02c451c5a	Temporal Coverage	2008-08	1e983a5f-9549-4917-b27e-9da9727a9581	771df584-99f1-4189-b744-bf8b1ac6425d	active	ca74a4f1-c185-4693-8586-6533f7ba9634	2014-06-20 06:57:12.444313	2014-06-20 07:28:49.782133	f
9704eb0d-7bf8-4913-ac54-98100eb28cfd	75621bd4-10a8-4dc8-bbd1-0b2ac316615b	Data Granularity		78706af2-5b43-47bb-96cd-30f33b13fa50	9704eb0d-7bf8-4913-ac54-98100eb28cfd	active	\N	2014-06-22 09:24:31.007264	9999-12-31 00:00:00	t
e62b8706-3634-48cc-bebf-fd1a48e0adec	75621bd4-10a8-4dc8-bbd1-0b2ac316615b	Update Frequency	As changed by agreement between the Minister for Education and schools	78706af2-5b43-47bb-96cd-30f33b13fa50	e62b8706-3634-48cc-bebf-fd1a48e0adec	active	\N	2014-06-22 09:24:31.007264	9999-12-31 00:00:00	t
e8492feb-c8c5-4c33-8126-4cbdb9f0ebd1	75621bd4-10a8-4dc8-bbd1-0b2ac316615b	Geospatial Coverage	South Australia – Projection GDA94	78706af2-5b43-47bb-96cd-30f33b13fa50	e8492feb-c8c5-4c33-8126-4cbdb9f0ebd1	active	\N	2014-06-22 09:24:31.007264	9999-12-31 00:00:00	t
430d256f-6f46-4eda-adcf-9c9ed32ea6f1	75621bd4-10a8-4dc8-bbd1-0b2ac316615b	Temporal Coverage	Current unless otherwise indicated by the name of the file e.g. 2015, 2014	78706af2-5b43-47bb-96cd-30f33b13fa50	430d256f-6f46-4eda-adcf-9c9ed32ea6f1	active	\N	2014-06-22 09:24:31.007264	9999-12-31 00:00:00	t
3effc5e9-0cab-44ad-926b-51e6c80043dc	615badd8-2946-4e1a-ae63-92fba8f2ee1e	Geospatial Coverage	South Australia	5bd3fb7c-7192-4c35-8ad6-730c7dd40f9c	3effc5e9-0cab-44ad-926b-51e6c80043dc	active	\N	2014-06-22 09:36:14.435617	9999-12-31 00:00:00	t
aa10b064-0082-4d31-b6ea-38ffdf6b6568	615badd8-2946-4e1a-ae63-92fba8f2ee1e	Data Granularity	Individual site level	5bd3fb7c-7192-4c35-8ad6-730c7dd40f9c	aa10b064-0082-4d31-b6ea-38ffdf6b6568	active	\N	2014-06-22 09:36:14.435617	9999-12-31 00:00:00	t
fbc56c16-5049-4311-8149-a29fedc9209f	615badd8-2946-4e1a-ae63-92fba8f2ee1e	Update Frequency	Annually	5bd3fb7c-7192-4c35-8ad6-730c7dd40f9c	fbc56c16-5049-4311-8149-a29fedc9209f	active	\N	2014-06-22 09:36:14.435617	9999-12-31 00:00:00	t
e948e69c-fc0c-44a4-994b-719cb029497a	615badd8-2946-4e1a-ae63-92fba8f2ee1e	Temporal Coverage	as at 31 March 2014	5bd3fb7c-7192-4c35-8ad6-730c7dd40f9c	e948e69c-fc0c-44a4-994b-719cb029497a	active	\N	2014-06-22 09:36:14.435617	9999-12-31 00:00:00	t
4e9bfad7-dc80-4459-ac66-04428a527803	4f9cce24-1ed0-40cb-9e9b-bd49ad8b17cf	Data Granularity	N/A	68605461-2aa4-45a3-a56e-e670ce6062e8	4e9bfad7-dc80-4459-ac66-04428a527803	active	\N	2014-07-01 05:33:37.826652	9999-12-31 00:00:00	t
2d194548-04d9-46c2-84a0-78c0510686fe	a29987d5-d3ac-4935-90c3-6871cbdbafde	Temporal Coverage	2013	d07eda54-c4da-4491-9e24-7619739431d9	2d194548-04d9-46c2-84a0-78c0510686fe	active	\N	2014-06-22 15:58:16.51222	9999-12-31 00:00:00	t
c153870e-71ec-408d-b09b-8495431588ea	a29987d5-d3ac-4935-90c3-6871cbdbafde	Data Granularity	10 minute averaged data	d07eda54-c4da-4491-9e24-7619739431d9	c153870e-71ec-408d-b09b-8495431588ea	active	\N	2014-06-22 15:58:16.51222	9999-12-31 00:00:00	t
9c940b4e-50b6-462e-86e6-aa42480d8719	a29987d5-d3ac-4935-90c3-6871cbdbafde	Data Location	Hosted	d07eda54-c4da-4491-9e24-7619739431d9	9c940b4e-50b6-462e-86e6-aa42480d8719	active	\N	2014-06-22 15:58:16.51222	9999-12-31 00:00:00	t
7c80ac19-c940-47a2-8fd4-6cf602b19c31	26c9ae64-e71d-425d-83d3-0a300e8d9430	Temporal Coverage	Friday 2 August, 2013	2a73de53-38d8-4d91-8f49-e96866af5b64	7c80ac19-c940-47a2-8fd4-6cf602b19c31	active	\N	2014-06-22 09:45:10.366025	9999-12-31 00:00:00	t
3b18e4b4-d3ac-4aec-ae1a-3818a6a3b7fb	26c9ae64-e71d-425d-83d3-0a300e8d9430	Geospatial Coverage	South Australia	2a73de53-38d8-4d91-8f49-e96866af5b64	3b18e4b4-d3ac-4aec-ae1a-3818a6a3b7fb	active	\N	2014-06-22 09:45:10.366025	9999-12-31 00:00:00	t
ae690633-f62a-404e-aae6-737060882892	26c9ae64-e71d-425d-83d3-0a300e8d9430	Update Frequency	Annually	2a73de53-38d8-4d91-8f49-e96866af5b64	ae690633-f62a-404e-aae6-737060882892	active	\N	2014-06-22 09:45:10.366025	9999-12-31 00:00:00	t
7da58192-8e8a-4b04-959b-5cefc00d340c	26c9ae64-e71d-425d-83d3-0a300e8d9430	Data Granularity	Data is a snapshot of the First Friday in August each year. 	2a73de53-38d8-4d91-8f49-e96866af5b64	7da58192-8e8a-4b04-959b-5cefc00d340c	active	\N	2014-06-22 09:45:10.366025	9999-12-31 00:00:00	t
a49d3967-1b23-4f7c-af9a-75277407aa3b	a29987d5-d3ac-4935-90c3-6871cbdbafde	Geospatial Coverage	Spencer Gulf Region	d07eda54-c4da-4491-9e24-7619739431d9	a49d3967-1b23-4f7c-af9a-75277407aa3b	active	\N	2014-06-22 15:58:16.51222	9999-12-31 00:00:00	t
abd75ef2-0a44-4bc2-9403-2484a450cb4d	a29987d5-d3ac-4935-90c3-6871cbdbafde	Update Frequency	Annually	d07eda54-c4da-4491-9e24-7619739431d9	abd75ef2-0a44-4bc2-9403-2484a450cb4d	active	\N	2014-06-22 15:58:16.51222	9999-12-31 00:00:00	t
c413fab0-35c7-4fd0-a90e-4c20ce19a727	8b8040ac-c71c-4c9b-b361-be84b4cd3dc6	Update Frequency	Monthly	5642f4c7-a7f6-446b-b1e5-ab78ab8a0f86	c413fab0-35c7-4fd0-a90e-4c20ce19a727	active	\N	2014-06-25 00:46:52.808633	9999-12-31 00:00:00	t
96458146-3eb0-43f4-a764-7a795e4c47d3	8b8040ac-c71c-4c9b-b361-be84b4cd3dc6	Geospatial Coverage	City of Adelaide	5642f4c7-a7f6-446b-b1e5-ab78ab8a0f86	96458146-3eb0-43f4-a764-7a795e4c47d3	active	\N	2014-06-25 00:46:52.808633	9999-12-31 00:00:00	t
e34b5d11-0eb4-4e9c-9e98-526d7c50542b	6beff3e5-897c-40b4-967a-49e4b6d531d6	Geospatial Coverage	South Australia	51de0c8a-dfe0-424a-98db-d9e1a9275358	e34b5d11-0eb4-4e9c-9e98-526d7c50542b	active	\N	2014-06-22 09:57:59.939662	9999-12-31 00:00:00	t
4e677e40-39f2-4bc6-8de7-7d251ee9a681	6beff3e5-897c-40b4-967a-49e4b6d531d6	Temporal Coverage	2013	51de0c8a-dfe0-424a-98db-d9e1a9275358	4e677e40-39f2-4bc6-8de7-7d251ee9a681	active	\N	2014-06-22 09:57:59.939662	9999-12-31 00:00:00	t
c19cf399-b237-431f-adf6-625f290d4b97	6beff3e5-897c-40b4-967a-49e4b6d531d6	Update Frequency	Quarterly	51de0c8a-dfe0-424a-98db-d9e1a9275358	c19cf399-b237-431f-adf6-625f290d4b97	active	\N	2014-06-22 09:57:59.939662	9999-12-31 00:00:00	t
3f313e9e-54e4-40a2-aa3f-220f6f497d5e	6beff3e5-897c-40b4-967a-49e4b6d531d6	Data Granularity	Data is collected based on a 2 week reference period	51de0c8a-dfe0-424a-98db-d9e1a9275358	3f313e9e-54e4-40a2-aa3f-220f6f497d5e	active	\N	2014-06-22 09:57:59.939662	9999-12-31 00:00:00	t
21dae8a4-e2a8-43b5-9c52-164e69562b92	0aff4e2e-5599-46fa-ba22-dba13e07dcb1	Update Frequency	Daily	feff1a97-844e-4bef-a156-a4ad8d5306f9	21dae8a4-e2a8-43b5-9c52-164e69562b92	active	\N	2014-06-26 07:02:37.26006	9999-12-31 00:00:00	t
caff90f2-74ec-4776-8814-15662d4b6c19	4f9cce24-1ed0-40cb-9e9b-bd49ad8b17cf	Update Frequency	Annually	68605461-2aa4-45a3-a56e-e670ce6062e8	caff90f2-74ec-4776-8814-15662d4b6c19	active	\N	2014-07-01 05:33:37.826652	9999-12-31 00:00:00	t
1e304c08-8f32-45de-b295-c221c85ddc0e	b69f5a2f-c949-4dc8-9cf1-3f79a4271bf7	Update Frequency	API	73fed971-928a-4456-8231-9ce392d51eaa	1e304c08-8f32-45de-b295-c221c85ddc0e	active	\N	2014-06-25 01:05:00.613674	9999-12-31 00:00:00	t
4866065e-d9b9-4156-b093-ee6c90bbad35	b69f5a2f-c949-4dc8-9cf1-3f79a4271bf7	Geospatial Coverage	Statewide	73fed971-928a-4456-8231-9ce392d51eaa	4866065e-d9b9-4156-b093-ee6c90bbad35	active	\N	2014-06-25 01:05:00.613674	9999-12-31 00:00:00	t
37c65460-8dbc-4d5d-a26a-10bdbf30cddf	880ee9d8-15f2-4902-a024-f4dc106a2322	Data Location	Hosted	dc9dff2c-b06d-452e-971b-9671c87a4710	37c65460-8dbc-4d5d-a26a-10bdbf30cddf	active	\N	2014-06-25 03:27:16.38425	9999-12-31 00:00:00	t
f84f9c94-dcaa-401f-889d-723ec163a4c0	880ee9d8-15f2-4902-a024-f4dc106a2322	Data Granularity	Property Level	dc9dff2c-b06d-452e-971b-9671c87a4710	f84f9c94-dcaa-401f-889d-723ec163a4c0	active	\N	2014-06-25 03:27:16.38425	9999-12-31 00:00:00	t
f27f081a-ffbf-4d6b-8e2f-bc380a47bd6d	880ee9d8-15f2-4902-a024-f4dc106a2322	Update Frequency	Annually	dc9dff2c-b06d-452e-971b-9671c87a4710	f27f081a-ffbf-4d6b-8e2f-bc380a47bd6d	active	\N	2014-06-25 03:27:16.38425	9999-12-31 00:00:00	t
80c77251-1ec9-4a79-9459-379431577487	880ee9d8-15f2-4902-a024-f4dc106a2322	Temporal Coverage	2014	dc9dff2c-b06d-452e-971b-9671c87a4710	80c77251-1ec9-4a79-9459-379431577487	active	\N	2014-06-25 03:27:16.38425	9999-12-31 00:00:00	t
9d457292-42ce-4e13-b4a0-5172ad4bd890	880ee9d8-15f2-4902-a024-f4dc106a2322	Geospatial Coverage	South Australia	dc9dff2c-b06d-452e-971b-9671c87a4710	9d457292-42ce-4e13-b4a0-5172ad4bd890	active	\N	2014-06-25 03:27:16.38425	9999-12-31 00:00:00	t
3959be2a-71d9-4b4d-9ac4-92b120d7501f	e0f76a9c-1e75-4532-9990-2c7b10093612	Update Frequency	Daily	10d66b79-44d3-4336-b77c-1a6b7f7dc800	3959be2a-71d9-4b4d-9ac4-92b120d7501f	active	\N	2014-06-26 07:15:53.210912	9999-12-31 00:00:00	t
5eeea6c8-e82c-4dfd-80ae-89e8933e9604	515e3edb-9228-4c81-9015-51bb416bc349	Update Frequency	Daily	ddd6d5bd-8e1d-40fe-b969-d64b89451a5b	5eeea6c8-e82c-4dfd-80ae-89e8933e9604	active	\N	2014-06-26 07:21:13.108275	9999-12-31 00:00:00	t
2878134f-2434-4c5b-9c91-edaba4d4ea56	09630f9e-b9a9-48df-a28f-c5f6f3ca270e	Data Granularity	Property Level	a75f053d-3b42-4bd8-8dc7-d00e1570d9b5	2878134f-2434-4c5b-9c91-edaba4d4ea56	active	\N	2014-06-25 04:24:16.10803	9999-12-31 00:00:00	t
274e6236-000d-44fe-a105-10094ff8ed85	09630f9e-b9a9-48df-a28f-c5f6f3ca270e	Temporal Coverage	2014	a75f053d-3b42-4bd8-8dc7-d00e1570d9b5	274e6236-000d-44fe-a105-10094ff8ed85	active	\N	2014-06-25 04:24:16.10803	9999-12-31 00:00:00	t
0eebedcb-45bd-4907-934f-3071d71dbd4d	8d65c278-b1e0-44f2-8545-e908681fe2e4	Temporal Coverage	2013	415344ab-6b45-4068-a71c-d064f97c0e7c	0eebedcb-45bd-4907-934f-3071d71dbd4d	active	\N	2014-06-22 12:55:55.696966	9999-12-31 00:00:00	t
6ee07876-af6a-479e-a9a0-d4e997bb7631	8d65c278-b1e0-44f2-8545-e908681fe2e4	Update Frequency	Annually	415344ab-6b45-4068-a71c-d064f97c0e7c	6ee07876-af6a-479e-a9a0-d4e997bb7631	active	\N	2014-06-22 12:55:55.696966	9999-12-31 00:00:00	t
d16a7a76-0506-458b-a996-50742f7f25d7	8d65c278-b1e0-44f2-8545-e908681fe2e4	Data Granularity	10 minute averaged data	415344ab-6b45-4068-a71c-d064f97c0e7c	d16a7a76-0506-458b-a996-50742f7f25d7	active	\N	2014-06-22 12:55:55.696966	9999-12-31 00:00:00	t
a2d343b3-240b-47ca-a03d-3de7d506dd63	8d65c278-b1e0-44f2-8545-e908681fe2e4	Geospatial Coverage	North western  Adelaide Region	415344ab-6b45-4068-a71c-d064f97c0e7c	a2d343b3-240b-47ca-a03d-3de7d506dd63	active	\N	2014-06-22 12:55:55.696966	9999-12-31 00:00:00	t
aa9ac20b-ee51-4b0e-ba29-32f5dc78581c	4f9cce24-1ed0-40cb-9e9b-bd49ad8b17cf	Data Location	Linked	68605461-2aa4-45a3-a56e-e670ce6062e8	aa9ac20b-ee51-4b0e-ba29-32f5dc78581c	active	\N	2014-07-01 05:33:37.826652	9999-12-31 00:00:00	t
a6c7af46-e6f9-48d9-92ef-ced4776180fd	4f9cce24-1ed0-40cb-9e9b-bd49ad8b17cf	Data Status	N/A	68605461-2aa4-45a3-a56e-e670ce6062e8	a6c7af46-e6f9-48d9-92ef-ced4776180fd	active	\N	2014-07-01 05:33:37.826652	9999-12-31 00:00:00	t
52a2d72e-b709-4a01-b41b-492c9f88ae1d	c2b6d9a4-9b7e-42bd-9cba-856320e2e139	Data Granularity	N/A	a9b74787-a3ca-4d34-bf79-0d08673636a0	52a2d72e-b709-4a01-b41b-492c9f88ae1d	active	\N	2014-06-22 16:30:03.232772	9999-12-31 00:00:00	t
a2a3cd69-8b5d-4786-8b56-1e1c88afe206	c2b6d9a4-9b7e-42bd-9cba-856320e2e139	Update Frequency	Once-off	a9b74787-a3ca-4d34-bf79-0d08673636a0	a2a3cd69-8b5d-4786-8b56-1e1c88afe206	active	\N	2014-06-22 16:30:03.232772	9999-12-31 00:00:00	t
55e5d877-b9d0-4178-85b7-9f4be3d94177	4472c207-358b-4668-b6b9-3f7fd626ae75	Temporal Coverage	2013	c18dce26-6766-4d5f-8593-d3c5a29348dd	55e5d877-b9d0-4178-85b7-9f4be3d94177	active	\N	2014-06-22 13:06:12.782916	9999-12-31 00:00:00	t
a76d01d5-29ff-470b-810e-9990b794aeca	4472c207-358b-4668-b6b9-3f7fd626ae75	Geospatial Coverage	Southern  Adelaide Region	c18dce26-6766-4d5f-8593-d3c5a29348dd	a76d01d5-29ff-470b-810e-9990b794aeca	active	\N	2014-06-22 13:06:12.782916	9999-12-31 00:00:00	t
df2ca1f9-6fc8-4289-966f-0254bfb4430c	4472c207-358b-4668-b6b9-3f7fd626ae75	Update Frequency	Annually	c18dce26-6766-4d5f-8593-d3c5a29348dd	df2ca1f9-6fc8-4289-966f-0254bfb4430c	active	\N	2014-06-22 13:06:12.782916	9999-12-31 00:00:00	t
a1569ab5-833e-4967-a7c8-fd48ac127b47	4472c207-358b-4668-b6b9-3f7fd626ae75	Data Granularity	10 minute averaged data	c18dce26-6766-4d5f-8593-d3c5a29348dd	a1569ab5-833e-4967-a7c8-fd48ac127b47	active	\N	2014-06-22 13:06:12.782916	9999-12-31 00:00:00	t
937a0e81-f697-4d64-a9cd-13e34c0d9fe0	c2b6d9a4-9b7e-42bd-9cba-856320e2e139	Temporal Coverage	1911-1914	a9b74787-a3ca-4d34-bf79-0d08673636a0	937a0e81-f697-4d64-a9cd-13e34c0d9fe0	active	\N	2014-06-22 16:30:03.232772	9999-12-31 00:00:00	t
df53309f-3229-45a9-bc68-88354e3a6a33	8676857e-b031-4b67-9b86-bc2c92e7f4aa	Data Granularity	10 minute averaged data	7dd83df2-8106-4eab-b26a-c68f0d6216c9	df53309f-3229-45a9-bc68-88354e3a6a33	active	\N	2014-06-22 13:22:29.190132	9999-12-31 00:00:00	t
b080dd50-1dae-4f56-b4d3-5a7c0ef98e4e	8676857e-b031-4b67-9b86-bc2c92e7f4aa	Geospatial Coverage	Southern  Adelaide Region	7dd83df2-8106-4eab-b26a-c68f0d6216c9	b080dd50-1dae-4f56-b4d3-5a7c0ef98e4e	active	\N	2014-06-22 13:22:29.190132	9999-12-31 00:00:00	t
99825fee-44a1-4271-8a2d-335cd4e3b609	8676857e-b031-4b67-9b86-bc2c92e7f4aa	Temporal Coverage	2013	7dd83df2-8106-4eab-b26a-c68f0d6216c9	99825fee-44a1-4271-8a2d-335cd4e3b609	active	\N	2014-06-22 13:22:29.190132	9999-12-31 00:00:00	t
967492b3-8d61-43f7-892e-91daf7054d49	8676857e-b031-4b67-9b86-bc2c92e7f4aa	Update Frequency	Annually	7dd83df2-8106-4eab-b26a-c68f0d6216c9	967492b3-8d61-43f7-892e-91daf7054d49	active	\N	2014-06-22 13:22:29.190132	9999-12-31 00:00:00	t
cf9dec95-83f0-4520-bbe4-c6f5de2e94e4	1deb4bec-b83c-487a-a0d4-a0002e618068	Data Granularity	10 minute averaged data	291eb0b8-be1b-4311-b4b1-c4095ff8b153	cf9dec95-83f0-4520-bbe4-c6f5de2e94e4	active	\N	2014-06-22 13:33:52.093809	9999-12-31 00:00:00	t
03f8c99f-aca2-4960-80f5-2fccdf1a570f	1deb4bec-b83c-487a-a0d4-a0002e618068	Geospatial Coverage	Northern Adelaide Region	291eb0b8-be1b-4311-b4b1-c4095ff8b153	03f8c99f-aca2-4960-80f5-2fccdf1a570f	active	\N	2014-06-22 13:33:52.093809	9999-12-31 00:00:00	t
2210b153-703c-4700-abe4-2bb50415cf64	1deb4bec-b83c-487a-a0d4-a0002e618068	Update Frequency	Annually	291eb0b8-be1b-4311-b4b1-c4095ff8b153	2210b153-703c-4700-abe4-2bb50415cf64	active	\N	2014-06-22 13:33:52.093809	9999-12-31 00:00:00	t
eec8ce4b-5581-4890-98ff-99947ff6965b	1deb4bec-b83c-487a-a0d4-a0002e618068	Temporal Coverage	2013	291eb0b8-be1b-4311-b4b1-c4095ff8b153	eec8ce4b-5581-4890-98ff-99947ff6965b	active	\N	2014-06-22 13:33:52.093809	9999-12-31 00:00:00	t
5b9a0cd9-d444-4d93-82c1-a3d7f7f35f61	57f10148-cf98-47e0-9ed6-405c9d29545d	Temporal Coverage	2013	e6a48e8d-f122-4ceb-b33c-002c01e9a13f	5b9a0cd9-d444-4d93-82c1-a3d7f7f35f61	active	\N	2014-06-22 13:49:14.731001	9999-12-31 00:00:00	t
303f88d1-30f4-4a1f-a93f-8c59ecc13846	57f10148-cf98-47e0-9ed6-405c9d29545d	Geospatial Coverage	Northern Adelaide Region	e6a48e8d-f122-4ceb-b33c-002c01e9a13f	303f88d1-30f4-4a1f-a93f-8c59ecc13846	active	\N	2014-06-22 13:49:14.731001	9999-12-31 00:00:00	t
976b2242-c86b-4ef6-b90e-b09bc4de05d4	57f10148-cf98-47e0-9ed6-405c9d29545d	Data Granularity	10 minute averaged data	e6a48e8d-f122-4ceb-b33c-002c01e9a13f	976b2242-c86b-4ef6-b90e-b09bc4de05d4	active	\N	2014-06-22 13:49:14.731001	9999-12-31 00:00:00	t
930d385b-945d-4305-bf06-5c4d2987be36	57f10148-cf98-47e0-9ed6-405c9d29545d	Data Location	Hosted	e6a48e8d-f122-4ceb-b33c-002c01e9a13f	930d385b-945d-4305-bf06-5c4d2987be36	active	\N	2014-06-22 13:49:14.731001	9999-12-31 00:00:00	t
2304c08f-0510-406b-8d66-2d6c64ce6a7e	57f10148-cf98-47e0-9ed6-405c9d29545d	Update Frequency	Annually	e6a48e8d-f122-4ceb-b33c-002c01e9a13f	2304c08f-0510-406b-8d66-2d6c64ce6a7e	active	\N	2014-06-22 13:49:14.731001	9999-12-31 00:00:00	t
71865cbc-c6d5-4664-b16d-8fcbe803e696	6ecc169e-f81b-4b23-9f82-d1782e92693b	Geospatial Coverage	Eastern Adelaide Region	11525995-90e8-4604-8535-bbb07f6b0887	71865cbc-c6d5-4664-b16d-8fcbe803e696	active	\N	2014-06-22 14:05:30.288149	9999-12-31 00:00:00	t
46b31069-507d-4436-842d-e215a78e0049	6ecc169e-f81b-4b23-9f82-d1782e92693b	Update Frequency	Annually	11525995-90e8-4604-8535-bbb07f6b0887	46b31069-507d-4436-842d-e215a78e0049	active	\N	2014-06-22 14:05:30.288149	9999-12-31 00:00:00	t
4de2c25d-7f93-4d7e-a12a-efb5698980ea	6ecc169e-f81b-4b23-9f82-d1782e92693b	Temporal Coverage	2013	11525995-90e8-4604-8535-bbb07f6b0887	4de2c25d-7f93-4d7e-a12a-efb5698980ea	active	\N	2014-06-22 14:05:30.288149	9999-12-31 00:00:00	t
00d806e8-34a1-448d-b50a-120006edb12d	6ecc169e-f81b-4b23-9f82-d1782e92693b	Data Location	Hosted	11525995-90e8-4604-8535-bbb07f6b0887	00d806e8-34a1-448d-b50a-120006edb12d	active	\N	2014-06-22 14:05:30.288149	9999-12-31 00:00:00	t
680cf6ca-fae6-4f25-94d4-b1a30dfc1117	6ecc169e-f81b-4b23-9f82-d1782e92693b	Data Granularity	10 minute averaged data	11525995-90e8-4604-8535-bbb07f6b0887	680cf6ca-fae6-4f25-94d4-b1a30dfc1117	active	\N	2014-06-22 14:05:30.288149	9999-12-31 00:00:00	t
2f863d9d-205c-4ebf-b9f7-3232afbede9f	3ba1c4dd-e52f-4c28-858a-21284c3ee458	Data Granularity	10 minute averaged data	85096f9c-9b6c-4bed-abce-7bd8e2b72007	2f863d9d-205c-4ebf-b9f7-3232afbede9f	active	\N	2014-06-22 14:12:50.100367	9999-12-31 00:00:00	t
0d2a66a4-a460-4238-99eb-9f2062390d44	3ba1c4dd-e52f-4c28-858a-21284c3ee458	Temporal Coverage	2013	85096f9c-9b6c-4bed-abce-7bd8e2b72007	0d2a66a4-a460-4238-99eb-9f2062390d44	active	\N	2014-06-22 14:12:50.100367	9999-12-31 00:00:00	t
d8ae41b2-4a94-4a70-9551-dd76ec433fa0	3ba1c4dd-e52f-4c28-858a-21284c3ee458	Update Frequency	Annually	85096f9c-9b6c-4bed-abce-7bd8e2b72007	d8ae41b2-4a94-4a70-9551-dd76ec433fa0	active	\N	2014-06-22 14:12:50.100367	9999-12-31 00:00:00	t
a447f83f-639b-4bf6-b5a6-fc00407f8b32	3ba1c4dd-e52f-4c28-858a-21284c3ee458	Data Location	Hosted	85096f9c-9b6c-4bed-abce-7bd8e2b72007	a447f83f-639b-4bf6-b5a6-fc00407f8b32	active	\N	2014-06-22 14:12:50.100367	9999-12-31 00:00:00	t
eb756281-2d87-4ed2-9785-d537059cf424	3ba1c4dd-e52f-4c28-858a-21284c3ee458	Geospatial Coverage	Eastern Adelaide Region	85096f9c-9b6c-4bed-abce-7bd8e2b72007	eb756281-2d87-4ed2-9785-d537059cf424	active	\N	2014-06-22 14:12:50.100367	9999-12-31 00:00:00	t
f43c8fa2-b251-4d22-891d-f74ce51217fb	c2b6d9a4-9b7e-42bd-9cba-856320e2e139	Data Location	Hosted or Linked	a9b74787-a3ca-4d34-bf79-0d08673636a0	f43c8fa2-b251-4d22-891d-f74ce51217fb	active	\N	2014-06-22 16:30:03.232772	9999-12-31 00:00:00	t
9f11d3e5-d806-4f48-9541-6a5331289776	c2b6d9a4-9b7e-42bd-9cba-856320e2e139	Geospatial Coverage	Partial coverage of the northern area of South Adelaide, City of Adelaide, South Australia	a9b74787-a3ca-4d34-bf79-0d08673636a0	9f11d3e5-d806-4f48-9541-6a5331289776	active	\N	2014-06-22 16:30:03.232772	9999-12-31 00:00:00	t
fc3cf1ef-e79e-420d-beae-b051c998c753	4f9cce24-1ed0-40cb-9e9b-bd49ad8b17cf	Temporal Coverage	2007-2011	68605461-2aa4-45a3-a56e-e670ce6062e8	fc3cf1ef-e79e-420d-beae-b051c998c753	active	\N	2014-07-01 05:33:37.826652	9999-12-31 00:00:00	t
e4e8fd62-b0e9-431d-b034-0f620ed52202	b584938f-3f3a-4821-93b9-e44adf8e6884	Data Status	Inactive	57985bcf-cc7a-469c-90b4-bf8a42ecc5b5	e4e8fd62-b0e9-431d-b034-0f620ed52202	active	\N	2014-06-27 00:28:21.499611	9999-12-31 00:00:00	t
14fb484b-3334-480d-9eb6-304e25d7e789	29f1664d-5911-49f5-b0bb-272d9eef9c32	Geospatial Coverage	Western Adelaide Region	5b102c10-1d2b-47b0-acf7-b7104128f9aa	14fb484b-3334-480d-9eb6-304e25d7e789	active	\N	2014-06-22 14:26:27.942601	9999-12-31 00:00:00	t
5332641a-aac6-4a23-bb5d-4f626d288e3a	29f1664d-5911-49f5-b0bb-272d9eef9c32	Update Frequency	Annually	5b102c10-1d2b-47b0-acf7-b7104128f9aa	5332641a-aac6-4a23-bb5d-4f626d288e3a	active	\N	2014-06-22 14:26:27.942601	9999-12-31 00:00:00	t
b7808a02-6402-40d0-a9e5-7bf859938251	29f1664d-5911-49f5-b0bb-272d9eef9c32	Data Location	Hosted	5b102c10-1d2b-47b0-acf7-b7104128f9aa	b7808a02-6402-40d0-a9e5-7bf859938251	active	\N	2014-06-22 14:26:27.942601	9999-12-31 00:00:00	t
515f783d-aa32-4312-9f2d-1e202d3bd861	29f1664d-5911-49f5-b0bb-272d9eef9c32	Temporal Coverage	2013	5b102c10-1d2b-47b0-acf7-b7104128f9aa	515f783d-aa32-4312-9f2d-1e202d3bd861	active	\N	2014-06-22 14:26:27.942601	9999-12-31 00:00:00	t
b13cd442-e88c-4b8e-b954-f18ee8f57bd4	29f1664d-5911-49f5-b0bb-272d9eef9c32	Data Granularity	10 minute averaged data	5b102c10-1d2b-47b0-acf7-b7104128f9aa	b13cd442-e88c-4b8e-b954-f18ee8f57bd4	active	\N	2014-06-22 14:26:27.942601	9999-12-31 00:00:00	t
db9f2b98-cbd7-4c45-b3e7-4d82851baafe	b46ea120-ed9c-484e-9473-bb5cbe8fd1c8	Temporal Coverage	2013	87b750ea-b196-47f4-a2da-adf811b6db96	db9f2b98-cbd7-4c45-b3e7-4d82851baafe	active	\N	2014-06-22 14:36:35.695294	9999-12-31 00:00:00	t
5810daf6-14e8-45ea-b740-415f918999ad	b46ea120-ed9c-484e-9473-bb5cbe8fd1c8	Update Frequency	Annually	87b750ea-b196-47f4-a2da-adf811b6db96	5810daf6-14e8-45ea-b740-415f918999ad	active	\N	2014-06-22 14:36:35.695294	9999-12-31 00:00:00	t
482cff31-4aab-40b2-9554-aad78dbf9305	b46ea120-ed9c-484e-9473-bb5cbe8fd1c8	Data Granularity	10 minute averaged data	87b750ea-b196-47f4-a2da-adf811b6db96	482cff31-4aab-40b2-9554-aad78dbf9305	active	\N	2014-06-22 14:36:35.695294	9999-12-31 00:00:00	t
536eba95-d865-4881-827d-efd8b1f73fe1	b46ea120-ed9c-484e-9473-bb5cbe8fd1c8	Geospatial Coverage	Western Adelaide Region	87b750ea-b196-47f4-a2da-adf811b6db96	536eba95-d865-4881-827d-efd8b1f73fe1	active	\N	2014-06-22 14:36:35.695294	9999-12-31 00:00:00	t
61653ad4-c747-4ea0-ba0c-43087e8524d8	b46ea120-ed9c-484e-9473-bb5cbe8fd1c8	Data Location	Hosted	87b750ea-b196-47f4-a2da-adf811b6db96	61653ad4-c747-4ea0-ba0c-43087e8524d8	active	\N	2014-06-22 14:36:35.695294	9999-12-31 00:00:00	t
d009d98e-482e-4e03-810e-f084ca5f38cb	999c056f-e04a-444b-95dc-329d7d10dc46	Temporal Coverage	2013	8eb57ce0-0048-4877-adfd-1f6c22fe0621	d009d98e-482e-4e03-810e-f084ca5f38cb	active	\N	2014-06-22 14:59:38.868213	9999-12-31 00:00:00	t
4bbff93f-153a-48f4-a6da-f970917603c3	999c056f-e04a-444b-95dc-329d7d10dc46	Data Location	Hosted	8eb57ce0-0048-4877-adfd-1f6c22fe0621	4bbff93f-153a-48f4-a6da-f970917603c3	active	\N	2014-06-22 14:59:38.868213	9999-12-31 00:00:00	t
9d33f46a-6a23-4b1f-b3ff-f1cadf740b1e	999c056f-e04a-444b-95dc-329d7d10dc46	Update Frequency	Annually	8eb57ce0-0048-4877-adfd-1f6c22fe0621	9d33f46a-6a23-4b1f-b3ff-f1cadf740b1e	active	\N	2014-06-22 14:59:38.868213	9999-12-31 00:00:00	t
d3526117-e2fa-42bf-b7ef-c66d680b2d91	999c056f-e04a-444b-95dc-329d7d10dc46	Data Granularity	10 minute averaged data	8eb57ce0-0048-4877-adfd-1f6c22fe0621	d3526117-e2fa-42bf-b7ef-c66d680b2d91	active	\N	2014-06-22 14:59:38.868213	9999-12-31 00:00:00	t
e9c3a277-341e-4817-873e-9f27ace7010e	999c056f-e04a-444b-95dc-329d7d10dc46	Geospatial Coverage	North Western Adelaide Region	8eb57ce0-0048-4877-adfd-1f6c22fe0621	e9c3a277-341e-4817-873e-9f27ace7010e	active	\N	2014-06-22 14:59:38.868213	9999-12-31 00:00:00	t
37e5ab9f-04b2-487d-a0dc-bb19410415c8	5a8050ca-da03-4ab4-b174-52fde6b33d01	Geospatial Coverage	North western  Adelaide Region	5f239a0c-f540-4eb9-8473-647a181cbb4a	37e5ab9f-04b2-487d-a0dc-bb19410415c8	active	\N	2014-06-22 15:08:37.51086	9999-12-31 00:00:00	t
8648107a-f226-4bd3-a4d5-411925e89c3a	5a8050ca-da03-4ab4-b174-52fde6b33d01	Data Granularity	10 minute averaged data	5f239a0c-f540-4eb9-8473-647a181cbb4a	8648107a-f226-4bd3-a4d5-411925e89c3a	active	\N	2014-06-22 15:08:37.51086	9999-12-31 00:00:00	t
354ecffc-1f56-4d93-9d75-fe4c60068eb3	5a8050ca-da03-4ab4-b174-52fde6b33d01	Temporal Coverage	2013	5f239a0c-f540-4eb9-8473-647a181cbb4a	354ecffc-1f56-4d93-9d75-fe4c60068eb3	active	\N	2014-06-22 15:08:37.51086	9999-12-31 00:00:00	t
94aa64b1-9af8-4f28-8975-1de1fabf7d0a	5a8050ca-da03-4ab4-b174-52fde6b33d01	Data Location	Hosted	5f239a0c-f540-4eb9-8473-647a181cbb4a	94aa64b1-9af8-4f28-8975-1de1fabf7d0a	active	\N	2014-06-22 15:08:37.51086	9999-12-31 00:00:00	t
b275f942-92fb-4d91-b6cf-57344b71946e	5a8050ca-da03-4ab4-b174-52fde6b33d01	Update Frequency	Annually	5f239a0c-f540-4eb9-8473-647a181cbb4a	b275f942-92fb-4d91-b6cf-57344b71946e	active	\N	2014-06-22 15:08:37.51086	9999-12-31 00:00:00	t
9a86760c-421d-4856-83f5-94d2fc98b38c	13cad712-44e6-4b6e-82f7-7260619bb061	Data Location	Hosted	fcc913f9-a02e-4768-b107-8808c92bab95	9a86760c-421d-4856-83f5-94d2fc98b38c	active	\N	2014-06-22 15:17:45.531493	9999-12-31 00:00:00	t
34b6114f-60a4-46a3-8a3a-4a6c410821ca	13cad712-44e6-4b6e-82f7-7260619bb061	Update Frequency	Annually	fcc913f9-a02e-4768-b107-8808c92bab95	34b6114f-60a4-46a3-8a3a-4a6c410821ca	active	\N	2014-06-22 15:17:45.531493	9999-12-31 00:00:00	t
95f79d38-fb0a-4749-abcf-32104498ec39	13cad712-44e6-4b6e-82f7-7260619bb061	Temporal Coverage	2013	fcc913f9-a02e-4768-b107-8808c92bab95	95f79d38-fb0a-4749-abcf-32104498ec39	active	\N	2014-06-22 15:17:45.531493	9999-12-31 00:00:00	t
10073886-f4b4-47f9-965e-28c17ea4d2d7	13cad712-44e6-4b6e-82f7-7260619bb061	Geospatial Coverage	North Eastern Adelaide Region	fcc913f9-a02e-4768-b107-8808c92bab95	10073886-f4b4-47f9-965e-28c17ea4d2d7	active	\N	2014-06-22 15:17:45.531493	9999-12-31 00:00:00	t
e34d9b91-c05d-4f28-912b-644c696a7ed5	13cad712-44e6-4b6e-82f7-7260619bb061	Data Granularity	10 minute averaged data	fcc913f9-a02e-4768-b107-8808c92bab95	e34d9b91-c05d-4f28-912b-644c696a7ed5	active	\N	2014-06-22 15:17:45.531493	9999-12-31 00:00:00	t
69043c03-2d40-4d06-9c88-a9e2b0a44b70	b584938f-3f3a-4821-93b9-e44adf8e6884	Data Location	South Australia	57985bcf-cc7a-469c-90b4-bf8a42ecc5b5	69043c03-2d40-4d06-9c88-a9e2b0a44b70	active	\N	2014-06-27 00:28:21.499611	9999-12-31 00:00:00	t
94e89210-faf6-4a63-aa60-cf581ac9c248	b584938f-3f3a-4821-93b9-e44adf8e6884	Data Granularity	One time point – 2007	57985bcf-cc7a-469c-90b4-bf8a42ecc5b5	94e89210-faf6-4a63-aa60-cf581ac9c248	active	\N	2014-06-27 00:28:21.499611	9999-12-31 00:00:00	t
3f2954be-05a7-40dc-bc7c-10cfeff6bd99	23ee994a-4d9e-4d40-bdd0-6bf4c949c0ee	Data Granularity	10 minute averaged data	e887c389-33d4-45db-ba93-3c55b0f35171	3f2954be-05a7-40dc-bc7c-10cfeff6bd99	active	\N	2014-06-22 15:28:03.795588	9999-12-31 00:00:00	t
e45d290c-372b-4872-923c-bea4e642dc77	23ee994a-4d9e-4d40-bdd0-6bf4c949c0ee	Temporal Coverage	2013	e887c389-33d4-45db-ba93-3c55b0f35171	e45d290c-372b-4872-923c-bea4e642dc77	active	\N	2014-06-22 15:28:03.795588	9999-12-31 00:00:00	t
23d256eb-8fac-45d0-8042-d9c75d842d25	23ee994a-4d9e-4d40-bdd0-6bf4c949c0ee	Geospatial Coverage	Spencer Gulf Region	e887c389-33d4-45db-ba93-3c55b0f35171	23d256eb-8fac-45d0-8042-d9c75d842d25	active	\N	2014-06-22 15:28:03.795588	9999-12-31 00:00:00	t
4f90e658-1419-4a7c-be87-52c49fefe39f	23ee994a-4d9e-4d40-bdd0-6bf4c949c0ee	Update Frequency	Annually	e887c389-33d4-45db-ba93-3c55b0f35171	4f90e658-1419-4a7c-be87-52c49fefe39f	active	\N	2014-06-22 15:28:03.795588	9999-12-31 00:00:00	t
690b02b1-84bb-4f12-9d9f-2832cc663038	23ee994a-4d9e-4d40-bdd0-6bf4c949c0ee	Data Location	Hosted	e887c389-33d4-45db-ba93-3c55b0f35171	690b02b1-84bb-4f12-9d9f-2832cc663038	active	\N	2014-06-22 15:28:03.795588	9999-12-31 00:00:00	t
735d4363-5757-4646-b3c4-90423d480532	2e0da08c-6d18-4469-ad77-d9b266e30f0c	Temporal Coverage	1914-1958	337e0a68-7271-49aa-9706-91f3d1f0e7f9	735d4363-5757-4646-b3c4-90423d480532	active	\N	2014-06-22 16:47:25.842453	9999-12-31 00:00:00	t
cb427555-cd1c-455a-ad80-8dd59e812848	2e0da08c-6d18-4469-ad77-d9b266e30f0c	Data Granularity	N/A	337e0a68-7271-49aa-9706-91f3d1f0e7f9	cb427555-cd1c-455a-ad80-8dd59e812848	active	\N	2014-06-22 16:47:25.842453	9999-12-31 00:00:00	t
1f056e6c-047a-4d4c-8a07-20ae29e4a33d	2e0da08c-6d18-4469-ad77-d9b266e30f0c	Geospatial Coverage	Partial coverage of South Australia, including Adelaide and greater Adelaide regions, Fleurieu Peninsula, lower River Murray and lakes area and part Coorong, top of Spencer Gulf, and Pimba & Yandandarre Ridge regions in northern South Australia	337e0a68-7271-49aa-9706-91f3d1f0e7f9	1f056e6c-047a-4d4c-8a07-20ae29e4a33d	active	\N	2014-06-22 16:47:25.842453	9999-12-31 00:00:00	t
7054c393-e4db-45d2-af98-5654b4d17842	2e0da08c-6d18-4469-ad77-d9b266e30f0c	Data Location	Hosted or Linked	337e0a68-7271-49aa-9706-91f3d1f0e7f9	7054c393-e4db-45d2-af98-5654b4d17842	active	\N	2014-06-22 16:47:25.842453	9999-12-31 00:00:00	t
c4bbaf38-c76a-4d0e-a86f-31fddb2f3ea5	2e0da08c-6d18-4469-ad77-d9b266e30f0c	Update Frequency	Once-off	337e0a68-7271-49aa-9706-91f3d1f0e7f9	c4bbaf38-c76a-4d0e-a86f-31fddb2f3ea5	active	\N	2014-06-22 16:47:25.842453	9999-12-31 00:00:00	t
8b86313a-317a-4930-830e-50a7e4d31171	2bf90e40-45bc-447b-8423-a122d682a9d9	Data Granularity	N/A	f223f2dc-f623-47f9-bde6-83d94a1435f3	8b86313a-317a-4930-830e-50a7e4d31171	active	\N	2014-06-22 17:00:26.953198	9999-12-31 00:00:00	t
b0cf2684-1d66-461f-9451-dc04d3730edc	2bf90e40-45bc-447b-8423-a122d682a9d9	Geospatial Coverage	River Murray, South Australia from Swan Reach to boundary of State, 153 to 405 ¾ miles from Murray mouth	f223f2dc-f623-47f9-bde6-83d94a1435f3	b0cf2684-1d66-461f-9451-dc04d3730edc	active	\N	2014-06-22 17:00:26.953198	9999-12-31 00:00:00	t
3450d005-d6b6-4cde-af9e-ffe5391fd9d8	2bf90e40-45bc-447b-8423-a122d682a9d9	Data Location	Hosted or Linked	f223f2dc-f623-47f9-bde6-83d94a1435f3	3450d005-d6b6-4cde-af9e-ffe5391fd9d8	active	\N	2014-06-22 17:00:26.953198	9999-12-31 00:00:00	t
5b4d188d-cfb4-47fc-af39-50e58460d333	2bf90e40-45bc-447b-8423-a122d682a9d9	Temporal Coverage	1910	f223f2dc-f623-47f9-bde6-83d94a1435f3	5b4d188d-cfb4-47fc-af39-50e58460d333	active	\N	2014-06-22 17:00:26.953198	9999-12-31 00:00:00	t
e999d257-d1db-4fd1-a12b-0f235e322cc4	2bf90e40-45bc-447b-8423-a122d682a9d9	Update Frequency	Once-off	f223f2dc-f623-47f9-bde6-83d94a1435f3	e999d257-d1db-4fd1-a12b-0f235e322cc4	active	\N	2014-06-22 17:00:26.953198	9999-12-31 00:00:00	t
ff09ce32-0a39-41d7-827c-53a1ecefd9de	8166ee0e-85e0-4d05-9916-dd092e401644	Update Frequency	Ad-hoc	a5398d2a-cc61-4c52-82ab-bde5d407c254	ff09ce32-0a39-41d7-827c-53a1ecefd9de	active	\N	2014-06-23 05:49:56.484449	9999-12-31 00:00:00	t
519bcee5-594d-45c5-a3d2-2a9711a39efe	8166ee0e-85e0-4d05-9916-dd092e401644	Temporal Coverage	June 2014	a5398d2a-cc61-4c52-82ab-bde5d407c254	519bcee5-594d-45c5-a3d2-2a9711a39efe	active	\N	2014-06-23 05:49:56.484449	9999-12-31 00:00:00	t
66b60920-4faf-4ee8-b3ae-dde1315e908f	8166ee0e-85e0-4d05-9916-dd092e401644	Data Granularity	Entire Waite Arboretum	a5398d2a-cc61-4c52-82ab-bde5d407c254	66b60920-4faf-4ee8-b3ae-dde1315e908f	active	\N	2014-06-23 05:49:56.484449	9999-12-31 00:00:00	t
c041d103-6612-4d97-8713-01848db192ef	8166ee0e-85e0-4d05-9916-dd092e401644	Geospatial Coverage	Arboretum boundary	a5398d2a-cc61-4c52-82ab-bde5d407c254	c041d103-6612-4d97-8713-01848db192ef	active	\N	2014-06-23 05:49:56.484449	9999-12-31 00:00:00	t
f6121fb7-2971-46d1-a74f-2680a1c77c78	dfdf19f5-a6c4-4192-9c97-21b445407d83	Update Frequency	Ad-hoc	f725a636-7988-4d89-93bb-9f2a9b64e98d	f6121fb7-2971-46d1-a74f-2680a1c77c78	active	\N	2014-06-23 06:28:11.854002	9999-12-31 00:00:00	t
7e1fa318-365e-48af-87e9-75527d31da4a	dfdf19f5-a6c4-4192-9c97-21b445407d83	Data Granularity	Entire Waite Arboretum	f725a636-7988-4d89-93bb-9f2a9b64e98d	7e1fa318-365e-48af-87e9-75527d31da4a	active	\N	2014-06-23 06:28:11.854002	9999-12-31 00:00:00	t
1e5331e0-83bc-4273-b044-9d4040b51d94	dfdf19f5-a6c4-4192-9c97-21b445407d83	Geospatial Coverage	Arboretum boundary	f725a636-7988-4d89-93bb-9f2a9b64e98d	1e5331e0-83bc-4273-b044-9d4040b51d94	active	\N	2014-06-23 06:28:11.854002	9999-12-31 00:00:00	t
4079ef1a-b06c-4ab5-a84d-8a0006d65c01	dfdf19f5-a6c4-4192-9c97-21b445407d83	Temporal Coverage	June 2014	f725a636-7988-4d89-93bb-9f2a9b64e98d	4079ef1a-b06c-4ab5-a84d-8a0006d65c01	active	\N	2014-06-23 06:28:11.854002	9999-12-31 00:00:00	t
b76cbaa7-affa-4809-8ac6-19cc75389d21	31a58078-8a02-43d5-b71a-c5c9cc47764f	Update Frequency	Annually	3c717612-25af-40d1-b772-ab1aa189bb7e	b76cbaa7-affa-4809-8ac6-19cc75389d21	active	\N	2014-06-24 01:17:54.986633	9999-12-31 00:00:00	t
ca7031d8-676d-4581-b4a5-bd7ac0f8f349	31a58078-8a02-43d5-b71a-c5c9cc47764f	Geospatial Coverage	South Australia	3c717612-25af-40d1-b772-ab1aa189bb7e	ca7031d8-676d-4581-b4a5-bd7ac0f8f349	active	\N	2014-06-24 01:17:54.986633	9999-12-31 00:00:00	t
19c79f3e-203e-4fc2-b9da-99287812a14a	31a58078-8a02-43d5-b71a-c5c9cc47764f	Temporal Coverage	1 May 2009 - 30 May 2014	3c717612-25af-40d1-b772-ab1aa189bb7e	19c79f3e-203e-4fc2-b9da-99287812a14a	active	\N	2014-06-24 01:17:54.986633	9999-12-31 00:00:00	t
073093e4-1a39-44f3-aa94-067e9ed4481f	09630f9e-b9a9-48df-a28f-c5f6f3ca270e	Update Frequency	Annually	a75f053d-3b42-4bd8-8dc7-d00e1570d9b5	073093e4-1a39-44f3-aa94-067e9ed4481f	active	\N	2014-06-25 04:24:16.10803	9999-12-31 00:00:00	t
79ca0a72-9173-47b5-a31a-00c32c5abf72	09630f9e-b9a9-48df-a28f-c5f6f3ca270e	Data Location	Hosted	a75f053d-3b42-4bd8-8dc7-d00e1570d9b5	79ca0a72-9173-47b5-a31a-00c32c5abf72	active	\N	2014-06-25 04:24:16.10803	9999-12-31 00:00:00	t
576509df-f374-4708-9169-b14fd758fa2c	09630f9e-b9a9-48df-a28f-c5f6f3ca270e	Geospatial Coverage	South Australia	a75f053d-3b42-4bd8-8dc7-d00e1570d9b5	576509df-f374-4708-9169-b14fd758fa2c	active	\N	2014-06-25 04:24:16.10803	9999-12-31 00:00:00	t
96915729-3a86-4388-9262-8c5155b76ad7	b584938f-3f3a-4821-93b9-e44adf8e6884	Geospatial Coverage	Local Government Areas across metropolitan Adelaide and larger regional areas	57985bcf-cc7a-469c-90b4-bf8a42ecc5b5	96915729-3a86-4388-9262-8c5155b76ad7	active	\N	2014-06-27 00:28:21.499611	9999-12-31 00:00:00	t
d510dd71-a405-4bd2-a55d-47a7965fbb5a	b584938f-3f3a-4821-93b9-e44adf8e6884	Temporal Coverage	2007	57985bcf-cc7a-469c-90b4-bf8a42ecc5b5	d510dd71-a405-4bd2-a55d-47a7965fbb5a	active	\N	2014-06-27 00:28:21.499611	9999-12-31 00:00:00	t
b59d72d6-cd28-4b4b-9859-f457a7bf474f	b584938f-3f3a-4821-93b9-e44adf8e6884	Update Frequency	Once-off study 	57985bcf-cc7a-469c-90b4-bf8a42ecc5b5	b59d72d6-cd28-4b4b-9859-f457a7bf474f	active	\N	2014-06-27 00:28:21.499611	9999-12-31 00:00:00	t
e4ef5506-95b9-4379-95f7-de1d2398fdf5	32330768-38e3-47bc-9eff-5d1a1ea1f793	Update Frequency	Daily	3bb9bdfe-b1be-4369-a870-e32f090ba5df	e4ef5506-95b9-4379-95f7-de1d2398fdf5	active	\N	2014-06-27 02:58:51.808376	9999-12-31 00:00:00	t
75fdacc5-f13b-4f1c-ae39-7cddad5bced2	2ca0daa6-479b-4bf9-af03-20c7917f2438	Geospatial Coverage	South Australia	0096cd4f-06a0-4231-8e24-99cc7b164563	75fdacc5-f13b-4f1c-ae39-7cddad5bced2	active	\N	2014-06-25 04:35:12.921828	9999-12-31 00:00:00	t
819bad8f-ca0d-4e29-8fe9-3d14c43df00d	2ca0daa6-479b-4bf9-af03-20c7917f2438	Update Frequency	Annually	0096cd4f-06a0-4231-8e24-99cc7b164563	819bad8f-ca0d-4e29-8fe9-3d14c43df00d	active	\N	2014-06-25 04:35:12.921828	9999-12-31 00:00:00	t
681be5b4-71e3-4e3d-9a6b-0c0aa7f78fb6	2ca0daa6-479b-4bf9-af03-20c7917f2438	Temporal Coverage	2014	0096cd4f-06a0-4231-8e24-99cc7b164563	681be5b4-71e3-4e3d-9a6b-0c0aa7f78fb6	active	\N	2014-06-25 04:35:12.921828	9999-12-31 00:00:00	t
970faf9a-e027-4bf9-be04-125a1160f4a8	2ca0daa6-479b-4bf9-af03-20c7917f2438	Data Granularity	State Region	0096cd4f-06a0-4231-8e24-99cc7b164563	970faf9a-e027-4bf9-be04-125a1160f4a8	active	\N	2014-06-25 04:35:12.921828	9999-12-31 00:00:00	t
9a949fa0-43f9-44bb-9509-7366ddb2303e	82230a54-2a9a-4a43-8536-1a0279846fcc	Update Frequency	Daily	18df9d19-de6b-44fb-a96d-7dc9b103ecf6	9a949fa0-43f9-44bb-9509-7366ddb2303e	active	\N	2014-06-27 03:10:51.865124	9999-12-31 00:00:00	t
67ebe5de-b094-4c9d-9a4a-04f4b8c36fb1	407b76e9-76c8-4c73-aada-2523ee015583	Update Frequency	Daily	7caed3a8-232b-48ab-9678-9a67f09bd447	67ebe5de-b094-4c9d-9a4a-04f4b8c36fb1	active	\N	2014-06-27 03:15:06.895976	9999-12-31 00:00:00	t
ce8c1b9e-6e80-4f82-b508-9d4dcdbd2d67	5f0ba9f3-2a9a-46a6-b27d-079ca7db2f3e	Data Location	Hosted	b00a16f9-7671-469a-afb2-60f21db87dcd	ce8c1b9e-6e80-4f82-b508-9d4dcdbd2d67	active	\N	2014-06-25 04:47:39.359475	9999-12-31 00:00:00	t
e1167b60-4f19-4ad7-b36e-3e5acdc414db	5f0ba9f3-2a9a-46a6-b27d-079ca7db2f3e	Temporal Coverage	2014	b00a16f9-7671-469a-afb2-60f21db87dcd	e1167b60-4f19-4ad7-b36e-3e5acdc414db	active	\N	2014-06-25 04:47:39.359475	9999-12-31 00:00:00	t
f357b07d-0b85-40d0-9311-d2807b71dcac	5f0ba9f3-2a9a-46a6-b27d-079ca7db2f3e	Geospatial Coverage	South Australia	b00a16f9-7671-469a-afb2-60f21db87dcd	f357b07d-0b85-40d0-9311-d2807b71dcac	active	\N	2014-06-25 04:47:39.359475	9999-12-31 00:00:00	t
ef3f8bda-20c9-4005-83c9-d1e06d923579	5f0ba9f3-2a9a-46a6-b27d-079ca7db2f3e	Update Frequency	Annually	b00a16f9-7671-469a-afb2-60f21db87dcd	ef3f8bda-20c9-4005-83c9-d1e06d923579	active	\N	2014-06-25 04:47:39.359475	9999-12-31 00:00:00	t
815e54a9-8cf8-41eb-9116-fa601ff3cffb	5f0ba9f3-2a9a-46a6-b27d-079ca7db2f3e	Data Granularity	State Region	b00a16f9-7671-469a-afb2-60f21db87dcd	815e54a9-8cf8-41eb-9116-fa601ff3cffb	active	\N	2014-06-25 04:47:39.359475	9999-12-31 00:00:00	t
b4439097-5827-49d1-862a-728b5d65e327	8287f2fc-a88e-4e91-8155-817c18887f25	Update Frequency	Daily	336217a0-8ea8-434d-bc52-40a6905195bd	b4439097-5827-49d1-862a-728b5d65e327	active	\N	2014-06-27 04:33:50.739059	9999-12-31 00:00:00	t
d85cb002-a186-4808-a15e-f82fe5175d11	4f0afb46-fbf9-4462-b21b-3229da6bd525	Data Granularity	N/A	678dbd26-76dc-41b2-97c2-9b1c7d44d42a	d85cb002-a186-4808-a15e-f82fe5175d11	active	\N	2014-06-27 08:07:39.133805	9999-12-31 00:00:00	t
ce9c9c7a-4953-45ab-80eb-25fca763fbaa	4f0afb46-fbf9-4462-b21b-3229da6bd525	Temporal Coverage	2011-12	678dbd26-76dc-41b2-97c2-9b1c7d44d42a	ce9c9c7a-4953-45ab-80eb-25fca763fbaa	active	\N	2014-06-27 08:07:39.133805	9999-12-31 00:00:00	t
8b35204d-0e38-4dd8-8d5b-ceeec0430055	4f0afb46-fbf9-4462-b21b-3229da6bd525	Update Frequency	Annually	678dbd26-76dc-41b2-97c2-9b1c7d44d42a	8b35204d-0e38-4dd8-8d5b-ceeec0430055	active	\N	2014-06-27 08:07:39.133805	9999-12-31 00:00:00	t
931c1467-e70a-4571-9c24-90ae17aa70db	4f0afb46-fbf9-4462-b21b-3229da6bd525	Data Location	Hosted	678dbd26-76dc-41b2-97c2-9b1c7d44d42a	931c1467-e70a-4571-9c24-90ae17aa70db	active	\N	2014-06-27 08:07:39.133805	9999-12-31 00:00:00	t
d3479ce6-0604-4b89-a8f1-eddd993add62	2a672fc9-9178-4079-9f91-bd51adb27e09	Update Frequency	Daily	5c3b21f9-03d0-49f6-b9ba-75bb864dc260	d3479ce6-0604-4b89-a8f1-eddd993add62	active	\N	2014-06-27 08:20:01.061114	9999-12-31 00:00:00	t
be93712c-6648-47b5-a183-fbea7f8017a7	372a5f3d-52ad-4a13-bc28-d7d8c45a87c5	Update Frequency	Daily	03cf7d8f-7c68-42a7-a519-93033761c3c5	be93712c-6648-47b5-a183-fbea7f8017a7	active	\N	2014-06-27 08:29:10.589436	9999-12-31 00:00:00	t
423b460d-0f97-4817-8b26-770b655f447f	6d3100cd-1051-4b7d-9cdc-f44e53663861	Update Frequency	Daily	79b5dd5a-a857-448e-87cd-2a295dc11c39	423b460d-0f97-4817-8b26-770b655f447f	active	\N	2014-06-30 05:35:28.14889	9999-12-31 00:00:00	t
aab0bff2-7db3-4e9e-98cd-8735b2210e4b	b9d535a5-06d8-477e-a7b9-1d0b509c6707	Update Frequency	Daily	472beeac-2e28-4fbe-afc9-d7a823ac98c0	aab0bff2-7db3-4e9e-98cd-8735b2210e4b	active	\N	2014-06-30 05:46:38.33972	9999-12-31 00:00:00	t
d83f8a22-bdf3-4756-be8d-208742106956	549f8969-8809-45d3-862b-5112b6908c16	Update Frequency	Daily	278e3f8a-064b-499c-99a2-aed33e473a3d	d83f8a22-bdf3-4756-be8d-208742106956	active	\N	2014-06-30 05:52:25.375302	9999-12-31 00:00:00	t
42f48e92-e461-4579-8eba-75b202a25a97	351a45df-ba35-4689-ad7c-b312889150b0	Update Frequency	Daily	1ac9eb77-52c2-4bbc-ac42-7c7d0ff2f744	42f48e92-e461-4579-8eba-75b202a25a97	active	\N	2014-06-30 05:58:46.339434	9999-12-31 00:00:00	t
70d8a4dd-09eb-4ef8-889e-c953947abafc	e506d838-f004-4f29-9fa9-6dfc405ed461	Update Frequency	Daily	77c0b3ce-e531-46f9-b0ca-f18b6cb63165	70d8a4dd-09eb-4ef8-889e-c953947abafc	active	\N	2014-06-30 06:02:58.689484	9999-12-31 00:00:00	t
037e98d9-d2c7-4c6d-8cad-e5aa91865ba2	ed8512c5-f97a-4832-9600-3e1f31d6f828	Update Frequency	Daily	a047ae41-57bc-4ad6-a55e-cb8391a146e7	037e98d9-d2c7-4c6d-8cad-e5aa91865ba2	active	\N	2014-06-30 06:06:50.030988	9999-12-31 00:00:00	t
22f15e77-4c5c-49a5-be04-25f0b830a1eb	47c449da-02f6-401f-96dd-6c6361063582	Update Frequency	Daily	da128abf-e84b-4197-a459-2f2dee43dfaf	22f15e77-4c5c-49a5-be04-25f0b830a1eb	active	\N	2014-06-30 06:14:10.089025	9999-12-31 00:00:00	t
1c4981c6-dd0b-4bae-86cd-e95b9a812cee	78f36e27-d711-4088-a7f2-e18b360ed107	Data Location	Hosted	04001e39-43c5-4c42-88d6-3f7701011504	1c4981c6-dd0b-4bae-86cd-e95b9a812cee	active	\N	2014-06-25 05:00:55.505112	9999-12-31 00:00:00	t
fb4054eb-ec86-405f-8bd2-55de9875cac8	78f36e27-d711-4088-a7f2-e18b360ed107	Temporal Coverage	2014	04001e39-43c5-4c42-88d6-3f7701011504	fb4054eb-ec86-405f-8bd2-55de9875cac8	active	\N	2014-06-25 05:00:55.505112	9999-12-31 00:00:00	t
4c121dcc-4404-4923-9174-fc9b57594217	78f36e27-d711-4088-a7f2-e18b360ed107	Geospatial Coverage	South Australia	04001e39-43c5-4c42-88d6-3f7701011504	4c121dcc-4404-4923-9174-fc9b57594217	active	\N	2014-06-25 05:00:55.505112	9999-12-31 00:00:00	t
dca8293e-f2b1-4e79-839c-0e6a38f99231	78f36e27-d711-4088-a7f2-e18b360ed107	Data Granularity	State Region	04001e39-43c5-4c42-88d6-3f7701011504	dca8293e-f2b1-4e79-839c-0e6a38f99231	active	\N	2014-06-25 05:00:55.505112	9999-12-31 00:00:00	t
d47eb2e0-50da-4f71-9396-cfb7941f31e8	78f36e27-d711-4088-a7f2-e18b360ed107	Update Frequency	Annually	04001e39-43c5-4c42-88d6-3f7701011504	d47eb2e0-50da-4f71-9396-cfb7941f31e8	active	\N	2014-06-25 05:00:55.505112	9999-12-31 00:00:00	t
f81cb45b-2753-4166-ad87-d1f131d63088	37933eb0-100e-4c43-9832-35ababa726e9	Update Frequency	Daily	1cb71064-5259-4c9a-adbc-9cf23d8af71b	f81cb45b-2753-4166-ad87-d1f131d63088	active	\N	2014-06-27 00:30:52.316725	9999-12-31 00:00:00	t
a713a1b1-b283-450b-bfa7-9c28d60f91b2	de39e54a-c9d7-47d2-9325-418808201326	Data Status	Inactive	d093a97f-d070-49dd-9625-c023aa03caef	a713a1b1-b283-450b-bfa7-9c28d60f91b2	active	\N	2014-06-27 00:32:49.579671	9999-12-31 00:00:00	t
d394fead-f190-421d-a40e-64a140cb1bd5	aae05f90-6ead-4d51-849d-367dbb66e011	Geospatial Coverage	South Australia	83b927f8-8b57-44fa-913b-050d184b2364	d394fead-f190-421d-a40e-64a140cb1bd5	active	\N	2014-06-25 05:08:38.986091	9999-12-31 00:00:00	t
f3f65470-9c9d-4dcd-9755-bb6db7cd1a9e	aae05f90-6ead-4d51-849d-367dbb66e011	Data Granularity	State Region	83b927f8-8b57-44fa-913b-050d184b2364	f3f65470-9c9d-4dcd-9755-bb6db7cd1a9e	active	\N	2014-06-25 05:08:38.986091	9999-12-31 00:00:00	t
4de3a1df-4250-4702-a6ae-957558d76cce	aae05f90-6ead-4d51-849d-367dbb66e011	Update Frequency	Annually	83b927f8-8b57-44fa-913b-050d184b2364	4de3a1df-4250-4702-a6ae-957558d76cce	active	\N	2014-06-25 05:08:38.986091	9999-12-31 00:00:00	t
5835e7f0-d9b5-40db-b2b7-0760a233f757	aae05f90-6ead-4d51-849d-367dbb66e011	Data Location	Hosted	83b927f8-8b57-44fa-913b-050d184b2364	5835e7f0-d9b5-40db-b2b7-0760a233f757	active	\N	2014-06-25 05:08:38.986091	9999-12-31 00:00:00	t
1158b6b4-7925-4491-a005-89e702aebe1d	aae05f90-6ead-4d51-849d-367dbb66e011	Temporal Coverage	2014	83b927f8-8b57-44fa-913b-050d184b2364	1158b6b4-7925-4491-a005-89e702aebe1d	active	\N	2014-06-25 05:08:38.986091	9999-12-31 00:00:00	t
710648d3-cdc3-4c54-b31e-26d6af020a6c	f29caf79-1bd5-45b2-9ebb-e5dd1712e7db	Update Frequency	Daily	52651b11-d24c-4129-b5a9-98ca26c34309	710648d3-cdc3-4c54-b31e-26d6af020a6c	active	\N	2014-06-27 03:02:24.49884	9999-12-31 00:00:00	t
05c8ba04-d3df-4ae3-9b79-47a8ca627765	9c2a4a32-038d-4c8f-98c7-7f59e001d213	Geospatial Coverage	South Australia	7456bc1b-96e6-4b3c-90bb-82a886a8f73f	05c8ba04-d3df-4ae3-9b79-47a8ca627765	active	\N	2014-06-25 05:15:35.200557	9999-12-31 00:00:00	t
c295a7a0-4539-4cf3-a803-142046ced605	9c2a4a32-038d-4c8f-98c7-7f59e001d213	Data Location	Hosted	7456bc1b-96e6-4b3c-90bb-82a886a8f73f	c295a7a0-4539-4cf3-a803-142046ced605	active	\N	2014-06-25 05:15:35.200557	9999-12-31 00:00:00	t
25c23bc1-96bc-4ec0-87c5-045e8163c2ae	9c2a4a32-038d-4c8f-98c7-7f59e001d213	Update Frequency	Annually	7456bc1b-96e6-4b3c-90bb-82a886a8f73f	25c23bc1-96bc-4ec0-87c5-045e8163c2ae	active	\N	2014-06-25 05:15:35.200557	9999-12-31 00:00:00	t
bbe5b514-c571-4100-8e48-5f3a08423eda	9c2a4a32-038d-4c8f-98c7-7f59e001d213	Data Granularity	Property Level	7456bc1b-96e6-4b3c-90bb-82a886a8f73f	bbe5b514-c571-4100-8e48-5f3a08423eda	active	\N	2014-06-25 05:15:35.200557	9999-12-31 00:00:00	t
e77b8060-6583-4fac-a139-95b0c868adbe	9c2a4a32-038d-4c8f-98c7-7f59e001d213	Temporal Coverage	2014	7456bc1b-96e6-4b3c-90bb-82a886a8f73f	e77b8060-6583-4fac-a139-95b0c868adbe	active	\N	2014-06-25 05:15:35.200557	9999-12-31 00:00:00	t
682661c4-6eac-4f7e-875f-e7a56a2d51dc	9c2a4a32-038d-4c8f-98c7-7f59e001d213	Data Status	Active	7456bc1b-96e6-4b3c-90bb-82a886a8f73f	682661c4-6eac-4f7e-875f-e7a56a2d51dc	active	\N	2014-06-25 05:15:35.200557	9999-12-31 00:00:00	t
75f2bcd6-5f7f-46b0-bb1a-288dc9b5530e	5c4723d1-dc6e-47b3-9850-125f07e9c2bd	Temporal Coverage	2014	187d9061-1698-4376-9f83-be62f16dc286	75f2bcd6-5f7f-46b0-bb1a-288dc9b5530e	active	\N	2014-06-25 05:23:39.45345	9999-12-31 00:00:00	t
d2257b6a-848d-4e1f-9c9a-8722d5184ff5	5c4723d1-dc6e-47b3-9850-125f07e9c2bd	Data Location	Hosted	187d9061-1698-4376-9f83-be62f16dc286	d2257b6a-848d-4e1f-9c9a-8722d5184ff5	active	\N	2014-06-25 05:23:39.45345	9999-12-31 00:00:00	t
ef9d3387-1ffc-4f62-a0cb-5ea996dc7f25	5c4723d1-dc6e-47b3-9850-125f07e9c2bd	Data Status	Active	187d9061-1698-4376-9f83-be62f16dc286	ef9d3387-1ffc-4f62-a0cb-5ea996dc7f25	active	\N	2014-06-25 05:23:39.45345	9999-12-31 00:00:00	t
2668405b-3a0a-4567-bc94-06d3b44d8c21	5c4723d1-dc6e-47b3-9850-125f07e9c2bd	Data Granularity	Property Level	187d9061-1698-4376-9f83-be62f16dc286	2668405b-3a0a-4567-bc94-06d3b44d8c21	active	\N	2014-06-25 05:23:39.45345	9999-12-31 00:00:00	t
00eddfdc-9fe2-4475-a2e8-233d4c8013c8	5c4723d1-dc6e-47b3-9850-125f07e9c2bd	Update Frequency	Annually	187d9061-1698-4376-9f83-be62f16dc286	00eddfdc-9fe2-4475-a2e8-233d4c8013c8	active	\N	2014-06-25 05:23:39.45345	9999-12-31 00:00:00	t
abb50b1f-600b-4af4-8631-a4f733fff354	5c4723d1-dc6e-47b3-9850-125f07e9c2bd	Geospatial Coverage	South Australia	187d9061-1698-4376-9f83-be62f16dc286	abb50b1f-600b-4af4-8631-a4f733fff354	active	\N	2014-06-25 05:23:39.45345	9999-12-31 00:00:00	t
d694ab2c-fd74-4be5-a54a-65ed23a32f19	6761afa6-f411-43b1-b35b-e704309cd0d3	Geospatial Coverage	Adelaide Hills	e863d0a3-aeab-4722-833b-24a1e97f603e	d694ab2c-fd74-4be5-a54a-65ed23a32f19	active	\N	2014-06-26 00:54:13.535851	9999-12-31 00:00:00	t
0fffead5-8c1d-4074-90b5-ebd8620c12b9	6761afa6-f411-43b1-b35b-e704309cd0d3	Update Frequency	Following Census	e863d0a3-aeab-4722-833b-24a1e97f603e	0fffead5-8c1d-4074-90b5-ebd8620c12b9	active	\N	2014-06-26 00:54:13.535851	9999-12-31 00:00:00	t
740f2612-4abf-42a8-a481-0a353cae7f3f	6761afa6-f411-43b1-b35b-e704309cd0d3	Data Granularity	N/A	e863d0a3-aeab-4722-833b-24a1e97f603e	740f2612-4abf-42a8-a481-0a353cae7f3f	active	\N	2014-06-26 00:54:13.535851	9999-12-31 00:00:00	t
dcd80e71-86b5-4e5d-82a9-c7de2367ca7b	cb34dc2c-43e8-4228-a7f7-90e33aa75a5e	Data Location	Hosted	8fc64bae-58a7-4bd1-b556-81f7773f23cd	dcd80e71-86b5-4e5d-82a9-c7de2367ca7b	active	\N	2014-06-26 02:31:48.203064	9999-12-31 00:00:00	t
d8fd5aab-aa53-4e46-96b6-d93d385a2d55	cb34dc2c-43e8-4228-a7f7-90e33aa75a5e	Update Frequency	Following Census	8fc64bae-58a7-4bd1-b556-81f7773f23cd	d8fd5aab-aa53-4e46-96b6-d93d385a2d55	active	\N	2014-06-26 02:31:48.203064	9999-12-31 00:00:00	t
ee72fdac-c905-4257-9096-e4dbcf96bd86	cb34dc2c-43e8-4228-a7f7-90e33aa75a5e	Geospatial Coverage	Yorke & Mid North	8fc64bae-58a7-4bd1-b556-81f7773f23cd	ee72fdac-c905-4257-9096-e4dbcf96bd86	active	\N	2014-06-26 02:31:48.203064	9999-12-31 00:00:00	t
5f1943c9-5ac9-4df6-9caa-1831833ec664	cb34dc2c-43e8-4228-a7f7-90e33aa75a5e	Temporal Coverage	2011-12	8fc64bae-58a7-4bd1-b556-81f7773f23cd	5f1943c9-5ac9-4df6-9caa-1831833ec664	active	\N	2014-06-26 02:31:48.203064	9999-12-31 00:00:00	t
0abaa0f2-ba59-4d7c-8014-3263c4d06ad1	4ecfa227-ace7-447a-bd68-fff8292c8894	Geospatial Coverage	South Australia	d5fd644b-7b74-4167-a273-6f87c2293b8e	0abaa0f2-ba59-4d7c-8014-3263c4d06ad1	active	\N	2014-07-03 02:44:45.412948	9999-12-31 00:00:00	t
b072041d-17cc-493f-a696-9bf3d5b6896a	2d79159a-a4f9-4465-88e2-999bfe3af0d7	Data Granularity	N/A	3b92f495-b11a-430b-aa4a-a5cd3e3d844c	b072041d-17cc-493f-a696-9bf3d5b6896a	active	\N	2014-06-26 02:33:17.875472	9999-12-31 00:00:00	t
5173eccf-e22d-4842-924c-d3d1e6a53c1b	2d79159a-a4f9-4465-88e2-999bfe3af0d7	Update Frequency	Following Census	3b92f495-b11a-430b-aa4a-a5cd3e3d844c	5173eccf-e22d-4842-924c-d3d1e6a53c1b	active	\N	2014-06-26 02:33:17.875472	9999-12-31 00:00:00	t
248c5ed1-c015-4267-8685-aa609b1dabda	2d79159a-a4f9-4465-88e2-999bfe3af0d7	Temporal Coverage	2011-12	3b92f495-b11a-430b-aa4a-a5cd3e3d844c	248c5ed1-c015-4267-8685-aa609b1dabda	active	\N	2014-06-26 02:33:17.875472	9999-12-31 00:00:00	t
be896fa8-dfb8-4bde-bf74-9797f2581c29	2d79159a-a4f9-4465-88e2-999bfe3af0d7	Data Status	Active	3b92f495-b11a-430b-aa4a-a5cd3e3d844c	be896fa8-dfb8-4bde-bf74-9797f2581c29	active	\N	2014-06-26 02:33:17.875472	9999-12-31 00:00:00	t
6e854fd1-625d-4650-a755-f003fdd38c27	2d79159a-a4f9-4465-88e2-999bfe3af0d7	Geospatial Coverage	Barossa	3b92f495-b11a-430b-aa4a-a5cd3e3d844c	6e854fd1-625d-4650-a755-f003fdd38c27	active	\N	2014-06-26 02:33:17.875472	9999-12-31 00:00:00	t
ee791b6b-acab-4f62-967c-f49d22e78386	2d79159a-a4f9-4465-88e2-999bfe3af0d7	Data Location	Hosted	3b92f495-b11a-430b-aa4a-a5cd3e3d844c	ee791b6b-acab-4f62-967c-f49d22e78386	active	\N	2014-06-26 02:33:17.875472	9999-12-31 00:00:00	t
78405edd-f26f-4703-a03a-1aae86cf8e86	cb34dc2c-43e8-4228-a7f7-90e33aa75a5e	Data Granularity	N/A	0a670566-69f5-4cbd-9908-892abf8a257d	78405edd-f26f-4703-a03a-1aae86cf8e86	active	\N	2014-06-26 02:33:44.519863	9999-12-31 00:00:00	t
2cc8e177-d3c7-4065-be46-b7062a3a72b3	cb34dc2c-43e8-4228-a7f7-90e33aa75a5e	Data Status	N/A	fad4a9af-eef3-48c8-a355-410a14d9440b	2cc8e177-d3c7-4065-be46-b7062a3a72b3	active	\N	2014-06-26 02:34:18.161061	9999-12-31 00:00:00	t
4cd3713e-0dcd-49d6-ae69-d4d1a83ae3d3	de39e54a-c9d7-47d2-9325-418808201326	Temporal Coverage	2013	d093a97f-d070-49dd-9625-c023aa03caef	4cd3713e-0dcd-49d6-ae69-d4d1a83ae3d3	active	\N	2014-06-27 00:32:49.579671	9999-12-31 00:00:00	t
c59ad61b-ca0c-4860-af5e-b91ed15f23f7	de39e54a-c9d7-47d2-9325-418808201326	Update Frequency	Once-off study	d093a97f-d070-49dd-9625-c023aa03caef	c59ad61b-ca0c-4860-af5e-b91ed15f23f7	active	\N	2014-06-27 00:32:49.579671	9999-12-31 00:00:00	t
98ad3f80-f300-41ad-ae69-17f51b132901	125528b7-b1f7-4fa0-a867-6ff30cab5392	Update Frequency	Daily	a7ad95eb-7985-4265-a121-91e149210838	98ad3f80-f300-41ad-ae69-17f51b132901	active	\N	2014-06-27 04:27:03.504808	9999-12-31 00:00:00	t
78559eb0-666f-433f-ab2b-804e8a69fb94	c73ccd15-e1ca-49c5-b26d-4908f73150c1	Update Frequency	Daily	7d12b60e-c0d3-4162-bfbb-c69093a7eb30	78559eb0-666f-433f-ab2b-804e8a69fb94	active	\N	2014-06-27 04:51:12.511221	9999-12-31 00:00:00	t
ee1690aa-8276-46bd-b02f-a03e063acbfa	3856680a-d402-4678-bc97-ccc856f10936	Update Frequency	Daily	44b3e5b3-acfe-45eb-ab17-3f3b5d69f7c7	ee1690aa-8276-46bd-b02f-a03e063acbfa	active	\N	2014-06-27 08:15:27.992853	9999-12-31 00:00:00	t
28d17fb7-6481-4f10-a8f9-ccacc2a741d5	df2fb8ac-7756-4060-aea0-65080826ee4a	Geospatial Coverage	Eastern Adelaide	11a30cc8-9365-4629-acfb-05373fae1ef2	28d17fb7-6481-4f10-a8f9-ccacc2a741d5	active	\N	2014-06-26 02:43:22.162928	9999-12-31 00:00:00	t
2dd95a8a-da5a-4f18-9051-72d47e5fe961	df2fb8ac-7756-4060-aea0-65080826ee4a	Temporal Coverage	2011-12	11a30cc8-9365-4629-acfb-05373fae1ef2	2dd95a8a-da5a-4f18-9051-72d47e5fe961	active	\N	2014-06-26 02:43:22.162928	9999-12-31 00:00:00	t
8ec6d526-18d8-4c9f-bfd4-72333e4b09e6	df2fb8ac-7756-4060-aea0-65080826ee4a	Data Location	Hosted	11a30cc8-9365-4629-acfb-05373fae1ef2	8ec6d526-18d8-4c9f-bfd4-72333e4b09e6	active	\N	2014-06-26 02:43:22.162928	9999-12-31 00:00:00	t
1a9d737a-8420-4fcd-b8f1-f6a66bb8dd4f	df2fb8ac-7756-4060-aea0-65080826ee4a	Update Frequency	Foll	b4c920b8-96f1-4f0f-a508-12a0edb06f73	1a9d737a-8420-4fcd-b8f1-f6a66bb8dd4f	active	11a30cc8-9365-4629-acfb-05373fae1ef2	2014-06-26 02:39:39.858132	2014-06-26 02:43:22.162928	f
1a9d737a-8420-4fcd-b8f1-f6a66bb8dd4f	df2fb8ac-7756-4060-aea0-65080826ee4a	Update Frequency	Following Census	11a30cc8-9365-4629-acfb-05373fae1ef2	1a9d737a-8420-4fcd-b8f1-f6a66bb8dd4f	active	\N	2014-06-26 02:43:22.162928	9999-12-31 00:00:00	t
7c0f4b06-249a-4eac-9031-0976a928ec7d	df2fb8ac-7756-4060-aea0-65080826ee4a	Data Granularity	N/A	11a30cc8-9365-4629-acfb-05373fae1ef2	7c0f4b06-249a-4eac-9031-0976a928ec7d	active	\N	2014-06-26 02:43:22.162928	9999-12-31 00:00:00	t
c942b9f2-7dfb-4127-b0c1-38535c3e6922	df2fb8ac-7756-4060-aea0-65080826ee4a	Data Status	Active	11a30cc8-9365-4629-acfb-05373fae1ef2	c942b9f2-7dfb-4127-b0c1-38535c3e6922	active	\N	2014-06-26 02:43:22.162928	9999-12-31 00:00:00	t
fac58ccf-09b2-424d-ae08-45a134ba466a	c0714dc2-df24-4277-a82d-dbaf710363fc	Update Frequency	Following Census	1cc19e9c-8945-433b-9dac-eabf4f3ec0ea	fac58ccf-09b2-424d-ae08-45a134ba466a	active	\N	2014-06-26 02:48:09.271076	9999-12-31 00:00:00	t
4603dddc-fd6d-4459-b8a8-e2a4ad894023	c0714dc2-df24-4277-a82d-dbaf710363fc	Data Status	Active	1cc19e9c-8945-433b-9dac-eabf4f3ec0ea	4603dddc-fd6d-4459-b8a8-e2a4ad894023	active	\N	2014-06-26 02:48:09.271076	9999-12-31 00:00:00	t
d2756481-d661-4d55-8f83-34aea3b964ec	c0714dc2-df24-4277-a82d-dbaf710363fc	Data Granularity	N/A	1cc19e9c-8945-433b-9dac-eabf4f3ec0ea	d2756481-d661-4d55-8f83-34aea3b964ec	active	\N	2014-06-26 02:48:09.271076	9999-12-31 00:00:00	t
f82197c7-0eaf-4300-b212-cc9d2a1630d3	c0714dc2-df24-4277-a82d-dbaf710363fc	Geospatial Coverage	Eyre & Western	1cc19e9c-8945-433b-9dac-eabf4f3ec0ea	f82197c7-0eaf-4300-b212-cc9d2a1630d3	active	\N	2014-06-26 02:48:09.271076	9999-12-31 00:00:00	t
2373dc44-f235-4e44-8dd7-b1d14b4c07f2	c0714dc2-df24-4277-a82d-dbaf710363fc	Temporal Coverage	2011-12	1cc19e9c-8945-433b-9dac-eabf4f3ec0ea	2373dc44-f235-4e44-8dd7-b1d14b4c07f2	active	\N	2014-06-26 02:48:09.271076	9999-12-31 00:00:00	t
a9b7b01f-3148-4fdf-962b-2f50b41eca8b	c0714dc2-df24-4277-a82d-dbaf710363fc	Data Location	Hosted	1cc19e9c-8945-433b-9dac-eabf4f3ec0ea	a9b7b01f-3148-4fdf-962b-2f50b41eca8b	active	\N	2014-06-26 02:48:09.271076	9999-12-31 00:00:00	t
3157149f-3d59-4f48-8fad-142a9c8fce92	9d0e3f21-28fd-4a26-b314-9bcd6a93f0ff	Temporal Coverage	2011-12	d153106e-5617-4d72-83f1-be645e69fd14	3157149f-3d59-4f48-8fad-142a9c8fce92	active	\N	2014-06-26 02:51:53.134926	9999-12-31 00:00:00	t
fce25805-5cd2-4a90-9807-ca78993a0662	9d0e3f21-28fd-4a26-b314-9bcd6a93f0ff	Data Granularity	N/A	d153106e-5617-4d72-83f1-be645e69fd14	fce25805-5cd2-4a90-9807-ca78993a0662	active	\N	2014-06-26 02:51:53.134926	9999-12-31 00:00:00	t
2e562e7d-7409-4cd0-a46d-13006d072b90	9d0e3f21-28fd-4a26-b314-9bcd6a93f0ff	Data Location	Hosted	d153106e-5617-4d72-83f1-be645e69fd14	2e562e7d-7409-4cd0-a46d-13006d072b90	active	\N	2014-06-26 02:51:53.134926	9999-12-31 00:00:00	t
cc65dc7e-4d6f-4429-9feb-77380a19d142	9d0e3f21-28fd-4a26-b314-9bcd6a93f0ff	Data Status	Active	d153106e-5617-4d72-83f1-be645e69fd14	cc65dc7e-4d6f-4429-9feb-77380a19d142	active	\N	2014-06-26 02:51:53.134926	9999-12-31 00:00:00	t
f834878e-3588-478b-a12e-f70878c7316a	9d0e3f21-28fd-4a26-b314-9bcd6a93f0ff	Geospatial Coverage	Far North	d153106e-5617-4d72-83f1-be645e69fd14	f834878e-3588-478b-a12e-f70878c7316a	active	\N	2014-06-26 02:51:53.134926	9999-12-31 00:00:00	t
1a757ce2-a9f5-49c3-9411-b3aeffe70335	9d0e3f21-28fd-4a26-b314-9bcd6a93f0ff	Update Frequency	Following Census	d153106e-5617-4d72-83f1-be645e69fd14	1a757ce2-a9f5-49c3-9411-b3aeffe70335	active	\N	2014-06-26 02:51:53.134926	9999-12-31 00:00:00	t
594d7320-8ffc-4537-8766-11d81dc5eceb	9f391f78-0871-4cdb-8718-3d3627739b18	Update Frequency	Following Census	565ee9ad-cf68-41d2-ab29-f915ae9e1983	594d7320-8ffc-4537-8766-11d81dc5eceb	active	\N	2014-06-26 02:55:33.802812	9999-12-31 00:00:00	t
70d699f9-1ec9-4cbd-a0c6-e4d509acc833	9f391f78-0871-4cdb-8718-3d3627739b18	Data Granularity	N/A	565ee9ad-cf68-41d2-ab29-f915ae9e1983	70d699f9-1ec9-4cbd-a0c6-e4d509acc833	active	\N	2014-06-26 02:55:33.802812	9999-12-31 00:00:00	t
2be7af8d-cbbf-48f8-94d3-d1b13f33abd3	9f391f78-0871-4cdb-8718-3d3627739b18	Data Location	Hosted	565ee9ad-cf68-41d2-ab29-f915ae9e1983	2be7af8d-cbbf-48f8-94d3-d1b13f33abd3	active	\N	2014-06-26 02:55:33.802812	9999-12-31 00:00:00	t
2c5fba23-b995-4aa9-a844-1b32d7882336	9f391f78-0871-4cdb-8718-3d3627739b18	Data Status	Active	565ee9ad-cf68-41d2-ab29-f915ae9e1983	2c5fba23-b995-4aa9-a844-1b32d7882336	active	\N	2014-06-26 02:55:33.802812	9999-12-31 00:00:00	t
7c699050-6bd4-47f9-a660-dcf2f2355eee	9f391f78-0871-4cdb-8718-3d3627739b18	Geospatial Coverage	Fleurieu & KI	565ee9ad-cf68-41d2-ab29-f915ae9e1983	7c699050-6bd4-47f9-a660-dcf2f2355eee	active	\N	2014-06-26 02:55:33.802812	9999-12-31 00:00:00	t
f543e50b-63be-43a6-bfca-f6f79082c948	9f391f78-0871-4cdb-8718-3d3627739b18	Temporal Coverage	2011-12	565ee9ad-cf68-41d2-ab29-f915ae9e1983	f543e50b-63be-43a6-bfca-f6f79082c948	active	\N	2014-06-26 02:55:33.802812	9999-12-31 00:00:00	t
e70a6b9a-09b3-492a-a144-9d0f7ef794f2	de39e54a-c9d7-47d2-9325-418808201326	Geospatial Coverage	Local Government Areas across metropolitan Adelaide and larger regional areas	d093a97f-d070-49dd-9625-c023aa03caef	e70a6b9a-09b3-492a-a144-9d0f7ef794f2	active	\N	2014-06-27 00:32:49.579671	9999-12-31 00:00:00	t
c37965f8-d63f-4eb3-9ca2-960ff0c1ed57	de39e54a-c9d7-47d2-9325-418808201326	Data Granularity	One time point – 2013	d093a97f-d070-49dd-9625-c023aa03caef	c37965f8-d63f-4eb3-9ca2-960ff0c1ed57	active	\N	2014-06-27 00:32:49.579671	9999-12-31 00:00:00	t
439d0287-c092-4ed2-8180-156c231e8a4d	de39e54a-c9d7-47d2-9325-418808201326	Data Location	South Australia	d093a97f-d070-49dd-9625-c023aa03caef	439d0287-c092-4ed2-8180-156c231e8a4d	active	\N	2014-06-27 00:32:49.579671	9999-12-31 00:00:00	t
718425ab-9488-4036-a75d-10b9be540710	4ecfa227-ace7-447a-bd68-fff8292c8894	Temporal Coverage	December 2012	d5fd644b-7b74-4167-a273-6f87c2293b8e	718425ab-9488-4036-a75d-10b9be540710	active	\N	2014-07-03 02:44:45.412948	9999-12-31 00:00:00	t
9e09d3c6-9665-4b50-9a21-d9dcb79d3a82	6e6f2473-40d9-4f46-a3dd-18cd5b3da889	Update Frequency	Daily	1cddd99d-927b-4cfa-bb69-83349db2f9f6	9e09d3c6-9665-4b50-9a21-d9dcb79d3a82	active	\N	2014-06-27 00:40:45.438088	9999-12-31 00:00:00	t
e2d3bc18-6c9e-4f63-a2ed-0633881de32d	4ecfa227-ace7-447a-bd68-fff8292c8894	Data Location	Linked	d5fd644b-7b74-4167-a273-6f87c2293b8e	e2d3bc18-6c9e-4f63-a2ed-0633881de32d	active	\N	2014-07-03 02:44:45.412948	9999-12-31 00:00:00	t
1004ffc3-f6af-4980-8524-3ac581f04732	73ae668b-b62b-46bf-adec-dc4ab58d3c48	Update Frequency	Daily	71b67f64-da65-448a-b43b-38854e80b763	1004ffc3-f6af-4980-8524-3ac581f04732	active	\N	2014-06-27 04:47:53.448196	9999-12-31 00:00:00	t
7842cd51-5a36-4732-b65f-73fb2b490700	aec1b1be-f4cb-42cf-909e-decea32638b8	Update Frequency	Daily	8e435433-e2f7-4d0b-b481-44d981dd1357	7842cd51-5a36-4732-b65f-73fb2b490700	active	\N	2014-06-27 04:56:07.618303	9999-12-31 00:00:00	t
0fcfbb57-1444-4b5c-ac15-34a109672a27	264ea2ff-b0f1-497e-b9c5-3e664207ecf5	Update Frequency	Annually	0be46d44-7912-4b81-a6ac-2203849d1057	0fcfbb57-1444-4b5c-ac15-34a109672a27	active	\N	2014-07-01 05:40:48.042502	9999-12-31 00:00:00	t
c04f601f-ed80-41c6-bb1c-cff1810b28ec	643964b8-2711-41ef-8a93-277a84164351	Update Frequency	Daily	5732a8a4-e3b4-4b6d-8c2c-cb9022702338	c04f601f-ed80-41c6-bb1c-cff1810b28ec	active	\N	2014-06-27 06:04:19.406581	9999-12-31 00:00:00	t
7a291716-96a4-4b91-8bb8-1c0d0fec7c6f	264ea2ff-b0f1-497e-b9c5-3e664207ecf5	Geospatial Coverage	City of Salisbury LGA	0be46d44-7912-4b81-a6ac-2203849d1057	7a291716-96a4-4b91-8bb8-1c0d0fec7c6f	active	\N	2014-07-01 05:40:48.042502	9999-12-31 00:00:00	t
f34e24bb-e3ab-4474-8e0d-b59192be80e1	dc47d809-7de7-4a15-b109-84a9675a0636	Update Frequency	Daily	84d07827-4f58-4552-bd72-a0c4d6593beb	f34e24bb-e3ab-4474-8e0d-b59192be80e1	active	\N	2014-06-27 06:08:29.525173	9999-12-31 00:00:00	t
010997e7-1439-4903-8aa9-1bdfb8933c52	264ea2ff-b0f1-497e-b9c5-3e664207ecf5	Data Location	City of Salisbury	0be46d44-7912-4b81-a6ac-2203849d1057	010997e7-1439-4903-8aa9-1bdfb8933c52	active	\N	2014-07-01 05:40:48.042502	9999-12-31 00:00:00	t
da359c40-43c5-47d3-a53d-88bb843d9671	8f34a5cf-d488-4a0b-b2a8-82c97fc760b9	Update Frequency	Daily	27d10efc-17be-43f9-bad7-7efbe9094b11	da359c40-43c5-47d3-a53d-88bb843d9671	active	\N	2014-06-27 06:15:50.132136	9999-12-31 00:00:00	t
17fabf99-9376-4d41-8f53-1988aeaff423	aa1aff67-ae25-4163-a7ea-ab5d618585b2	Update Frequency	Daily	a958caac-d543-4ef2-ba6c-9a67a34233a6	17fabf99-9376-4d41-8f53-1988aeaff423	active	\N	2014-06-27 06:20:41.862335	9999-12-31 00:00:00	t
6007e826-1e8a-4375-b81c-814f181b8dbe	c4771bc6-6da6-4eee-ace8-a88360ea447a	Update Frequency	Daily	1736cb6b-c578-41d9-9f82-b247b7d981c8	6007e826-1e8a-4375-b81c-814f181b8dbe	active	\N	2014-06-27 06:43:18.417295	9999-12-31 00:00:00	t
87c3a44a-323d-4bb0-a5b9-72b3a4f539ae	46bc7aa1-5a93-4bcd-9a45-f37a8d5547ae	Update Frequency	Daily	b6cd69b8-0acc-497c-90ca-94fb771d512c	87c3a44a-323d-4bb0-a5b9-72b3a4f539ae	active	\N	2014-06-27 07:05:33.763494	9999-12-31 00:00:00	t
e016895e-695c-41d2-9e74-1735fc49df9f	53e87968-8f37-452a-820a-aab79d9d0f49	Update Frequency	Annually	a5240083-5706-489a-bd8f-eb5602ebd801	e016895e-695c-41d2-9e74-1735fc49df9f	active	\N	2014-06-27 07:41:25.99758	9999-12-31 00:00:00	t
ce99dd20-1e02-48f9-8fa3-06105529f644	53e87968-8f37-452a-820a-aab79d9d0f49	Geospatial Coverage	South Australia	a5240083-5706-489a-bd8f-eb5602ebd801	ce99dd20-1e02-48f9-8fa3-06105529f644	active	\N	2014-06-27 07:41:25.99758	9999-12-31 00:00:00	t
4de2a21c-c7f2-4ef5-a3bf-7be0f59a6790	53e87968-8f37-452a-820a-aab79d9d0f49	Data Granularity	N/A	a5240083-5706-489a-bd8f-eb5602ebd801	4de2a21c-c7f2-4ef5-a3bf-7be0f59a6790	active	\N	2014-06-27 07:41:25.99758	9999-12-31 00:00:00	t
48b5bc36-4ef8-49fc-9382-6f1542e802ce	53e87968-8f37-452a-820a-aab79d9d0f49	Data Status	Active	a5240083-5706-489a-bd8f-eb5602ebd801	48b5bc36-4ef8-49fc-9382-6f1542e802ce	active	\N	2014-06-27 07:41:25.99758	9999-12-31 00:00:00	t
46b8b8c0-ae27-4fca-a07d-c687407e3a7c	53e87968-8f37-452a-820a-aab79d9d0f49	Data Location	Hosted	a5240083-5706-489a-bd8f-eb5602ebd801	46b8b8c0-ae27-4fca-a07d-c687407e3a7c	active	\N	2014-06-27 07:41:25.99758	9999-12-31 00:00:00	t
8adb2070-03b8-400a-8056-e950842837f5	53e87968-8f37-452a-820a-aab79d9d0f49	Temporal Coverage	2011-12	a5240083-5706-489a-bd8f-eb5602ebd801	8adb2070-03b8-400a-8056-e950842837f5	active	\N	2014-06-27 07:41:25.99758	9999-12-31 00:00:00	t
a2e10e85-4df7-4ec5-a973-d1a3ba5e79b9	9321792a-9adc-456e-86ed-41778d4c3add	Geospatial Coverage	South Australia	dc094180-56e4-4c2e-9dc7-c02ddacaa600	a2e10e85-4df7-4ec5-a973-d1a3ba5e79b9	active	\N	2014-06-27 08:01:33.446844	9999-12-31 00:00:00	t
c371c5de-39b2-4738-b635-6e38b21c9b61	9321792a-9adc-456e-86ed-41778d4c3add	Temporal Coverage	2012-13	dc094180-56e4-4c2e-9dc7-c02ddacaa600	c371c5de-39b2-4738-b635-6e38b21c9b61	active	\N	2014-06-27 08:01:33.446844	9999-12-31 00:00:00	t
0870c11b-20ee-4b37-95f5-3524f447d369	9321792a-9adc-456e-86ed-41778d4c3add	Data Location	Hosted	dc094180-56e4-4c2e-9dc7-c02ddacaa600	0870c11b-20ee-4b37-95f5-3524f447d369	active	\N	2014-06-27 08:01:33.446844	9999-12-31 00:00:00	t
9b16e6e6-aae7-4877-9416-0bb3f75768f3	9d677757-884c-4712-84f3-f98a5c8211e8	Data Status	N/A	8da8002f-9844-4885-99a4-795fd69ba8f4	9b16e6e6-aae7-4877-9416-0bb3f75768f3	active	\N	2014-07-01 23:57:13.274551	9999-12-31 00:00:00	t
e6d936d4-203d-49b1-898f-c0a4be632afa	9d677757-884c-4712-84f3-f98a5c8211e8	Geospatial Coverage	Tumby Bay (DC) Local Government Area	8da8002f-9844-4885-99a4-795fd69ba8f4	e6d936d4-203d-49b1-898f-c0a4be632afa	active	\N	2014-07-01 23:57:13.274551	9999-12-31 00:00:00	t
fe82a13a-c85b-4578-aa86-a3a23aecd8cf	9d677757-884c-4712-84f3-f98a5c8211e8	Temporal Coverage	2007-2011	8da8002f-9844-4885-99a4-795fd69ba8f4	fe82a13a-c85b-4578-aa86-a3a23aecd8cf	active	\N	2014-07-01 23:57:13.274551	9999-12-31 00:00:00	t
5cd0af70-a0e5-4fe1-95a6-c57d30394532	9d677757-884c-4712-84f3-f98a5c8211e8	Data Granularity	N/A	8da8002f-9844-4885-99a4-795fd69ba8f4	5cd0af70-a0e5-4fe1-95a6-c57d30394532	active	\N	2014-07-01 23:57:13.274551	9999-12-31 00:00:00	t
86ce8f4e-3ee8-4e3e-affb-a173af7c6574	9d677757-884c-4712-84f3-f98a5c8211e8	Update Frequency	Annually	8da8002f-9844-4885-99a4-795fd69ba8f4	86ce8f4e-3ee8-4e3e-affb-a173af7c6574	active	\N	2014-07-01 23:57:13.274551	9999-12-31 00:00:00	t
53d673bc-20ab-4750-8831-018e432e06ba	b7a2a07f-7c77-4eb8-8475-f49aa07cd147	Data Granularity	N/A	74d4b032-4bab-457a-a08e-08e592907dc9	53d673bc-20ab-4750-8831-018e432e06ba	active	\N	2014-06-26 02:59:07.702656	9999-12-31 00:00:00	t
ab5de70b-f646-4aba-aa03-66f310e3caee	b7a2a07f-7c77-4eb8-8475-f49aa07cd147	Geospatial Coverage	Limestone Coast	74d4b032-4bab-457a-a08e-08e592907dc9	ab5de70b-f646-4aba-aa03-66f310e3caee	active	\N	2014-06-26 02:59:07.702656	9999-12-31 00:00:00	t
5e6d649b-4de2-4aaa-b3e6-8328bd4c4d92	b7a2a07f-7c77-4eb8-8475-f49aa07cd147	Data Status	Active	74d4b032-4bab-457a-a08e-08e592907dc9	5e6d649b-4de2-4aaa-b3e6-8328bd4c4d92	active	\N	2014-06-26 02:59:07.702656	9999-12-31 00:00:00	t
ed0efbaf-a259-48ae-a1ca-0f4bb7a25444	b7a2a07f-7c77-4eb8-8475-f49aa07cd147	Data Location	Hosted	74d4b032-4bab-457a-a08e-08e592907dc9	ed0efbaf-a259-48ae-a1ca-0f4bb7a25444	active	\N	2014-06-26 02:59:07.702656	9999-12-31 00:00:00	t
74eb57a3-243b-428b-a266-a089909d6e9b	b7a2a07f-7c77-4eb8-8475-f49aa07cd147	Temporal Coverage	2011-12	74d4b032-4bab-457a-a08e-08e592907dc9	74eb57a3-243b-428b-a266-a089909d6e9b	active	\N	2014-06-26 02:59:07.702656	9999-12-31 00:00:00	t
2d40de5f-351b-494b-af33-31e19081ac9e	b7a2a07f-7c77-4eb8-8475-f49aa07cd147	Update Frequency	Following Census	74d4b032-4bab-457a-a08e-08e592907dc9	2d40de5f-351b-494b-af33-31e19081ac9e	active	\N	2014-06-26 02:59:07.702656	9999-12-31 00:00:00	t
5106e908-c9f1-4493-82f1-3563ca41af8d	a0b6e2c3-189e-4ce7-a6b6-348aa0028cab	Geospatial Coverage	Murray & Mallee	c74e17e9-74e8-4b60-a1d2-3f18fdee357f	5106e908-c9f1-4493-82f1-3563ca41af8d	active	\N	2014-06-26 03:06:22.192002	9999-12-31 00:00:00	t
919b1085-dff6-40ff-b464-a3a3da1400b1	a0b6e2c3-189e-4ce7-a6b6-348aa0028cab	Update Frequency	Following Census	c74e17e9-74e8-4b60-a1d2-3f18fdee357f	919b1085-dff6-40ff-b464-a3a3da1400b1	active	\N	2014-06-26 03:06:22.192002	9999-12-31 00:00:00	t
1ee2ef83-15a6-4509-8474-300e52a80edd	a0b6e2c3-189e-4ce7-a6b6-348aa0028cab	Temporal Coverage	2011-12	c74e17e9-74e8-4b60-a1d2-3f18fdee357f	1ee2ef83-15a6-4509-8474-300e52a80edd	active	\N	2014-06-26 03:06:22.192002	9999-12-31 00:00:00	t
e65de9ec-cd49-4e7d-a946-55a0217edf10	a0b6e2c3-189e-4ce7-a6b6-348aa0028cab	Data Status	Active	c74e17e9-74e8-4b60-a1d2-3f18fdee357f	e65de9ec-cd49-4e7d-a946-55a0217edf10	active	\N	2014-06-26 03:06:22.192002	9999-12-31 00:00:00	t
792ea4e5-ca3a-49a7-abe8-f474b08e8483	a0b6e2c3-189e-4ce7-a6b6-348aa0028cab	Data Location	Hosted	c74e17e9-74e8-4b60-a1d2-3f18fdee357f	792ea4e5-ca3a-49a7-abe8-f474b08e8483	active	\N	2014-06-26 03:06:22.192002	9999-12-31 00:00:00	t
a69113b2-b1a8-4cf5-8ceb-ea54020ac196	a0b6e2c3-189e-4ce7-a6b6-348aa0028cab	Data Granularity	N/A	c74e17e9-74e8-4b60-a1d2-3f18fdee357f	a69113b2-b1a8-4cf5-8ceb-ea54020ac196	active	\N	2014-06-26 03:06:22.192002	9999-12-31 00:00:00	t
0787d141-e4e1-434c-9a1a-cdbe23617e84	36dddae1-7b87-41d8-a4a0-4eed92fa6faf	Temporal Coverage	2011-12	57443a06-03de-4fb1-8cfc-266db23381c3	0787d141-e4e1-434c-9a1a-cdbe23617e84	active	\N	2014-06-26 03:11:13.88579	9999-12-31 00:00:00	t
b25cb9a2-1db2-4ab1-8d2a-0dcca97b4e22	36dddae1-7b87-41d8-a4a0-4eed92fa6faf	Geospatial Coverage	Northern Adelaide	57443a06-03de-4fb1-8cfc-266db23381c3	b25cb9a2-1db2-4ab1-8d2a-0dcca97b4e22	active	\N	2014-06-26 03:11:13.88579	9999-12-31 00:00:00	t
51916256-234a-4436-b2f9-88e01a78cf04	36dddae1-7b87-41d8-a4a0-4eed92fa6faf	Data Granularity	N/A	57443a06-03de-4fb1-8cfc-266db23381c3	51916256-234a-4436-b2f9-88e01a78cf04	active	\N	2014-06-26 03:11:13.88579	9999-12-31 00:00:00	t
506414d3-c45b-469d-b885-cedb88dada9d	36dddae1-7b87-41d8-a4a0-4eed92fa6faf	Update Frequency	Following Census	57443a06-03de-4fb1-8cfc-266db23381c3	506414d3-c45b-469d-b885-cedb88dada9d	active	\N	2014-06-26 03:11:13.88579	9999-12-31 00:00:00	t
f3cd2a12-f2bf-402a-a2a5-bc4ae6dabc57	36dddae1-7b87-41d8-a4a0-4eed92fa6faf	Data Location	Hosted	57443a06-03de-4fb1-8cfc-266db23381c3	f3cd2a12-f2bf-402a-a2a5-bc4ae6dabc57	active	\N	2014-06-26 03:11:13.88579	9999-12-31 00:00:00	t
6018d7ab-8fec-4157-9e30-57029c205947	36dddae1-7b87-41d8-a4a0-4eed92fa6faf	Data Status	Active	57443a06-03de-4fb1-8cfc-266db23381c3	6018d7ab-8fec-4157-9e30-57029c205947	active	\N	2014-06-26 03:11:13.88579	9999-12-31 00:00:00	t
a2a27928-14f1-41cb-8de6-431c9b9edd29	a88326a5-93e4-4244-99fb-68f2b11e49c7	Data Granularity	N/A	eeb8f213-e235-4165-85c2-78f6d41563fc	a2a27928-14f1-41cb-8de6-431c9b9edd29	active	\N	2014-06-26 03:15:56.879539	9999-12-31 00:00:00	t
b5e792cf-845d-465e-81de-78fa5bb8dad6	a88326a5-93e4-4244-99fb-68f2b11e49c7	Update Frequency	Following Census	eeb8f213-e235-4165-85c2-78f6d41563fc	b5e792cf-845d-465e-81de-78fa5bb8dad6	active	\N	2014-06-26 03:15:56.879539	9999-12-31 00:00:00	t
e3d31d72-4c38-4306-a7b3-e41527a46747	a88326a5-93e4-4244-99fb-68f2b11e49c7	Geospatial Coverage	South Australia	eeb8f213-e235-4165-85c2-78f6d41563fc	e3d31d72-4c38-4306-a7b3-e41527a46747	active	\N	2014-06-26 03:15:56.879539	9999-12-31 00:00:00	t
719236ad-d1c3-4a0f-a5be-4ee2e19c1fea	a88326a5-93e4-4244-99fb-68f2b11e49c7	Data Status	Active	eeb8f213-e235-4165-85c2-78f6d41563fc	719236ad-d1c3-4a0f-a5be-4ee2e19c1fea	active	\N	2014-06-26 03:15:56.879539	9999-12-31 00:00:00	t
ff759d57-c863-4568-898e-6252cb1e9fa3	a88326a5-93e4-4244-99fb-68f2b11e49c7	Data Location	Hosted	eeb8f213-e235-4165-85c2-78f6d41563fc	ff759d57-c863-4568-898e-6252cb1e9fa3	active	\N	2014-06-26 03:15:56.879539	9999-12-31 00:00:00	t
09b615f8-5182-4439-9606-8ba03e832bc6	a88326a5-93e4-4244-99fb-68f2b11e49c7	Temporal Coverage	2011-12	eeb8f213-e235-4165-85c2-78f6d41563fc	09b615f8-5182-4439-9606-8ba03e832bc6	active	\N	2014-06-26 03:15:56.879539	9999-12-31 00:00:00	t
b6ffaeff-7d77-4164-a7f4-13fe3b6f59a9	c1ee506e-432e-4d89-8cc8-77a5572a3544	Data Location	Hosted	e8d774de-1205-4f07-906a-333aefd4a9a3	b6ffaeff-7d77-4164-a7f4-13fe3b6f59a9	active	\N	2014-06-26 03:19:23.32678	9999-12-31 00:00:00	t
395df392-c920-4d0d-a01c-68c049c6f852	c1ee506e-432e-4d89-8cc8-77a5572a3544	Update Frequency	Following Census	e8d774de-1205-4f07-906a-333aefd4a9a3	395df392-c920-4d0d-a01c-68c049c6f852	active	\N	2014-06-26 03:19:23.32678	9999-12-31 00:00:00	t
a2a41e44-3a71-4bed-8fb9-56f16347c09b	c1ee506e-432e-4d89-8cc8-77a5572a3544	Temporal Coverage	2011-12	e8d774de-1205-4f07-906a-333aefd4a9a3	a2a41e44-3a71-4bed-8fb9-56f16347c09b	active	\N	2014-06-26 03:19:23.32678	9999-12-31 00:00:00	t
f82b2ffe-bcaa-45ed-9fa0-778e2b71fe1c	c1ee506e-432e-4d89-8cc8-77a5572a3544	Data Status	Active	e8d774de-1205-4f07-906a-333aefd4a9a3	f82b2ffe-bcaa-45ed-9fa0-778e2b71fe1c	active	\N	2014-06-26 03:19:23.32678	9999-12-31 00:00:00	t
4b07482c-ffe0-4212-bfda-1e04860baa37	c1ee506e-432e-4d89-8cc8-77a5572a3544	Data Granularity	N/A	e8d774de-1205-4f07-906a-333aefd4a9a3	4b07482c-ffe0-4212-bfda-1e04860baa37	active	\N	2014-06-26 03:19:23.32678	9999-12-31 00:00:00	t
825689e9-23aa-42d8-b018-fdedd5324e38	c1ee506e-432e-4d89-8cc8-77a5572a3544	Geospatial Coverage	Southern Adelaide	e8d774de-1205-4f07-906a-333aefd4a9a3	825689e9-23aa-42d8-b018-fdedd5324e38	active	\N	2014-06-26 03:19:23.32678	9999-12-31 00:00:00	t
6d040491-b106-4ea3-999c-41ebe282d662	e98ead99-1bbd-427a-8aa5-208d8e860360	Update Frequency	Annually	cf7c788f-b313-43f1-8b20-de17bf2b9fa7	6d040491-b106-4ea3-999c-41ebe282d662	active	\N	2014-06-27 00:40:31.868974	9999-12-31 00:00:00	t
b4d72865-2b60-42bb-952f-9b0a31387baf	e98ead99-1bbd-427a-8aa5-208d8e860360	Data Granularity	n/a	cf7c788f-b313-43f1-8b20-de17bf2b9fa7	b4d72865-2b60-42bb-952f-9b0a31387baf	active	\N	2014-06-27 00:40:31.868974	9999-12-31 00:00:00	t
27c2bd7b-dd27-466b-b606-6dc566be4ae2	e98ead99-1bbd-427a-8aa5-208d8e860360	Data Location	South Australia	cf7c788f-b313-43f1-8b20-de17bf2b9fa7	27c2bd7b-dd27-466b-b606-6dc566be4ae2	active	\N	2014-06-27 00:40:31.868974	9999-12-31 00:00:00	t
994af068-af24-4519-b16f-3b6f95f36dac	e98ead99-1bbd-427a-8aa5-208d8e860360	Geospatial Coverage	South Australia	cf7c788f-b313-43f1-8b20-de17bf2b9fa7	994af068-af24-4519-b16f-3b6f95f36dac	active	\N	2014-06-27 00:40:31.868974	9999-12-31 00:00:00	t
d72c3b3d-dfd4-4ea8-b299-49de338adbb4	e98ead99-1bbd-427a-8aa5-208d8e860360	Data Status	Active	cf7c788f-b313-43f1-8b20-de17bf2b9fa7	d72c3b3d-dfd4-4ea8-b299-49de338adbb4	active	\N	2014-06-27 00:40:31.868974	9999-12-31 00:00:00	t
f1189557-b8dc-4a31-8765-975d26d4d874	e98ead99-1bbd-427a-8aa5-208d8e860360	Temporal Coverage	2011-2012	cf7c788f-b313-43f1-8b20-de17bf2b9fa7	f1189557-b8dc-4a31-8765-975d26d4d874	active	\N	2014-06-27 00:40:31.868974	9999-12-31 00:00:00	t
b3f96567-095a-4c3a-a79e-55061ddab134	8b48d402-899c-46fc-8b2e-6628a3f0dad4	Data Granularity	N/A	9b2772fd-ab26-421b-99c3-d153067fae10	b3f96567-095a-4c3a-a79e-55061ddab134	active	\N	2014-06-26 03:22:42.088296	9999-12-31 00:00:00	t
3fe7eb2d-ccc3-4f97-8a7a-1daf293204d1	8b48d402-899c-46fc-8b2e-6628a3f0dad4	Update Frequency	Following Census	9b2772fd-ab26-421b-99c3-d153067fae10	3fe7eb2d-ccc3-4f97-8a7a-1daf293204d1	active	\N	2014-06-26 03:22:42.088296	9999-12-31 00:00:00	t
06270e77-663d-46f4-9628-21f6de72fcc5	8b48d402-899c-46fc-8b2e-6628a3f0dad4	Data Status	Active	9b2772fd-ab26-421b-99c3-d153067fae10	06270e77-663d-46f4-9628-21f6de72fcc5	active	\N	2014-06-26 03:22:42.088296	9999-12-31 00:00:00	t
879008e8-f79b-4da4-85a3-331d0d737d96	8b48d402-899c-46fc-8b2e-6628a3f0dad4	Temporal Coverage	2011-12	9b2772fd-ab26-421b-99c3-d153067fae10	879008e8-f79b-4da4-85a3-331d0d737d96	active	\N	2014-06-26 03:22:42.088296	9999-12-31 00:00:00	t
6c529623-d4bb-48a9-8db4-95bf825e99ea	8b48d402-899c-46fc-8b2e-6628a3f0dad4	Geospatial Coverage	Western Adelaide	9b2772fd-ab26-421b-99c3-d153067fae10	6c529623-d4bb-48a9-8db4-95bf825e99ea	active	\N	2014-06-26 03:22:42.088296	9999-12-31 00:00:00	t
c93f9cee-ce28-40a9-bb8a-9fcbd3562cd7	8b48d402-899c-46fc-8b2e-6628a3f0dad4	Data Location	Hosted	9b2772fd-ab26-421b-99c3-d153067fae10	c93f9cee-ce28-40a9-bb8a-9fcbd3562cd7	active	\N	2014-06-26 03:22:42.088296	9999-12-31 00:00:00	t
49be3124-560f-4296-baf4-63787bf4df6b	9321792a-9adc-456e-86ed-41778d4c3add	Data Granularity	N/A	dc094180-56e4-4c2e-9dc7-c02ddacaa600	49be3124-560f-4296-baf4-63787bf4df6b	active	\N	2014-06-27 08:01:33.446844	9999-12-31 00:00:00	t
f6711d57-6779-4198-b6cf-031b0cfe5300	9321792a-9adc-456e-86ed-41778d4c3add	Data Status	Active	dc094180-56e4-4c2e-9dc7-c02ddacaa600	f6711d57-6779-4198-b6cf-031b0cfe5300	active	\N	2014-06-27 08:01:33.446844	9999-12-31 00:00:00	t
7b12dbe7-d56b-45a2-8241-08a5b4e096b1	9321792a-9adc-456e-86ed-41778d4c3add	Update Frequency	Annually	dc094180-56e4-4c2e-9dc7-c02ddacaa600	7b12dbe7-d56b-45a2-8241-08a5b4e096b1	active	\N	2014-06-27 08:01:33.446844	9999-12-31 00:00:00	t
85467f0f-893d-43a8-8333-964351f7d1b2	c528d5d1-4784-4680-b10b-d61196d4e93b	Data Location	Linked	8c0e9612-6533-4263-b035-ccd94aa87648	85467f0f-893d-43a8-8333-964351f7d1b2	active	\N	2014-07-01 05:47:08.597156	9999-12-31 00:00:00	t
be8c7cef-696d-46e3-9280-d708e5def32d	ddaf72fe-8023-46b0-9aaa-b865d1371634	Update Frequency	Annually	9d39b698-de4f-4dd5-8fd1-1d764053f882	be8c7cef-696d-46e3-9280-d708e5def32d	active	\N	2014-06-27 08:17:10.51028	9999-12-31 00:00:00	t
e0e5403e-2181-44bf-9c07-78cb15d6dd79	ddaf72fe-8023-46b0-9aaa-b865d1371634	Data Location	Hosted	9d39b698-de4f-4dd5-8fd1-1d764053f882	e0e5403e-2181-44bf-9c07-78cb15d6dd79	active	\N	2014-06-27 08:17:10.51028	9999-12-31 00:00:00	t
59615823-0c11-4c97-8a6d-0df64c39488c	ddaf72fe-8023-46b0-9aaa-b865d1371634	Data Granularity	N/A	9d39b698-de4f-4dd5-8fd1-1d764053f882	59615823-0c11-4c97-8a6d-0df64c39488c	active	\N	2014-06-27 08:17:10.51028	9999-12-31 00:00:00	t
22c11bf1-4193-4cc1-b18f-ae9ad92e3322	ddaf72fe-8023-46b0-9aaa-b865d1371634	Geospatial Coverage	South Australia	9d39b698-de4f-4dd5-8fd1-1d764053f882	22c11bf1-4193-4cc1-b18f-ae9ad92e3322	active	\N	2014-06-27 08:17:10.51028	9999-12-31 00:00:00	t
539f290b-cb40-427b-906f-c2ee523680b0	ddaf72fe-8023-46b0-9aaa-b865d1371634	Temporal Coverage	2012-13	9d39b698-de4f-4dd5-8fd1-1d764053f882	539f290b-cb40-427b-906f-c2ee523680b0	active	\N	2014-06-27 08:17:10.51028	9999-12-31 00:00:00	t
75f500a5-c104-4d80-9625-cf98d6c9902d	ddaf72fe-8023-46b0-9aaa-b865d1371634	Data Status	Active	9d39b698-de4f-4dd5-8fd1-1d764053f882	75f500a5-c104-4d80-9625-cf98d6c9902d	active	\N	2014-06-27 08:17:10.51028	9999-12-31 00:00:00	t
615585c0-24a1-4777-9196-527a43b90b9e	7a4cded5-df88-4011-9594-8089046249f2	Update Frequency	Daily	d9dc52d1-50cc-47bb-bfb1-7962630b4b51	615585c0-24a1-4777-9196-527a43b90b9e	active	\N	2014-06-30 06:19:04.484607	9999-12-31 00:00:00	t
c8aa1663-5688-4e02-af50-4408dcbf2a71	59b8332c-00c7-41d6-83cb-ddb337dd94a9	Update Frequency	Daily	ee58e737-33ba-4cc4-b255-160e94e7ce2d	c8aa1663-5688-4e02-af50-4408dcbf2a71	active	\N	2014-06-30 06:26:41.569598	9999-12-31 00:00:00	t
2e66629b-9faa-4973-9325-b30dff990c27	1a6455df-e2e3-41a6-a913-59ab78efb28a	Update Frequency	Daily	836121ca-4dc5-41e3-b8d0-7e0fc29888fb	2e66629b-9faa-4973-9325-b30dff990c27	active	\N	2014-06-30 06:30:30.464658	9999-12-31 00:00:00	t
b2627a84-cef6-415d-acff-6db6f49ef4e0	a5bfa273-6c42-47c0-b296-dfb9cdadfb1b	Update Frequency	Daily	ca43f4b0-c889-46ce-b86c-1fa3c4d787da	b2627a84-cef6-415d-acff-6db6f49ef4e0	active	\N	2014-06-30 06:36:02.426522	9999-12-31 00:00:00	t
495091e5-5e2c-4037-9ea5-b342de0086a9	bf4ff02b-ac11-4bd9-8c1a-482a75be63b1	Update Frequency	Daily	8acb2393-50c0-4f5d-be2d-98ecf26fe055	495091e5-5e2c-4037-9ea5-b342de0086a9	active	\N	2014-06-30 06:44:09.182147	9999-12-31 00:00:00	t
e966cc9c-a31c-425a-b0e8-866ed2462b7d	c4aa41bd-b63e-4d95-9c49-ea2d774c6c8a	Update Frequency	Daily	ac63ce85-efd8-4eaf-9da0-6ce465d619fd	e966cc9c-a31c-425a-b0e8-866ed2462b7d	active	\N	2014-06-30 06:52:23.31513	9999-12-31 00:00:00	t
96dd3c1b-f13c-45f2-93ae-7d8f69a2dca0	a28f8a1b-3074-4d7c-b8f1-14690fc81caa	Update Frequency	Daily	fe1d9441-28cd-4dd6-9a16-b0afa34e1385	96dd3c1b-f13c-45f2-93ae-7d8f69a2dca0	active	\N	2014-06-30 06:58:21.615653	9999-12-31 00:00:00	t
1cbc1397-0747-4bb2-84f8-f29080c686c4	3e7b3597-20f8-40ec-9e01-e7bba2383ed5	Update Frequency	Daily	75ea78f7-de00-44ad-b694-edd4041c69a5	1cbc1397-0747-4bb2-84f8-f29080c686c4	active	\N	2014-06-30 07:04:03.468816	9999-12-31 00:00:00	t
cf588e4e-138c-46da-9d3d-dd7654f73e44	0811fefc-637d-4542-a5d3-1a69ce5a5c21	Data Location	Hosted	9df87f60-d877-4736-b1d4-899980886f96	cf588e4e-138c-46da-9d3d-dd7654f73e44	active	\N	2014-06-26 05:11:39.434832	9999-12-31 00:00:00	t
1b2b583a-7168-4098-8bfb-0bda6150b7f7	0811fefc-637d-4542-a5d3-1a69ce5a5c21	Update Frequency	Ad-hoc	9df87f60-d877-4736-b1d4-899980886f96	1b2b583a-7168-4098-8bfb-0bda6150b7f7	active	\N	2014-06-26 05:11:39.434832	9999-12-31 00:00:00	t
7a0246ca-d891-4e2f-a4ad-144b86020152	0811fefc-637d-4542-a5d3-1a69ce5a5c21	Geospatial Coverage	South Australia	9df87f60-d877-4736-b1d4-899980886f96	7a0246ca-d891-4e2f-a4ad-144b86020152	active	\N	2014-06-26 05:11:39.434832	9999-12-31 00:00:00	t
b0a03dce-7548-46e8-89f9-b11664561557	0811fefc-637d-4542-a5d3-1a69ce5a5c21	Temporal Coverage	2012-June 2014	9df87f60-d877-4736-b1d4-899980886f96	b0a03dce-7548-46e8-89f9-b11664561557	active	\N	2014-06-26 05:11:39.434832	9999-12-31 00:00:00	t
23bae8c2-e465-4c20-9250-f70abff1732e	0811fefc-637d-4542-a5d3-1a69ce5a5c21	Data Status	Active	9df87f60-d877-4736-b1d4-899980886f96	23bae8c2-e465-4c20-9250-f70abff1732e	active	\N	2014-06-26 05:11:39.434832	9999-12-31 00:00:00	t
a37fc933-a3bf-4724-968b-b1ca4a2dec32	0811fefc-637d-4542-a5d3-1a69ce5a5c21	Data Granularity	Emergency service locations by land parcel location	9df87f60-d877-4736-b1d4-899980886f96	a37fc933-a3bf-4724-968b-b1ca4a2dec32	active	\N	2014-06-26 05:11:39.434832	9999-12-31 00:00:00	t
e19ee125-3c6a-48e4-bd05-1dc777e4f3f6	c4c7be62-7dba-43c1-afc3-856d684fa247	Data Status	Active	71870207-f12b-409d-bda4-875de0ce62ae	e19ee125-3c6a-48e4-bd05-1dc777e4f3f6	active	\N	2014-06-26 05:21:22.496678	9999-12-31 00:00:00	t
6e36efe9-f814-4fa8-a210-dcf2bbd06780	25e3e0bc-23bf-445c-993b-565857e669b8	Update Frequency	Annually	17115bf6-ac61-4b50-b5c3-cd305407252e	6e36efe9-f814-4fa8-a210-dcf2bbd06780	active	\N	2014-06-27 00:45:49.956399	9999-12-31 00:00:00	t
31cc181d-33d8-4bfb-913f-e765131b5f3c	c4c7be62-7dba-43c1-afc3-856d684fa247	Data Location	Hosted	71870207-f12b-409d-bda4-875de0ce62ae	31cc181d-33d8-4bfb-913f-e765131b5f3c	active	\N	2014-06-26 05:21:22.496678	9999-12-31 00:00:00	t
84d7927e-c7d7-46c5-a6f8-7ffe6888d03c	c4c7be62-7dba-43c1-afc3-856d684fa247	Temporal Coverage	2009-14	71870207-f12b-409d-bda4-875de0ce62ae	84d7927e-c7d7-46c5-a6f8-7ffe6888d03c	active	\N	2014-06-26 05:21:22.496678	9999-12-31 00:00:00	t
678a466d-2a47-4572-af81-4131b4b5856b	c4c7be62-7dba-43c1-afc3-856d684fa247	Update Frequency	Annually	71870207-f12b-409d-bda4-875de0ce62ae	678a466d-2a47-4572-af81-4131b4b5856b	active	\N	2014-06-26 05:21:22.496678	9999-12-31 00:00:00	t
3a3f81bc-e975-468d-ae77-55103300526c	c4c7be62-7dba-43c1-afc3-856d684fa247	Geospatial Coverage	South Australia	71870207-f12b-409d-bda4-875de0ce62ae	3a3f81bc-e975-468d-ae77-55103300526c	active	\N	2014-06-26 05:21:22.496678	9999-12-31 00:00:00	t
86d1b6ca-21a5-471c-84cd-ac025ba1d678	25e3e0bc-23bf-445c-993b-565857e669b8	Data Status	Active	17115bf6-ac61-4b50-b5c3-cd305407252e	86d1b6ca-21a5-471c-84cd-ac025ba1d678	active	\N	2014-06-27 00:45:49.956399	9999-12-31 00:00:00	t
f15a8c8d-219e-4464-a9cc-af6a47cc5200	25e3e0bc-23bf-445c-993b-565857e669b8	Geospatial Coverage	South Australia	17115bf6-ac61-4b50-b5c3-cd305407252e	f15a8c8d-219e-4464-a9cc-af6a47cc5200	active	\N	2014-06-27 00:45:49.956399	9999-12-31 00:00:00	t
a35da3ba-2182-43f0-b85f-59abd9249593	c4c7be62-7dba-43c1-afc3-856d684fa247	Data Granularity	Weekly summary	71870207-f12b-409d-bda4-875de0ce62ae	a35da3ba-2182-43f0-b85f-59abd9249593	active	62c75cf8-d610-444f-9400-ae5b0702062d	2014-06-26 05:21:22.496678	2014-06-26 05:23:03.066299	f
a35da3ba-2182-43f0-b85f-59abd9249593	c4c7be62-7dba-43c1-afc3-856d684fa247	Data Granularity	Yearly	62c75cf8-d610-444f-9400-ae5b0702062d	a35da3ba-2182-43f0-b85f-59abd9249593	active	\N	2014-06-26 05:23:03.066299	9999-12-31 00:00:00	t
659e087a-815d-4e41-bfb0-e39917bb9dae	25e3e0bc-23bf-445c-993b-565857e669b8	Data Location	South Australia	17115bf6-ac61-4b50-b5c3-cd305407252e	659e087a-815d-4e41-bfb0-e39917bb9dae	active	\N	2014-06-27 00:45:49.956399	9999-12-31 00:00:00	t
4a400e90-766a-42fc-bd66-f63b7897f64e	25e3e0bc-23bf-445c-993b-565857e669b8	Temporal Coverage	2012-2013	17115bf6-ac61-4b50-b5c3-cd305407252e	4a400e90-766a-42fc-bd66-f63b7897f64e	active	\N	2014-06-27 00:45:49.956399	9999-12-31 00:00:00	t
446dfa27-99a2-40e9-a9da-c04f1ab8b9f2	25e3e0bc-23bf-445c-993b-565857e669b8	Data Granularity	n/a	17115bf6-ac61-4b50-b5c3-cd305407252e	446dfa27-99a2-40e9-a9da-c04f1ab8b9f2	active	\N	2014-06-27 00:45:49.956399	9999-12-31 00:00:00	t
e9c16d83-8c94-40c3-85a9-7cf1a3e6320a	a66a6e64-e38d-4f34-af4d-41d556d8daa6	Update Frequency	Daily	bb4148e1-0dcb-4b63-a08f-673aced8c3de	e9c16d83-8c94-40c3-85a9-7cf1a3e6320a	active	\N	2014-06-27 00:48:24.308768	9999-12-31 00:00:00	t
14ac4cad-7627-4718-9af7-1b590dae69e4	b117944b-2ff8-4b28-811e-7c7fb32b2fc3	Temporal Coverage	2009-14	0b178e30-134b-4c18-a575-5b2665cf4e3a	14ac4cad-7627-4718-9af7-1b590dae69e4	active	\N	2014-06-26 05:29:09.741956	9999-12-31 00:00:00	t
ad9a0baa-cf15-4dcd-9278-74ac3cd6a356	b117944b-2ff8-4b28-811e-7c7fb32b2fc3	Geospatial Coverage	South Australia	0b178e30-134b-4c18-a575-5b2665cf4e3a	ad9a0baa-cf15-4dcd-9278-74ac3cd6a356	active	\N	2014-06-26 05:29:09.741956	9999-12-31 00:00:00	t
9c5d0dba-ad14-4f7e-909b-90db8e416589	b117944b-2ff8-4b28-811e-7c7fb32b2fc3	Data Granularity	Daily	0b178e30-134b-4c18-a575-5b2665cf4e3a	9c5d0dba-ad14-4f7e-909b-90db8e416589	active	\N	2014-06-26 05:29:09.741956	9999-12-31 00:00:00	t
04028e98-1042-4c1d-bad4-f58b984d781d	b117944b-2ff8-4b28-811e-7c7fb32b2fc3	Data Status	Active	0b178e30-134b-4c18-a575-5b2665cf4e3a	04028e98-1042-4c1d-bad4-f58b984d781d	active	\N	2014-06-26 05:29:09.741956	9999-12-31 00:00:00	t
2a78a229-e87f-4678-a8bd-660fd1dbb55c	b117944b-2ff8-4b28-811e-7c7fb32b2fc3	Update Frequency	Annually	0b178e30-134b-4c18-a575-5b2665cf4e3a	2a78a229-e87f-4678-a8bd-660fd1dbb55c	active	\N	2014-06-26 05:29:09.741956	9999-12-31 00:00:00	t
d737572b-f611-439f-91ba-38da5bd3a0cf	b117944b-2ff8-4b28-811e-7c7fb32b2fc3	Data Location	Hosted	0b178e30-134b-4c18-a575-5b2665cf4e3a	d737572b-f611-439f-91ba-38da5bd3a0cf	active	\N	2014-06-26 05:29:09.741956	9999-12-31 00:00:00	t
226451b0-b9f4-416d-bff2-ae2df6c8eafc	4b3ef678-2b77-452a-9d31-e06c5c14350a	Update Frequency	Daily	982a8d57-8065-4b0b-972e-bc7f4f994eec	226451b0-b9f4-416d-bff2-ae2df6c8eafc	active	\N	2014-06-27 00:52:17.640596	9999-12-31 00:00:00	t
c909ebf0-9e2c-4f89-a012-4883145d4428	685fe0a0-f030-4a6c-a593-f7d4cdc102af	Update Frequency	Daily	6e94a6b3-2282-4d2e-aaed-52aef100481e	c909ebf0-9e2c-4f89-a012-4883145d4428	active	\N	2014-06-27 00:57:26.660537	9999-12-31 00:00:00	t
4c9ed7d3-3734-4218-a068-8d3679808840	1bfdf821-9785-409e-954a-e903b4ae7720	Update Frequency	Daily	fdc41f3b-6f04-407e-b694-3b818a1a4ded	4c9ed7d3-3734-4218-a068-8d3679808840	active	\N	2014-06-27 01:04:47.692152	9999-12-31 00:00:00	t
f8f93ff3-1199-4b9a-8205-a6c4178f81ca	a21e9c5d-b7d6-4476-909b-9bed0e3ae2a1	Update Frequency	Daily	7ab867c0-d014-4154-b683-76af21d38559	f8f93ff3-1199-4b9a-8205-a6c4178f81ca	active	\N	2014-06-27 01:10:35.399129	9999-12-31 00:00:00	t
a2f65345-ce57-4e69-a5cc-cd97b8a2e37d	6579e818-e701-4b51-8f97-f1b0e633b24c	Update Frequency	Daily	4405f01b-371f-48ea-8bba-e900f91fdd96	a2f65345-ce57-4e69-a5cc-cd97b8a2e37d	active	\N	2014-06-27 01:16:46.192944	9999-12-31 00:00:00	t
fa07848a-dd3b-4204-83cf-82724f48f62c	3a6206db-9ca3-4071-b719-041fb8d83741	Update Frequency	Daily	07c6e75b-4763-4d95-a3a1-6c59773725b1	fa07848a-dd3b-4204-83cf-82724f48f62c	active	\N	2014-06-27 02:46:14.891789	9999-12-31 00:00:00	t
78257b41-98ae-4895-8a5d-88f0df776edc	bee847fb-5e51-4d7d-a7aa-508a10cee996	Update Frequency	Daily	208dc9c0-ac06-4764-a425-453251f1a192	78257b41-98ae-4895-8a5d-88f0df776edc	active	\N	2014-06-30 07:29:01.791255	9999-12-31 00:00:00	t
eb165587-8986-4e39-b647-18a7f6116996	c528d5d1-4784-4680-b10b-d61196d4e93b	Data Status	N/A	8c0e9612-6533-4263-b035-ccd94aa87648	eb165587-8986-4e39-b647-18a7f6116996	active	\N	2014-07-01 05:47:08.597156	9999-12-31 00:00:00	t
ee5947a6-ccda-4b62-8497-6f320664e160	7d61bd9c-c5ea-493f-8eb2-7299d494ce84	Update Frequency	Daily	a5a53e7e-ba33-44c6-acaa-ddc22f8d7091	ee5947a6-ccda-4b62-8497-6f320664e160	active	\N	2014-06-30 07:39:20.136905	9999-12-31 00:00:00	t
6288e0ff-20e2-4865-bb31-ee524422b422	c528d5d1-4784-4680-b10b-d61196d4e93b	Geospatial Coverage	Alexandrina (DC) Local Government Area	8c0e9612-6533-4263-b035-ccd94aa87648	6288e0ff-20e2-4865-bb31-ee524422b422	active	\N	2014-07-01 05:47:08.597156	9999-12-31 00:00:00	t
c6fba0ae-89ba-409d-b0b3-2f003a37911e	bb93b833-80f7-4bee-8abb-7a5307eac4e6	Update Frequency	Daily	37b76513-930c-41eb-9438-b0487b59626c	c6fba0ae-89ba-409d-b0b3-2f003a37911e	active	\N	2014-06-30 07:51:15.237738	9999-12-31 00:00:00	t
297b5699-3c6f-494f-b30d-b45ef3947bbb	c528d5d1-4784-4680-b10b-d61196d4e93b	Data Granularity	N/A	8c0e9612-6533-4263-b035-ccd94aa87648	297b5699-3c6f-494f-b30d-b45ef3947bbb	active	\N	2014-07-01 05:47:08.597156	9999-12-31 00:00:00	t
644d8231-e0bb-4767-a909-0765adda5c87	c528d5d1-4784-4680-b10b-d61196d4e93b	Temporal Coverage	2007-2011	8c0e9612-6533-4263-b035-ccd94aa87648	644d8231-e0bb-4767-a909-0765adda5c87	active	\N	2014-07-01 05:47:08.597156	9999-12-31 00:00:00	t
d785dadc-1ac8-4be3-a47c-a1b59aed6cd3	c528d5d1-4784-4680-b10b-d61196d4e93b	Update Frequency	Annually	8c0e9612-6533-4263-b035-ccd94aa87648	d785dadc-1ac8-4be3-a47c-a1b59aed6cd3	active	\N	2014-07-01 05:47:08.597156	9999-12-31 00:00:00	t
820f0aee-b6dc-4405-bced-45fc25182052	9d677757-884c-4712-84f3-f98a5c8211e8	Data Location	Linked	8da8002f-9844-4885-99a4-795fd69ba8f4	820f0aee-b6dc-4405-bced-45fc25182052	active	\N	2014-07-01 23:57:13.274551	9999-12-31 00:00:00	t
fc478b2d-8b52-4285-ae12-d51037773fb0	3604e917-c1d1-4111-9d56-b3705091d40c	Data Status	N/A	ba0b0a8d-fc10-4b58-9058-1befe7a8a051	fc478b2d-8b52-4285-ae12-d51037773fb0	active	\N	2014-07-01 23:14:40.980492	9999-12-31 00:00:00	t
b52dc010-dfa8-4689-a7c4-eb6a248b42ef	3604e917-c1d1-4111-9d56-b3705091d40c	Temporal Coverage	2007-2011	ba0b0a8d-fc10-4b58-9058-1befe7a8a051	b52dc010-dfa8-4689-a7c4-eb6a248b42ef	active	\N	2014-07-01 23:14:40.980492	9999-12-31 00:00:00	t
2e14063d-61fd-4bbc-a0bd-e388d648585c	4ecfa227-ace7-447a-bd68-fff8292c8894	Update Frequency	As Required	d5fd644b-7b74-4167-a273-6f87c2293b8e	2e14063d-61fd-4bbc-a0bd-e388d648585c	active	\N	2014-07-03 02:44:45.412948	9999-12-31 00:00:00	t
418e96d7-8fd8-4224-8d67-250733745c36	3604e917-c1d1-4111-9d56-b3705091d40c	Geospatial Coverage	Mitchum	ba0b0a8d-fc10-4b58-9058-1befe7a8a051	418e96d7-8fd8-4224-8d67-250733745c36	active	\N	2014-07-01 23:14:40.980492	9999-12-31 00:00:00	t
2d90a4d2-d25b-48d1-b44a-d6710450771c	3604e917-c1d1-4111-9d56-b3705091d40c	Update Frequency	Annually	ba0b0a8d-fc10-4b58-9058-1befe7a8a051	2d90a4d2-d25b-48d1-b44a-d6710450771c	active	\N	2014-07-01 23:14:40.980492	9999-12-31 00:00:00	t
be4072eb-db30-40f5-bf06-5b18283c208a	3604e917-c1d1-4111-9d56-b3705091d40c	Data Granularity	N/A	ba0b0a8d-fc10-4b58-9058-1befe7a8a051	be4072eb-db30-40f5-bf06-5b18283c208a	active	\N	2014-07-01 23:14:40.980492	9999-12-31 00:00:00	t
79ee0134-c8b4-486a-90d5-28969c28ebb7	f4f90064-c1cd-4a1d-a569-e8d370e71e42	Geospatial Coverage	Naracoorte and Lucindale	38c7d3f9-d14a-42a4-a4ce-a5b7475410b6	79ee0134-c8b4-486a-90d5-28969c28ebb7	active	\N	2014-07-01 23:26:05.313928	9999-12-31 00:00:00	t
b1a01c4a-a7b3-41f3-96dd-6a9f3ff96fa2	f4f90064-c1cd-4a1d-a569-e8d370e71e42	Data Status	N/A	38c7d3f9-d14a-42a4-a4ce-a5b7475410b6	b1a01c4a-a7b3-41f3-96dd-6a9f3ff96fa2	active	\N	2014-07-01 23:26:05.313928	9999-12-31 00:00:00	t
d90b7e2a-477a-471d-91d3-9a26523eb22b	4ecfa227-ace7-447a-bd68-fff8292c8894	Data Granularity	N/A	d5fd644b-7b74-4167-a273-6f87c2293b8e	d90b7e2a-477a-471d-91d3-9a26523eb22b	active	\N	2014-07-03 02:44:45.412948	9999-12-31 00:00:00	t
ce121eb4-34d3-4a2c-9c63-9a110bd2d4f0	ea1cb8f9-d6ec-4da9-9346-54b58218b005	Data Location	Link	5f5bf4a0-66c7-47c5-b2e1-8fdb2ee74950	ce121eb4-34d3-4a2c-9c63-9a110bd2d4f0	active	\N	2014-07-01 23:37:20.833184	9999-12-31 00:00:00	t
bc9917ac-4084-434c-899b-6f8a8abd8768	1442cec5-dd1f-427e-a12a-4839f3379bd4	Data Location	Linked	bbe60767-bca9-4d67-b586-9be7ebf7be17	bc9917ac-4084-434c-899b-6f8a8abd8768	active	\N	2014-07-02 00:01:53.084624	9999-12-31 00:00:00	t
bc9917ac-4084-434c-899b-6f8a8abd8768	1442cec5-dd1f-427e-a12a-4839f3379bd4	Data Location	Link	5d31663f-9897-43fc-8698-31c5cfabaf8f	bc9917ac-4084-434c-899b-6f8a8abd8768	active	bbe60767-bca9-4d67-b586-9be7ebf7be17	2014-07-01 23:39:53.749864	2014-07-02 00:01:53.084624	f
c928c9b0-c36e-4aed-ba2f-74ef4e092c5b	2984bbc7-ad05-4489-952e-15f8aed49e69	Data Location	Linked	f4da0381-8bd6-4f27-93ab-6246dc40f88b	c928c9b0-c36e-4aed-ba2f-74ef4e092c5b	active	\N	2014-07-01 23:40:04.955169	9999-12-31 00:00:00	t
18aea915-f3a7-420a-ba87-0ed78bc3772c	2984bbc7-ad05-4489-952e-15f8aed49e69	Geospatial Coverage	Clare and Gilbert Valleys (DC) Local Government Area	f4da0381-8bd6-4f27-93ab-6246dc40f88b	18aea915-f3a7-420a-ba87-0ed78bc3772c	active	\N	2014-07-01 23:40:04.955169	9999-12-31 00:00:00	t
3259a89d-f30a-40f6-8714-f3a0ac1bbc33	2984bbc7-ad05-4489-952e-15f8aed49e69	Temporal Coverage	2007-2011	f4da0381-8bd6-4f27-93ab-6246dc40f88b	3259a89d-f30a-40f6-8714-f3a0ac1bbc33	active	\N	2014-07-01 23:40:04.955169	9999-12-31 00:00:00	t
b9adedcc-b02a-4ce2-a42e-0b900637f2a4	2984bbc7-ad05-4489-952e-15f8aed49e69	Update Frequency	Annually	f4da0381-8bd6-4f27-93ab-6246dc40f88b	b9adedcc-b02a-4ce2-a42e-0b900637f2a4	active	\N	2014-07-01 23:40:04.955169	9999-12-31 00:00:00	t
c0ff799e-271f-46ca-93e6-35cbb97d8d4d	2984bbc7-ad05-4489-952e-15f8aed49e69	Data Status	N/A	f4da0381-8bd6-4f27-93ab-6246dc40f88b	c0ff799e-271f-46ca-93e6-35cbb97d8d4d	active	\N	2014-07-01 23:40:04.955169	9999-12-31 00:00:00	t
146fcb33-866b-42cf-9740-3aed46f1540f	2984bbc7-ad05-4489-952e-15f8aed49e69	Data Granularity	N/A	f4da0381-8bd6-4f27-93ab-6246dc40f88b	146fcb33-866b-42cf-9740-3aed46f1540f	active	\N	2014-07-01 23:40:04.955169	9999-12-31 00:00:00	t
6398f3f3-1899-43a9-a79e-9e506f5f89c7	c56c892a-9179-4eb1-8a0d-35e5f9f58ec5	Data Location	Link	5abeb10b-7a7f-4982-98a0-de7878f70327	6398f3f3-1899-43a9-a79e-9e506f5f89c7	active	f767f968-33aa-43a3-b433-e52dea0531e3	2014-07-01 23:58:51.32109	2014-07-02 00:47:41.413018	f
e42f9bc9-1620-4341-b901-b189c60005eb	3f1332e3-ce09-4b87-99a5-0c92334e86f9	Data Granularity	N/A	92c8e982-45c5-430f-bf06-5e499e217a33	e42f9bc9-1620-4341-b901-b189c60005eb	active	\N	2014-07-01 23:40:35.788822	9999-12-31 00:00:00	t
666e6b41-8c9e-45cf-af9d-f4ceac4960a4	3f1332e3-ce09-4b87-99a5-0c92334e86f9	Geospatial Coverage	Tatiara (DC) Local Government Area	92c8e982-45c5-430f-bf06-5e499e217a33	666e6b41-8c9e-45cf-af9d-f4ceac4960a4	active	\N	2014-07-01 23:40:35.788822	9999-12-31 00:00:00	t
263fa461-e4d5-43d5-bd7a-c9cb78440ed6	3f1332e3-ce09-4b87-99a5-0c92334e86f9	Data Location	Linked	92c8e982-45c5-430f-bf06-5e499e217a33	263fa461-e4d5-43d5-bd7a-c9cb78440ed6	active	\N	2014-07-01 23:40:35.788822	9999-12-31 00:00:00	t
50e59923-16fd-4f8d-98f0-9f80d3c8c65e	3604e917-c1d1-4111-9d56-b3705091d40c	Data Location	Hosted	ba0b0a8d-fc10-4b58-9058-1befe7a8a051	50e59923-16fd-4f8d-98f0-9f80d3c8c65e	active	a554f89d-4d05-4e4d-bd0c-1faf7a7023eb	2014-07-01 23:14:40.980492	2014-07-01 23:45:08.404936	f
6d036e27-b452-46c6-9812-8d149ca4a84a	4ecfa227-ace7-447a-bd68-fff8292c8894	Data Status	Active	d5fd644b-7b74-4167-a273-6f87c2293b8e	6d036e27-b452-46c6-9812-8d149ca4a84a	active	\N	2014-07-03 02:44:45.412948	9999-12-31 00:00:00	t
fcb378e7-a720-462a-a29c-195a26950133	a30630d5-d607-45a7-a654-51c7b52063bd	Update Frequency	Daily	4b529ca3-3b84-494c-b3a7-2f0a3c9702dd	fcb378e7-a720-462a-a29c-195a26950133	active	\N	2014-06-30 07:43:25.21159	9999-12-31 00:00:00	t
5d1b0950-ad95-497f-9fed-ab2022b012f7	662b5c78-476e-4f38-a645-c527e3d56458	Data Location	Link	39ce33ad-3e18-49c2-b789-2926116871ca	5d1b0950-ad95-497f-9fed-ab2022b012f7	active	\N	2014-07-01 23:57:52.071607	9999-12-31 00:00:00	t
e1250e11-ced3-49a6-bd4a-f9704ac3e8e6	662b5c78-476e-4f38-a645-c527e3d56458	Update Frequency	Annually	39ce33ad-3e18-49c2-b789-2926116871ca	e1250e11-ced3-49a6-bd4a-f9704ac3e8e6	active	\N	2014-07-01 23:57:52.071607	9999-12-31 00:00:00	t
73655eed-c699-4d06-8a88-5aa77f377456	e902efbd-eace-40dc-ac58-bbe5e11f5670	Geospatial Coverage	City of Salisbury LGA	4dfc0609-cc69-4a97-8ccf-bf14a036046b	73655eed-c699-4d06-8a88-5aa77f377456	active	\N	2014-07-01 05:51:52.374192	9999-12-31 00:00:00	t
88e75e57-0617-48d0-b4f1-64de5e09e146	e902efbd-eace-40dc-ac58-bbe5e11f5670	Update Frequency	Annually	4dfc0609-cc69-4a97-8ccf-bf14a036046b	88e75e57-0617-48d0-b4f1-64de5e09e146	active	\N	2014-07-01 05:51:52.374192	9999-12-31 00:00:00	t
31dd530e-108e-4f06-b957-0257434d14e0	e902efbd-eace-40dc-ac58-bbe5e11f5670	Data Location	City of Salisbury	4dfc0609-cc69-4a97-8ccf-bf14a036046b	31dd530e-108e-4f06-b957-0257434d14e0	active	\N	2014-07-01 05:51:52.374192	9999-12-31 00:00:00	t
98cbadd2-07a9-4d7a-9534-f2e2c589473e	3803e067-b868-43ca-98e9-cb328eb9ff2b	Temporal Coverage	2007-2011	b1e9b886-99fe-433c-8eef-c9996639d316	98cbadd2-07a9-4d7a-9534-f2e2c589473e	active	\N	2014-07-01 05:59:14.400358	9999-12-31 00:00:00	t
72d745b8-f383-4cea-9528-8fb4d164e5a0	3803e067-b868-43ca-98e9-cb328eb9ff2b	Data Location	Linked	b1e9b886-99fe-433c-8eef-c9996639d316	72d745b8-f383-4cea-9528-8fb4d164e5a0	active	\N	2014-07-01 05:59:14.400358	9999-12-31 00:00:00	t
6c31014a-dab8-4295-8069-b83109495497	3803e067-b868-43ca-98e9-cb328eb9ff2b	Data Status	N/A	b1e9b886-99fe-433c-8eef-c9996639d316	6c31014a-dab8-4295-8069-b83109495497	active	\N	2014-07-01 05:59:14.400358	9999-12-31 00:00:00	t
64d2a2f9-e868-4a83-b512-6bcc1dcf23bf	3803e067-b868-43ca-98e9-cb328eb9ff2b	Geospatial Coverage	Anangu Pitjantjatjara (AC) Local Government Area	b1e9b886-99fe-433c-8eef-c9996639d316	64d2a2f9-e868-4a83-b512-6bcc1dcf23bf	active	\N	2014-07-01 05:59:14.400358	9999-12-31 00:00:00	t
07ae7b91-a621-4cef-810a-96d282d8d9bf	3803e067-b868-43ca-98e9-cb328eb9ff2b	Data Granularity	N/A	b1e9b886-99fe-433c-8eef-c9996639d316	07ae7b91-a621-4cef-810a-96d282d8d9bf	active	\N	2014-07-01 05:59:14.400358	9999-12-31 00:00:00	t
3aa5a2cc-de06-4484-b767-2366e2cbb533	3803e067-b868-43ca-98e9-cb328eb9ff2b	Update Frequency	Annually	b1e9b886-99fe-433c-8eef-c9996639d316	3aa5a2cc-de06-4484-b767-2366e2cbb533	active	\N	2014-07-01 05:59:14.400358	9999-12-31 00:00:00	t
50e59923-16fd-4f8d-98f0-9f80d3c8c65e	3604e917-c1d1-4111-9d56-b3705091d40c	Data Location	Linked	a979e6ee-ee37-43da-a378-f5edec456fc8	50e59923-16fd-4f8d-98f0-9f80d3c8c65e	active	\N	2014-07-02 00:04:41.54665	9999-12-31 00:00:00	t
34d4b5c6-3247-49e0-9cd3-48b2014c3ce1	01679c85-ea70-4fda-94e7-1ba5c4718e09	Data Location	City of Salisbury	7bfab199-a865-4d76-b89f-16e57814e1ad	34d4b5c6-3247-49e0-9cd3-48b2014c3ce1	active	\N	2014-07-01 06:09:36.163928	9999-12-31 00:00:00	t
49b12b39-fd8e-4360-adf8-d0830ab802a3	01679c85-ea70-4fda-94e7-1ba5c4718e09	Update Frequency	Annually	7bfab199-a865-4d76-b89f-16e57814e1ad	49b12b39-fd8e-4360-adf8-d0830ab802a3	active	\N	2014-07-01 06:09:36.163928	9999-12-31 00:00:00	t
4afc3b59-303a-4a75-8f6c-06a4baa9db2c	01679c85-ea70-4fda-94e7-1ba5c4718e09	Geospatial Coverage	City of Salisbury LGA	7bfab199-a865-4d76-b89f-16e57814e1ad	4afc3b59-303a-4a75-8f6c-06a4baa9db2c	active	\N	2014-07-01 06:09:36.163928	9999-12-31 00:00:00	t
2acf1405-48fe-4ae5-adc2-fb9d08c56daf	e59eb360-7e67-40a6-913f-46ebb5f2b36a	Data Granularity	N/A	2275f606-afa9-4cf2-86db-c25de4880b02	2acf1405-48fe-4ae5-adc2-fb9d08c56daf	active	\N	2014-07-01 23:15:45.818837	9999-12-31 00:00:00	t
19a0dc7c-4b9b-4339-99e0-945bdb13556a	e59eb360-7e67-40a6-913f-46ebb5f2b36a	Geospatial Coverage	Ceduna (DC) Local Government Area	2275f606-afa9-4cf2-86db-c25de4880b02	19a0dc7c-4b9b-4339-99e0-945bdb13556a	active	\N	2014-07-01 23:15:45.818837	9999-12-31 00:00:00	t
0a32bbe1-84a0-462f-8364-d50bf801b2ac	e59eb360-7e67-40a6-913f-46ebb5f2b36a	Update Frequency	Annually	2275f606-afa9-4cf2-86db-c25de4880b02	0a32bbe1-84a0-462f-8364-d50bf801b2ac	active	\N	2014-07-01 23:15:45.818837	9999-12-31 00:00:00	t
38ca327b-0794-436a-8c35-f7a031eb35d0	821512e8-c7a7-43ea-a1d9-783634567335	Data Granularity	N/A	9caa6f0b-3e9b-4975-9391-92b8c8cc209c	38ca327b-0794-436a-8c35-f7a031eb35d0	active	\N	2014-07-01 23:18:16.493504	9999-12-31 00:00:00	t
e1f068ab-5247-451e-a616-cbc312c4e3e4	821512e8-c7a7-43ea-a1d9-783634567335	Update Frequency	Annually	9caa6f0b-3e9b-4975-9391-92b8c8cc209c	e1f068ab-5247-451e-a616-cbc312c4e3e4	active	\N	2014-07-01 23:18:16.493504	9999-12-31 00:00:00	t
50d59c68-3aea-4390-b8d3-3764cad3dfde	821512e8-c7a7-43ea-a1d9-783634567335	Geospatial Coverage	Mount Gambier	9caa6f0b-3e9b-4975-9391-92b8c8cc209c	50d59c68-3aea-4390-b8d3-3764cad3dfde	active	\N	2014-07-01 23:18:16.493504	9999-12-31 00:00:00	t
e6bebe1e-c1b0-4f8b-94ca-8f6f65b85358	821512e8-c7a7-43ea-a1d9-783634567335	Data Status	N/A	9caa6f0b-3e9b-4975-9391-92b8c8cc209c	e6bebe1e-c1b0-4f8b-94ca-8f6f65b85358	active	\N	2014-07-01 23:18:16.493504	9999-12-31 00:00:00	t
d891b807-5965-4e3d-b3ca-a80083765c4f	821512e8-c7a7-43ea-a1d9-783634567335	Temporal Coverage	2007-2011	9caa6f0b-3e9b-4975-9391-92b8c8cc209c	d891b807-5965-4e3d-b3ca-a80083765c4f	active	\N	2014-07-01 23:18:16.493504	9999-12-31 00:00:00	t
41e31761-5fdb-457a-a3de-d9ea5417dcf4	a6714470-102d-4283-ba21-5024a08f9d28	Geospatial Coverage	Mount Remarkable	6bf60f30-1650-45c3-a508-63b2539b6a81	41e31761-5fdb-457a-a3de-d9ea5417dcf4	active	\N	2014-07-01 23:19:50.920662	9999-12-31 00:00:00	t
d75c60b0-2847-4572-9288-1973bb4837e6	a6714470-102d-4283-ba21-5024a08f9d28	Temporal Coverage	2007-2011	6bf60f30-1650-45c3-a508-63b2539b6a81	d75c60b0-2847-4572-9288-1973bb4837e6	active	\N	2014-07-01 23:19:50.920662	9999-12-31 00:00:00	t
574c0d52-1c76-4d9c-849c-df6086c915f2	a6714470-102d-4283-ba21-5024a08f9d28	Data Status	N/A	6bf60f30-1650-45c3-a508-63b2539b6a81	574c0d52-1c76-4d9c-849c-df6086c915f2	active	\N	2014-07-01 23:19:50.920662	9999-12-31 00:00:00	t
c8e0448f-f70e-43b1-9783-146d388cec24	a6714470-102d-4283-ba21-5024a08f9d28	Update Frequency	Annually	6bf60f30-1650-45c3-a508-63b2539b6a81	c8e0448f-f70e-43b1-9783-146d388cec24	active	\N	2014-07-01 23:19:50.920662	9999-12-31 00:00:00	t
2f7a10a1-d27f-42e6-8c9b-141c105d94c2	821512e8-c7a7-43ea-a1d9-783634567335	Data Location	Hosted	9caa6f0b-3e9b-4975-9391-92b8c8cc209c	2f7a10a1-d27f-42e6-8c9b-141c105d94c2	active	78ee8d2b-d665-41bf-91a8-a8fc5dce47f2	2014-07-01 23:18:16.493504	2014-07-01 23:47:41.146787	f
db1de3ea-e6f6-429b-b2cf-6a81af0a5228	a6714470-102d-4283-ba21-5024a08f9d28	Data Location	Hosted	6bf60f30-1650-45c3-a508-63b2539b6a81	db1de3ea-e6f6-429b-b2cf-6a81af0a5228	active	28b868ca-b62c-4522-bbd8-44d1830af773	2014-07-01 23:19:50.920662	2014-07-01 23:49:14.590198	f
f434aa5b-782e-4695-9f19-856b3eb7a1c5	b09e463d-c0e9-488f-9518-d0391d93da8e	Update Frequency	Daily	f1a7e14d-ffc4-4673-b58d-ac7673db5278	f434aa5b-782e-4695-9f19-856b3eb7a1c5	active	\N	2014-06-30 07:47:03.659937	9999-12-31 00:00:00	t
c26c218d-e035-4e34-ac7c-db00b590a01b	c51e3035-99cf-45d9-951e-2662e4658230	Update Frequency	Daily	4669134f-066b-46f9-b40e-684a0c6f7b01	c26c218d-e035-4e34-ac7c-db00b590a01b	active	\N	2014-06-30 07:57:41.109961	9999-12-31 00:00:00	t
5eaa9a73-0944-45cd-9ab0-e64f6188c6bd	424f787f-6839-43e9-a5ef-67bab94331f3	Data Location	Linked	4629017d-8108-4f70-b3f5-8fe4cc3c2927	5eaa9a73-0944-45cd-9ab0-e64f6188c6bd	active	\N	2014-07-01 23:59:04.061644	9999-12-31 00:00:00	t
0a7ebb63-0a1a-4eaa-b4e6-56491914dce5	424f787f-6839-43e9-a5ef-67bab94331f3	Geospatial Coverage	Copper Coast (DC) Local Government Area	4629017d-8108-4f70-b3f5-8fe4cc3c2927	0a7ebb63-0a1a-4eaa-b4e6-56491914dce5	active	\N	2014-07-01 23:59:04.061644	9999-12-31 00:00:00	t
52756058-5540-40fc-9212-397ddbf91451	06cdcdab-4407-4674-b884-877a8c23ecd0	Data Location	Linked	49c6281b-15ce-4c20-b630-093d76929f50	52756058-5540-40fc-9212-397ddbf91451	active	\N	2014-07-01 06:16:03.80967	9999-12-31 00:00:00	t
c0b946dc-d8dd-4277-b1f4-861ae069b5af	06cdcdab-4407-4674-b884-877a8c23ecd0	Update Frequency	Annually	49c6281b-15ce-4c20-b630-093d76929f50	c0b946dc-d8dd-4277-b1f4-861ae069b5af	active	\N	2014-07-01 06:16:03.80967	9999-12-31 00:00:00	t
952d4e20-ae1f-4c5c-8d02-4b9663b59101	06cdcdab-4407-4674-b884-877a8c23ecd0	Geospatial Coverage	Barossa (DC) Local Government Area	49c6281b-15ce-4c20-b630-093d76929f50	952d4e20-ae1f-4c5c-8d02-4b9663b59101	active	\N	2014-07-01 06:16:03.80967	9999-12-31 00:00:00	t
e82c5b5d-0c30-4b1b-9051-04c95ef87668	06cdcdab-4407-4674-b884-877a8c23ecd0	Data Status	N/A	49c6281b-15ce-4c20-b630-093d76929f50	e82c5b5d-0c30-4b1b-9051-04c95ef87668	active	\N	2014-07-01 06:16:03.80967	9999-12-31 00:00:00	t
2c6e2314-adb4-4631-9bee-e95dbb870381	06cdcdab-4407-4674-b884-877a8c23ecd0	Data Granularity	N/A	49c6281b-15ce-4c20-b630-093d76929f50	2c6e2314-adb4-4631-9bee-e95dbb870381	active	\N	2014-07-01 06:16:03.80967	9999-12-31 00:00:00	t
ee410f13-2894-4027-879d-c05cd8311478	06cdcdab-4407-4674-b884-877a8c23ecd0	Temporal Coverage	2007-2011	49c6281b-15ce-4c20-b630-093d76929f50	ee410f13-2894-4027-879d-c05cd8311478	active	\N	2014-07-01 06:16:03.80967	9999-12-31 00:00:00	t
50e59923-16fd-4f8d-98f0-9f80d3c8c65e	3604e917-c1d1-4111-9d56-b3705091d40c	Data Location	Link	a554f89d-4d05-4e4d-bd0c-1faf7a7023eb	50e59923-16fd-4f8d-98f0-9f80d3c8c65e	active	a979e6ee-ee37-43da-a378-f5edec456fc8	2014-07-01 23:45:08.404936	2014-07-02 00:04:41.54665	f
c5cd10d7-78d6-4319-8b5f-bae788f145e9	483a6d7c-2556-4599-a6c9-567c0faa3229	Data Location	Link	676a5d2e-04b6-4824-a696-e90799c9f4b9	c5cd10d7-78d6-4319-8b5f-bae788f145e9	active	b9fcb210-919d-44b1-8562-234a3470c5ed	2014-07-01 23:29:47.426714	2014-07-02 00:43:26.889283	f
3fb5df92-f79d-4157-b843-c234a162f9e1	6f6886f3-ccb3-41cb-91db-d3dcc0cd0cfa	Update Frequency	Annually	2e338c2b-4f7f-4851-958e-9d8a2fd78f78	3fb5df92-f79d-4157-b843-c234a162f9e1	active	\N	2014-07-01 06:20:19.145306	9999-12-31 00:00:00	t
e2274542-054a-4b18-b558-46ffc227d4fa	6f6886f3-ccb3-41cb-91db-d3dcc0cd0cfa	Geospatial Coverage	City of Salisbury LGA	2e338c2b-4f7f-4851-958e-9d8a2fd78f78	e2274542-054a-4b18-b558-46ffc227d4fa	active	\N	2014-07-01 06:20:19.145306	9999-12-31 00:00:00	t
2ecec115-e14e-4adb-9566-c67f17075ed5	6f6886f3-ccb3-41cb-91db-d3dcc0cd0cfa	Data Location	City of Salisbury	2e338c2b-4f7f-4851-958e-9d8a2fd78f78	2ecec115-e14e-4adb-9566-c67f17075ed5	active	\N	2014-07-01 06:20:19.145306	9999-12-31 00:00:00	t
2e50d7bb-e4d9-409d-98bc-11f2b97e3d2c	710ae662-88c9-46d2-ad15-5bb48e0a1bc8	Data Granularity	N/A	c7210aaf-b55a-4617-9890-d3efca528269	2e50d7bb-e4d9-409d-98bc-11f2b97e3d2c	active	\N	2014-07-01 06:23:30.633829	9999-12-31 00:00:00	t
f7c12055-b487-43d7-a108-073c477bcbda	710ae662-88c9-46d2-ad15-5bb48e0a1bc8	Geospatial Coverage	Barunga West (DC) Local Government Area	c7210aaf-b55a-4617-9890-d3efca528269	f7c12055-b487-43d7-a108-073c477bcbda	active	\N	2014-07-01 06:23:30.633829	9999-12-31 00:00:00	t
14df0bad-1ffd-4adf-9189-190cd7cbf9be	710ae662-88c9-46d2-ad15-5bb48e0a1bc8	Update Frequency	Annually	c7210aaf-b55a-4617-9890-d3efca528269	14df0bad-1ffd-4adf-9189-190cd7cbf9be	active	\N	2014-07-01 06:23:30.633829	9999-12-31 00:00:00	t
08531632-cc68-4cbe-ad97-3f09f028d0a8	710ae662-88c9-46d2-ad15-5bb48e0a1bc8	Temporal Coverage	2007-2011	c7210aaf-b55a-4617-9890-d3efca528269	08531632-cc68-4cbe-ad97-3f09f028d0a8	active	\N	2014-07-01 06:23:30.633829	9999-12-31 00:00:00	t
228c68d9-c12b-4535-8cf4-c3fa0f73cc9f	710ae662-88c9-46d2-ad15-5bb48e0a1bc8	Data Status	N/A	c7210aaf-b55a-4617-9890-d3efca528269	228c68d9-c12b-4535-8cf4-c3fa0f73cc9f	active	\N	2014-07-01 06:23:30.633829	9999-12-31 00:00:00	t
84a4700d-555f-4334-9ebf-f23daf67a574	710ae662-88c9-46d2-ad15-5bb48e0a1bc8	Data Location	Linked	c7210aaf-b55a-4617-9890-d3efca528269	84a4700d-555f-4334-9ebf-f23daf67a574	active	\N	2014-07-01 06:23:30.633829	9999-12-31 00:00:00	t
fbb125a9-bf5d-4b3d-bff0-9db4aaa21023	a6714470-102d-4283-ba21-5024a08f9d28	Data Granularity	N/A	6bf60f30-1650-45c3-a508-63b2539b6a81	fbb125a9-bf5d-4b3d-bff0-9db4aaa21023	active	\N	2014-07-01 23:19:50.920662	9999-12-31 00:00:00	t
d6704564-adb4-4dc8-8ae3-21a3399c1995	483a6d7c-2556-4599-a6c9-567c0faa3229	Data Status	N/A	676a5d2e-04b6-4824-a696-e90799c9f4b9	d6704564-adb4-4dc8-8ae3-21a3399c1995	active	\N	2014-07-01 23:29:47.426714	9999-12-31 00:00:00	t
d6e6cd38-0f77-4372-a3df-b4ee5ef9ffa1	483a6d7c-2556-4599-a6c9-567c0faa3229	Data Granularity	N/A	676a5d2e-04b6-4824-a696-e90799c9f4b9	d6e6cd38-0f77-4372-a3df-b4ee5ef9ffa1	active	\N	2014-07-01 23:29:47.426714	9999-12-31 00:00:00	t
491d0b62-b91e-457a-93e6-e483d8faaee0	483a6d7c-2556-4599-a6c9-567c0faa3229	Geospatial Coverage	Northern Areas	676a5d2e-04b6-4824-a696-e90799c9f4b9	491d0b62-b91e-457a-93e6-e483d8faaee0	active	\N	2014-07-01 23:29:47.426714	9999-12-31 00:00:00	t
c429642e-9ecb-42b7-aa03-44c7ce3f9cb4	483a6d7c-2556-4599-a6c9-567c0faa3229	Temporal Coverage	2007-2011	676a5d2e-04b6-4824-a696-e90799c9f4b9	c429642e-9ecb-42b7-aa03-44c7ce3f9cb4	active	\N	2014-07-01 23:29:47.426714	9999-12-31 00:00:00	t
e75a93d4-e2fa-4147-9b6f-f24d96bfd1a8	483a6d7c-2556-4599-a6c9-567c0faa3229	Update Frequency	Annually	676a5d2e-04b6-4824-a696-e90799c9f4b9	e75a93d4-e2fa-4147-9b6f-f24d96bfd1a8	active	\N	2014-07-01 23:29:47.426714	9999-12-31 00:00:00	t
61eaff7f-6162-4947-bb68-4d78648d089d	4f76da87-64ec-4f00-a1d4-e0fc9db289da	Geospatial Coverage	Norwood Payneham St Peters	c416ff59-96f6-4ade-b00f-786ef809469d	61eaff7f-6162-4947-bb68-4d78648d089d	active	\N	2014-07-01 23:31:47.523931	9999-12-31 00:00:00	t
68855880-2242-4283-896a-7302f2a0eef9	4f76da87-64ec-4f00-a1d4-e0fc9db289da	Temporal Coverage	2007-2011	c416ff59-96f6-4ade-b00f-786ef809469d	68855880-2242-4283-896a-7302f2a0eef9	active	\N	2014-07-01 23:31:47.523931	9999-12-31 00:00:00	t
590bde67-1370-4e45-abdd-194b9c75aebd	4f76da87-64ec-4f00-a1d4-e0fc9db289da	Data Status	N/A	c416ff59-96f6-4ade-b00f-786ef809469d	590bde67-1370-4e45-abdd-194b9c75aebd	active	\N	2014-07-01 23:31:47.523931	9999-12-31 00:00:00	t
9755d71b-4f63-4db2-b636-05c5ccb3f56b	6e46eaed-9e0a-4ab2-b373-c8e44dfd4f54	Update Frequency	Daily	bc5820cb-732e-4197-8aef-b2a852a30331	9755d71b-4f63-4db2-b636-05c5ccb3f56b	active	\N	2014-06-30 08:01:04.917178	9999-12-31 00:00:00	t
005fe837-f305-49d9-b280-e5dbecaee0e6	424f787f-6839-43e9-a5ef-67bab94331f3	Data Status	N/A	4629017d-8108-4f70-b3f5-8fe4cc3c2927	005fe837-f305-49d9-b280-e5dbecaee0e6	active	\N	2014-07-01 23:59:04.061644	9999-12-31 00:00:00	t
5052c4e0-5d51-49bd-97a6-95579f514fcc	c20b3410-586b-403c-842c-3473a02d0900	Update Frequency	Daily	9c177323-c224-4801-82a5-bed73ee31c4a	5052c4e0-5d51-49bd-97a6-95579f514fcc	active	\N	2014-06-30 08:04:26.05488	9999-12-31 00:00:00	t
0dd7ac90-1089-4682-a1a3-e84d7fa11f1d	424f787f-6839-43e9-a5ef-67bab94331f3	Data Granularity	N/A	4629017d-8108-4f70-b3f5-8fe4cc3c2927	0dd7ac90-1089-4682-a1a3-e84d7fa11f1d	active	\N	2014-07-01 23:59:04.061644	9999-12-31 00:00:00	t
ed1dd0d5-e77f-494a-b02d-443c4815c1a6	424f787f-6839-43e9-a5ef-67bab94331f3	Temporal Coverage	2007-2011	4629017d-8108-4f70-b3f5-8fe4cc3c2927	ed1dd0d5-e77f-494a-b02d-443c4815c1a6	active	\N	2014-07-01 23:59:04.061644	9999-12-31 00:00:00	t
e11457ca-87c5-4b99-bc0e-7e945e0f79a6	424f787f-6839-43e9-a5ef-67bab94331f3	Update Frequency	Annually	4629017d-8108-4f70-b3f5-8fe4cc3c2927	e11457ca-87c5-4b99-bc0e-7e945e0f79a6	active	\N	2014-07-01 23:59:04.061644	9999-12-31 00:00:00	t
80742a1c-21b2-426d-a51f-a299d46cf164	baef652a-8571-476f-b21b-a811d82e39d0	Data Status	N/A	6364c20c-82a5-4679-943e-96a67c3745c8	80742a1c-21b2-426d-a51f-a299d46cf164	active	\N	2014-07-01 03:47:50.455808	9999-12-31 00:00:00	t
9740f77e-f3d1-4acd-9362-7928b9535a70	baef652a-8571-476f-b21b-a811d82e39d0	Data Location	Linked	6364c20c-82a5-4679-943e-96a67c3745c8	9740f77e-f3d1-4acd-9362-7928b9535a70	active	\N	2014-07-01 03:47:50.455808	9999-12-31 00:00:00	t
9e5065ee-10a5-4267-9e59-20f6fa234529	baef652a-8571-476f-b21b-a811d82e39d0	Temporal Coverage	2007-2011	6364c20c-82a5-4679-943e-96a67c3745c8	9e5065ee-10a5-4267-9e59-20f6fa234529	active	\N	2014-07-01 03:47:50.455808	9999-12-31 00:00:00	t
82464c22-6604-476d-bee2-35a3645a0df4	baef652a-8571-476f-b21b-a811d82e39d0	Update Frequency	Annually	6364c20c-82a5-4679-943e-96a67c3745c8	82464c22-6604-476d-bee2-35a3645a0df4	active	\N	2014-07-01 03:47:50.455808	9999-12-31 00:00:00	t
c3c1a6ee-da6e-4cf4-84f1-dd6194fd94bc	baef652a-8571-476f-b21b-a811d82e39d0	Geospatial Coverage	South Australia	6364c20c-82a5-4679-943e-96a67c3745c8	c3c1a6ee-da6e-4cf4-84f1-dd6194fd94bc	active	\N	2014-07-01 03:47:50.455808	9999-12-31 00:00:00	t
0701ec0a-b239-4b84-8fe7-a38afc9acbf2	baef652a-8571-476f-b21b-a811d82e39d0	Data Granularity	N/A	6364c20c-82a5-4679-943e-96a67c3745c8	0701ec0a-b239-4b84-8fe7-a38afc9acbf2	active	\N	2014-07-01 03:47:50.455808	9999-12-31 00:00:00	t
6398f3f3-1899-43a9-a79e-9e506f5f89c7	c56c892a-9179-4eb1-8a0d-35e5f9f58ec5	Data Location	Linked	b55431b5-ff3c-4344-9be7-76877279fb47	6398f3f3-1899-43a9-a79e-9e506f5f89c7	active	598e74a9-f135-44a2-b5dd-20ae4c812867	2014-07-01 04:44:15.543037	2014-07-01 22:37:04.515435	f
23a14faf-e3f5-43af-bd5b-2eec770f0adf	179bd871-6585-488d-a0b1-fd483db57e11	Data Location	Linked	55a483f5-3a5b-4fd6-b9c3-743bd046dcb9	23a14faf-e3f5-43af-bd5b-2eec770f0adf	active	f1a07cfd-07a5-4f25-85f6-7beae20007b0	2014-07-01 04:32:33.614197	2014-07-01 22:37:31.147372	f
59a19036-403e-48ae-8ac2-7e9ff74d990e	43b62c81-5f75-4c13-8360-814ec49a531f	Update Frequency	Annually	fa0baa03-d590-4d30-818e-0794736e8477	59a19036-403e-48ae-8ac2-7e9ff74d990e	active	\N	2014-07-01 04:02:27.232959	9999-12-31 00:00:00	t
9039867d-8869-46f5-b918-775f1dc1b4db	43b62c81-5f75-4c13-8360-814ec49a531f	Temporal Coverage	2007-2011	fa0baa03-d590-4d30-818e-0794736e8477	9039867d-8869-46f5-b918-775f1dc1b4db	active	\N	2014-07-01 04:02:27.232959	9999-12-31 00:00:00	t
450728d8-041c-44b4-89b6-349cf6e38062	43b62c81-5f75-4c13-8360-814ec49a531f	Geospatial Coverage	South Australia	fa0baa03-d590-4d30-818e-0794736e8477	450728d8-041c-44b4-89b6-349cf6e38062	active	\N	2014-07-01 04:02:27.232959	9999-12-31 00:00:00	t
aeb6eccd-e29e-4c50-a725-64bc862d3ac6	43b62c81-5f75-4c13-8360-814ec49a531f	Data Status	N/A	fa0baa03-d590-4d30-818e-0794736e8477	aeb6eccd-e29e-4c50-a725-64bc862d3ac6	active	\N	2014-07-01 04:02:27.232959	9999-12-31 00:00:00	t
18691084-5aed-47ad-8832-a6c411f3f99c	43b62c81-5f75-4c13-8360-814ec49a531f	Data Location	Linked	fa0baa03-d590-4d30-818e-0794736e8477	18691084-5aed-47ad-8832-a6c411f3f99c	active	\N	2014-07-01 04:02:27.232959	9999-12-31 00:00:00	t
896b4103-bd4f-4e5a-af2f-0f59dfec2318	43b62c81-5f75-4c13-8360-814ec49a531f	Data Granularity	N/A	fa0baa03-d590-4d30-818e-0794736e8477	896b4103-bd4f-4e5a-af2f-0f59dfec2318	active	\N	2014-07-01 04:02:27.232959	9999-12-31 00:00:00	t
c9bfa5cf-51e6-45cb-b488-d6d3f6958b22	179bd871-6585-488d-a0b1-fd483db57e11	Update Frequency	Annually	55a483f5-3a5b-4fd6-b9c3-743bd046dcb9	c9bfa5cf-51e6-45cb-b488-d6d3f6958b22	active	\N	2014-07-01 04:32:33.614197	9999-12-31 00:00:00	t
dac7acb7-fc98-4c73-9d04-875060c102c7	179bd871-6585-488d-a0b1-fd483db57e11	Data Status	N/A	55a483f5-3a5b-4fd6-b9c3-743bd046dcb9	dac7acb7-fc98-4c73-9d04-875060c102c7	active	\N	2014-07-01 04:32:33.614197	9999-12-31 00:00:00	t
366af480-62f6-4c15-b5bd-4a4e4196adc1	179bd871-6585-488d-a0b1-fd483db57e11	Data Granularity	N/A	55a483f5-3a5b-4fd6-b9c3-743bd046dcb9	366af480-62f6-4c15-b5bd-4a4e4196adc1	active	\N	2014-07-01 04:32:33.614197	9999-12-31 00:00:00	t
bf2aefc5-dc4a-42f5-aa13-4beec657fe81	179bd871-6585-488d-a0b1-fd483db57e11	Temporal Coverage	2007-2011	55a483f5-3a5b-4fd6-b9c3-743bd046dcb9	bf2aefc5-dc4a-42f5-aa13-4beec657fe81	active	\N	2014-07-01 04:32:33.614197	9999-12-31 00:00:00	t
211a1c79-eb33-414f-87df-d4db5f4b4e9e	35a8d264-5fd6-4451-a8bc-71e46f2a5142	Update Frequency	Annually	d4729bca-4fd3-4693-9563-b37e50a1849f	211a1c79-eb33-414f-87df-d4db5f4b4e9e	active	\N	2014-07-01 04:40:09.669812	9999-12-31 00:00:00	t
0067ff0f-3efd-4588-beeb-126acb926066	c56c892a-9179-4eb1-8a0d-35e5f9f58ec5	Temporal Coverage	2007-2011	b55431b5-ff3c-4344-9be7-76877279fb47	0067ff0f-3efd-4588-beeb-126acb926066	active	\N	2014-07-01 04:44:15.543037	9999-12-31 00:00:00	t
ff613cbc-efe3-42ba-bea5-f959ece256ff	c56c892a-9179-4eb1-8a0d-35e5f9f58ec5	Update Frequency	Annually	b55431b5-ff3c-4344-9be7-76877279fb47	ff613cbc-efe3-42ba-bea5-f959ece256ff	active	\N	2014-07-01 04:44:15.543037	9999-12-31 00:00:00	t
d6e64c87-4b08-4a32-a2ab-3fc778510f6c	c56c892a-9179-4eb1-8a0d-35e5f9f58ec5	Data Granularity	N/A	b55431b5-ff3c-4344-9be7-76877279fb47	d6e64c87-4b08-4a32-a2ab-3fc778510f6c	active	\N	2014-07-01 04:44:15.543037	9999-12-31 00:00:00	t
58d2071a-e612-480f-84da-6256659bb39d	c56c892a-9179-4eb1-8a0d-35e5f9f58ec5	Data Status	N/A	b55431b5-ff3c-4344-9be7-76877279fb47	58d2071a-e612-480f-84da-6256659bb39d	active	\N	2014-07-01 04:44:15.543037	9999-12-31 00:00:00	t
cd7e8bf6-af56-4a87-a6a0-b218ea8149a5	c56c892a-9179-4eb1-8a0d-35e5f9f58ec5	Geospatial Coverage	South Australia	b55431b5-ff3c-4344-9be7-76877279fb47	cd7e8bf6-af56-4a87-a6a0-b218ea8149a5	active	74cdbb83-77c3-42b8-9aed-f3671ad29beb	2014-07-01 04:44:15.543037	2014-07-01 05:01:32.9953	f
7b757b71-0f59-4873-b797-a3e7dd43b822	179bd871-6585-488d-a0b1-fd483db57e11	Geospatial Coverage	South Australia	55a483f5-3a5b-4fd6-b9c3-743bd046dcb9	7b757b71-0f59-4873-b797-a3e7dd43b822	active	e6b37d85-e7fb-4eb4-b410-42795a2f1e66	2014-07-01 04:32:33.614197	2014-07-01 05:02:14.062876	f
1798dff1-5fd0-4294-8b79-c362bda380da	198567b3-64fb-4415-b945-0329269b30d3	Update Frequency	Annually	237d3368-1e58-4bb7-a197-e56b7aa70e1f	1798dff1-5fd0-4294-8b79-c362bda380da	active	\N	2014-07-01 04:45:35.520455	9999-12-31 00:00:00	t
c34ed0e6-0dc4-4e42-8353-e7c4e330e3aa	198567b3-64fb-4415-b945-0329269b30d3	Temporal Coverage	2007-2011	237d3368-1e58-4bb7-a197-e56b7aa70e1f	c34ed0e6-0dc4-4e42-8353-e7c4e330e3aa	active	\N	2014-07-01 04:45:35.520455	9999-12-31 00:00:00	t
321ee325-ad7e-42fb-8f2c-f8bb8fc67050	198567b3-64fb-4415-b945-0329269b30d3	Data Status	N/A	237d3368-1e58-4bb7-a197-e56b7aa70e1f	321ee325-ad7e-42fb-8f2c-f8bb8fc67050	active	\N	2014-07-01 04:45:35.520455	9999-12-31 00:00:00	t
0be2c167-3cb5-4cfe-80b6-62bd2094abfa	198567b3-64fb-4415-b945-0329269b30d3	Data Granularity	N/A	237d3368-1e58-4bb7-a197-e56b7aa70e1f	0be2c167-3cb5-4cfe-80b6-62bd2094abfa	active	\N	2014-07-01 04:45:35.520455	9999-12-31 00:00:00	t
3f6cf248-2864-4809-8cfb-8d4f9ed1e2ba	198567b3-64fb-4415-b945-0329269b30d3	Data Location	Linked	237d3368-1e58-4bb7-a197-e56b7aa70e1f	3f6cf248-2864-4809-8cfb-8d4f9ed1e2ba	active	\N	2014-07-01 04:45:35.520455	9999-12-31 00:00:00	t
4c6c6a73-a62f-4451-8612-d3388086cd8e	198567b3-64fb-4415-b945-0329269b30d3	Geospatial Coverage	South Australia	237d3368-1e58-4bb7-a197-e56b7aa70e1f	4c6c6a73-a62f-4451-8612-d3388086cd8e	active	\N	2014-07-01 04:45:35.520455	9999-12-31 00:00:00	t
cd4b5318-e0c9-4f68-bdee-9aafbfd0b07f	48935b42-5b29-4432-a7f9-f0c35a75fea8	Data Location	Linked	246e2366-3c53-41f0-b208-f7c3e69c7d6d	cd4b5318-e0c9-4f68-bdee-9aafbfd0b07f	active	\N	2014-07-01 06:45:34.516951	9999-12-31 00:00:00	t
e156f451-c986-4e5c-970a-17ad1e895588	48935b42-5b29-4432-a7f9-f0c35a75fea8	Geospatial Coverage	Berri and Barmera (DC) Local Government Area	246e2366-3c53-41f0-b208-f7c3e69c7d6d	e156f451-c986-4e5c-970a-17ad1e895588	active	\N	2014-07-01 06:45:34.516951	9999-12-31 00:00:00	t
97ed74bf-e5b5-424b-acea-4ec6ff27e1f6	48935b42-5b29-4432-a7f9-f0c35a75fea8	Update Frequency	Annually	246e2366-3c53-41f0-b208-f7c3e69c7d6d	97ed74bf-e5b5-424b-acea-4ec6ff27e1f6	active	\N	2014-07-01 06:45:34.516951	9999-12-31 00:00:00	t
b6df50c0-f0ae-463c-b9bf-c95f8708a219	48935b42-5b29-4432-a7f9-f0c35a75fea8	Data Granularity	N/A	246e2366-3c53-41f0-b208-f7c3e69c7d6d	b6df50c0-f0ae-463c-b9bf-c95f8708a219	active	\N	2014-07-01 06:45:34.516951	9999-12-31 00:00:00	t
4cf8236b-6e50-45fc-b3db-e3fcea3f479d	48935b42-5b29-4432-a7f9-f0c35a75fea8	Data Status	N/A	246e2366-3c53-41f0-b208-f7c3e69c7d6d	4cf8236b-6e50-45fc-b3db-e3fcea3f479d	active	\N	2014-07-01 06:45:34.516951	9999-12-31 00:00:00	t
3a781f39-b169-4021-b339-0a21ba2e9a0f	662b5c78-476e-4f38-a645-c527e3d56458	Temporal Coverage	2007-2011	aabc29a7-e16f-4527-a749-8da83a0d2f08	3a781f39-b169-4021-b339-0a21ba2e9a0f	active	\N	2014-07-01 04:51:10.251879	9999-12-31 00:00:00	t
bf50e413-256a-4859-be66-312d3e7dd32b	662b5c78-476e-4f38-a645-c527e3d56458	Data Granularity	N/A	aabc29a7-e16f-4527-a749-8da83a0d2f08	bf50e413-256a-4859-be66-312d3e7dd32b	active	\N	2014-07-01 04:51:10.251879	9999-12-31 00:00:00	t
9dffe1a3-888f-4367-a202-39f390c904d2	662b5c78-476e-4f38-a645-c527e3d56458	Data Status	N/A	aabc29a7-e16f-4527-a749-8da83a0d2f08	9dffe1a3-888f-4367-a202-39f390c904d2	active	\N	2014-07-01 04:51:10.251879	9999-12-31 00:00:00	t
5c1ebc74-4640-4bf3-8b00-6178a025f510	7358f6f6-befd-43e4-8ef5-7a6882044312	Data Status	N/A	8b816cef-4b6d-46a8-ba18-07ca0698f8cd	5c1ebc74-4640-4bf3-8b00-6178a025f510	active	\N	2014-07-01 04:58:03.185888	9999-12-31 00:00:00	t
1f51758a-bc1f-44c5-ab9e-6edf35473469	7358f6f6-befd-43e4-8ef5-7a6882044312	Temporal Coverage	2007-2011	8b816cef-4b6d-46a8-ba18-07ca0698f8cd	1f51758a-bc1f-44c5-ab9e-6edf35473469	active	\N	2014-07-01 04:58:03.185888	9999-12-31 00:00:00	t
b99637c7-ec0c-4e28-8465-4233ed14a6a9	7358f6f6-befd-43e4-8ef5-7a6882044312	Data Granularity		8b816cef-4b6d-46a8-ba18-07ca0698f8cd	b99637c7-ec0c-4e28-8465-4233ed14a6a9	active	0e14bec5-9b3c-4e50-95ed-a460ed01a9a3	2014-07-01 04:58:03.185888	2014-07-01 04:59:05.528279	f
b99637c7-ec0c-4e28-8465-4233ed14a6a9	7358f6f6-befd-43e4-8ef5-7a6882044312	Data Granularity	N/A	0e14bec5-9b3c-4e50-95ed-a460ed01a9a3	b99637c7-ec0c-4e28-8465-4233ed14a6a9	active	\N	2014-07-01 04:59:05.528279	9999-12-31 00:00:00	t
64231e21-6eb6-4daf-a2dd-554b9643a74d	7358f6f6-befd-43e4-8ef5-7a6882044312	Geospatial Coverage	Port Adelaide Enfield	8ff8b49a-9817-4bef-a35e-01d015414447	64231e21-6eb6-4daf-a2dd-554b9643a74d	active	\N	2014-07-01 05:00:19.490237	9999-12-31 00:00:00	t
64231e21-6eb6-4daf-a2dd-554b9643a74d	7358f6f6-befd-43e4-8ef5-7a6882044312	Geospatial Coverage	South Australia	8b816cef-4b6d-46a8-ba18-07ca0698f8cd	64231e21-6eb6-4daf-a2dd-554b9643a74d	active	8ff8b49a-9817-4bef-a35e-01d015414447	2014-07-01 04:58:03.185888	2014-07-01 05:00:19.490237	f
cd7e8bf6-af56-4a87-a6a0-b218ea8149a5	c56c892a-9179-4eb1-8a0d-35e5f9f58ec5	Geospatial Coverage	Port Lincoln	74cdbb83-77c3-42b8-9aed-f3671ad29beb	cd7e8bf6-af56-4a87-a6a0-b218ea8149a5	active	\N	2014-07-01 05:01:32.9953	9999-12-31 00:00:00	t
5bb333bc-4318-417e-8be2-4ff2b3f631e8	1cb42bb7-4e3c-4ce6-8561-9e8b838e712a	Data Location	City of Salisbury	ed81cefd-9eeb-485a-81be-69fb0a5b21ba	5bb333bc-4318-417e-8be2-4ff2b3f631e8	active	\N	2014-07-01 05:01:41.15229	9999-12-31 00:00:00	t
e1f6a9a2-8769-401a-b1ab-9971b32bdd6f	1cb42bb7-4e3c-4ce6-8561-9e8b838e712a	Geospatial Coverage	City of Salisbury LGA	ed81cefd-9eeb-485a-81be-69fb0a5b21ba	e1f6a9a2-8769-401a-b1ab-9971b32bdd6f	active	\N	2014-07-01 05:01:41.15229	9999-12-31 00:00:00	t
452f8493-42e4-4633-b2e2-5c9c9b351b44	1cb42bb7-4e3c-4ce6-8561-9e8b838e712a	Update Frequency	Annually	ed81cefd-9eeb-485a-81be-69fb0a5b21ba	452f8493-42e4-4633-b2e2-5c9c9b351b44	active	\N	2014-07-01 05:01:41.15229	9999-12-31 00:00:00	t
7b757b71-0f59-4873-b797-a3e7dd43b822	179bd871-6585-488d-a0b1-fd483db57e11	Geospatial Coverage	Port Pirie City and Dists	e6b37d85-e7fb-4eb4-b410-42795a2f1e66	7b757b71-0f59-4873-b797-a3e7dd43b822	active	\N	2014-07-01 05:02:14.062876	9999-12-31 00:00:00	t
d9788367-08f6-4a52-98e1-13ee1b56c80b	b43228eb-b344-434e-8f81-6fa27fd7748c	Data Status	N/A	1b78f4c6-0b4c-4412-b104-d74dea1c84a1	d9788367-08f6-4a52-98e1-13ee1b56c80b	active	\N	2014-07-01 05:02:43.893749	9999-12-31 00:00:00	t
7392571f-098e-4ab3-9267-8a09a1d230fd	b43228eb-b344-434e-8f81-6fa27fd7748c	Data Location	Linked	1b78f4c6-0b4c-4412-b104-d74dea1c84a1	7392571f-098e-4ab3-9267-8a09a1d230fd	active	\N	2014-07-01 05:02:43.893749	9999-12-31 00:00:00	t
abf8b20b-6f75-4506-9291-123f679c0453	b43228eb-b344-434e-8f81-6fa27fd7748c	Geospatial Coverage	Prospect (C) Local Government Area	1b78f4c6-0b4c-4412-b104-d74dea1c84a1	abf8b20b-6f75-4506-9291-123f679c0453	active	\N	2014-07-01 05:02:43.893749	9999-12-31 00:00:00	t
2914bae7-0b5d-43a9-8f60-6e50838f0a9a	b43228eb-b344-434e-8f81-6fa27fd7748c	Update Frequency	Annually	1b78f4c6-0b4c-4412-b104-d74dea1c84a1	2914bae7-0b5d-43a9-8f60-6e50838f0a9a	active	\N	2014-07-01 05:02:43.893749	9999-12-31 00:00:00	t
b3e089ee-f8b4-4f85-8f6a-4923fa5219f0	662b5c78-476e-4f38-a645-c527e3d56458	Geospatial Coverage	South Australia	aabc29a7-e16f-4527-a749-8da83a0d2f08	b3e089ee-f8b4-4f85-8f6a-4923fa5219f0	active	d4e3c7b7-3ac1-4c43-90c4-a74f67c20f3a	2014-07-01 04:51:10.251879	2014-07-01 05:04:04.261426	f
d35127e7-f8b7-4e7a-91e9-34ae8707e4b8	b43228eb-b344-434e-8f81-6fa27fd7748c	Data Granularity	N/A	1b78f4c6-0b4c-4412-b104-d74dea1c84a1	d35127e7-f8b7-4e7a-91e9-34ae8707e4b8	active	\N	2014-07-01 05:02:43.893749	9999-12-31 00:00:00	t
0e6d4d4a-f469-43fd-9f37-82a1813f98fc	b43228eb-b344-434e-8f81-6fa27fd7748c	Temporal Coverage	2007-2011	1b78f4c6-0b4c-4412-b104-d74dea1c84a1	0e6d4d4a-f469-43fd-9f37-82a1813f98fc	active	\N	2014-07-01 05:02:43.893749	9999-12-31 00:00:00	t
90db77f1-55f0-41bb-abe7-26cf6df22bfc	48935b42-5b29-4432-a7f9-f0c35a75fea8	Temporal Coverage	2007-2011	246e2366-3c53-41f0-b208-f7c3e69c7d6d	90db77f1-55f0-41bb-abe7-26cf6df22bfc	active	\N	2014-07-01 06:45:34.516951	9999-12-31 00:00:00	t
b3e089ee-f8b4-4f85-8f6a-4923fa5219f0	662b5c78-476e-4f38-a645-c527e3d56458	Geospatial Coverage	Port Augusta	d4e3c7b7-3ac1-4c43-90c4-a74f67c20f3a	b3e089ee-f8b4-4f85-8f6a-4923fa5219f0	active	\N	2014-07-01 05:04:04.261426	9999-12-31 00:00:00	t
9294d925-ac19-4a57-922c-cc0a1f8e42f7	7fe9cba1-cc09-4694-bba8-58c3d338a04c	Data Status	Active	7d077f21-ae5d-48f2-b0ac-efcb4ade1348	9294d925-ac19-4a57-922c-cc0a1f8e42f7	active	\N	2014-07-03 03:39:46.364536	9999-12-31 00:00:00	t
5fdac737-cfcf-4075-b6d2-0df828d04c60	35a8d264-5fd6-4451-a8bc-71e46f2a5142	Data Location	City of Salisbury	a90e31f9-97d9-46d8-9984-fcc3b24e07ad	5fdac737-cfcf-4075-b6d2-0df828d04c60	active	\N	2014-07-01 05:05:43.021768	9999-12-31 00:00:00	t
7a9959f2-c384-48cc-bfc4-6a40a979d03d	35a8d264-5fd6-4451-a8bc-71e46f2a5142	Geospatial Coverage	City of Salisbury LGA	a90e31f9-97d9-46d8-9984-fcc3b24e07ad	7a9959f2-c384-48cc-bfc4-6a40a979d03d	active	\N	2014-07-01 05:05:43.021768	9999-12-31 00:00:00	t
0a52628f-9e17-415d-a730-9268efcbd971	7fe9cba1-cc09-4694-bba8-58c3d338a04c	Temporal Coverage	Current	7d077f21-ae5d-48f2-b0ac-efcb4ade1348	0a52628f-9e17-415d-a730-9268efcbd971	active	\N	2014-07-03 03:39:46.364536	9999-12-31 00:00:00	t
d62fe8f6-7d4c-4532-bbae-caadcd96c0d8	df32548e-b5cd-4259-8b02-5459a02006e5	Data Location	Linked	2159a50f-39a1-4499-9ef9-88bde44b89d9	d62fe8f6-7d4c-4532-bbae-caadcd96c0d8	active	4669ce75-dbdd-49f5-9591-5766b4cce24d	2014-07-01 05:09:28.743665	2014-07-01 22:35:35.449194	f
cd0c8e8a-edd6-40e5-8eaa-a783ebcdac12	df32548e-b5cd-4259-8b02-5459a02006e5	Geospatial Coverage	Playford	2159a50f-39a1-4499-9ef9-88bde44b89d9	cd0c8e8a-edd6-40e5-8eaa-a783ebcdac12	active	\N	2014-07-01 05:09:28.743665	9999-12-31 00:00:00	t
c7e2794a-8376-42aa-9d32-d9db9f3e4454	df32548e-b5cd-4259-8b02-5459a02006e5	Temporal Coverage	2007-2011	2159a50f-39a1-4499-9ef9-88bde44b89d9	c7e2794a-8376-42aa-9d32-d9db9f3e4454	active	\N	2014-07-01 05:09:28.743665	9999-12-31 00:00:00	t
bc76e307-a180-4777-a3e8-de02311cd979	df32548e-b5cd-4259-8b02-5459a02006e5	Data Status	N/A	2159a50f-39a1-4499-9ef9-88bde44b89d9	bc76e307-a180-4777-a3e8-de02311cd979	active	\N	2014-07-01 05:09:28.743665	9999-12-31 00:00:00	t
b2a3fc0c-439c-4e74-8aba-605fb49365c8	df32548e-b5cd-4259-8b02-5459a02006e5	Data Granularity	Playford	2159a50f-39a1-4499-9ef9-88bde44b89d9	b2a3fc0c-439c-4e74-8aba-605fb49365c8	active	\N	2014-07-01 05:09:28.743665	9999-12-31 00:00:00	t
00b9124d-a5b5-47c3-a2be-d60bb76e97c5	4bed6b48-075c-4869-b312-a3528689e1e0	Data Location	Data 	64f2b4b0-e1d1-4cc0-995d-4d13923df310	00b9124d-a5b5-47c3-a2be-d60bb76e97c5	active	a8276fe4-de99-4899-80af-b5be82f1c7f2	2014-07-01 05:30:38.264819	2014-07-01 22:41:19.362509	f
0dcf97b9-110e-44cb-b29d-3c5ac7fd2b22	22eb0215-3470-4b00-ae74-3abe9fed9c7c	Geospatial Coverage	Adelaide (C) Local Government Area	a50f4c1f-a61e-43ba-9b21-577f7739f0ec	0dcf97b9-110e-44cb-b29d-3c5ac7fd2b22	active	\N	2014-07-01 05:10:10.676272	9999-12-31 00:00:00	t
a70afa3d-2317-4dd2-9047-f3008ef25aa3	22eb0215-3470-4b00-ae74-3abe9fed9c7c	Data Location	Linked	a50f4c1f-a61e-43ba-9b21-577f7739f0ec	a70afa3d-2317-4dd2-9047-f3008ef25aa3	active	\N	2014-07-01 05:10:10.676272	9999-12-31 00:00:00	t
9b9eb383-c5e6-47ff-9738-77b6b6b6ab01	22eb0215-3470-4b00-ae74-3abe9fed9c7c	Data Granularity	N/A	a50f4c1f-a61e-43ba-9b21-577f7739f0ec	9b9eb383-c5e6-47ff-9738-77b6b6b6ab01	active	\N	2014-07-01 05:10:10.676272	9999-12-31 00:00:00	t
c0376554-330d-407c-9106-1b2091407f01	22eb0215-3470-4b00-ae74-3abe9fed9c7c	Data Status	N/A	a50f4c1f-a61e-43ba-9b21-577f7739f0ec	c0376554-330d-407c-9106-1b2091407f01	active	\N	2014-07-01 05:10:10.676272	9999-12-31 00:00:00	t
8ed73531-49db-483a-8d8d-0313e03643f2	22eb0215-3470-4b00-ae74-3abe9fed9c7c	Update Frequency	Annually	a50f4c1f-a61e-43ba-9b21-577f7739f0ec	8ed73531-49db-483a-8d8d-0313e03643f2	active	\N	2014-07-01 05:10:10.676272	9999-12-31 00:00:00	t
7add4c04-ddd4-46d0-b58e-4b6759670bd7	22eb0215-3470-4b00-ae74-3abe9fed9c7c	Temporal Coverage	2007-2011	a50f4c1f-a61e-43ba-9b21-577f7739f0ec	7add4c04-ddd4-46d0-b58e-4b6759670bd7	active	\N	2014-07-01 05:10:10.676272	9999-12-31 00:00:00	t
1cc30dec-07a9-43ec-9634-7015ac71ce18	ca86b64e-3651-45bf-98ad-01a3c1a9a55f	Update Frequency	Annually	fca86f92-9e28-45bf-b93a-8abb4f8672ba	1cc30dec-07a9-43ec-9634-7015ac71ce18	active	\N	2014-07-01 05:11:20.478279	9999-12-31 00:00:00	t
f3a65ff6-7b3b-4da2-9067-16271831aa2b	ca86b64e-3651-45bf-98ad-01a3c1a9a55f	Data Granularity	N/A	fca86f92-9e28-45bf-b93a-8abb4f8672ba	f3a65ff6-7b3b-4da2-9067-16271831aa2b	active	\N	2014-07-01 05:11:20.478279	9999-12-31 00:00:00	t
47baf4d2-8cba-45cf-9717-74c138c7609f	ca86b64e-3651-45bf-98ad-01a3c1a9a55f	Data Status	N/A	fca86f92-9e28-45bf-b93a-8abb4f8672ba	47baf4d2-8cba-45cf-9717-74c138c7609f	active	\N	2014-07-01 05:11:20.478279	9999-12-31 00:00:00	t
6241601d-e66d-4cd1-8aee-1edfa57e3f1c	ca86b64e-3651-45bf-98ad-01a3c1a9a55f	Data Location	Linked	fca86f92-9e28-45bf-b93a-8abb4f8672ba	6241601d-e66d-4cd1-8aee-1edfa57e3f1c	active	\N	2014-07-01 05:11:20.478279	9999-12-31 00:00:00	t
f015d7c2-c642-4fa8-b913-619295b46f5e	ca86b64e-3651-45bf-98ad-01a3c1a9a55f	Temporal Coverage	2007-2011	fca86f92-9e28-45bf-b93a-8abb4f8672ba	f015d7c2-c642-4fa8-b913-619295b46f5e	active	\N	2014-07-01 05:11:20.478279	9999-12-31 00:00:00	t
2d8a61dc-9fa2-4691-a847-0f86510deae7	ca86b64e-3651-45bf-98ad-01a3c1a9a55f	Geospatial Coverage	Renmark Paringa (DC) Local Government Area	fca86f92-9e28-45bf-b93a-8abb4f8672ba	2d8a61dc-9fa2-4691-a847-0f86510deae7	active	\N	2014-07-01 05:11:20.478279	9999-12-31 00:00:00	t
94b03943-1816-4b8f-b2f0-cc23cc1b28e2	a521bbf5-e65b-4b86-8047-fc2424c18f88	Temporal Coverage	2007-2011	02f88c70-c18a-4189-8125-b45a791b6739	94b03943-1816-4b8f-b2f0-cc23cc1b28e2	active	\N	2014-07-01 05:18:55.197367	9999-12-31 00:00:00	t
cecaa995-1232-4cbb-8532-e6a445484aa7	a521bbf5-e65b-4b86-8047-fc2424c18f88	Data Location	Linked	02f88c70-c18a-4189-8125-b45a791b6739	cecaa995-1232-4cbb-8532-e6a445484aa7	active	\N	2014-07-01 05:18:55.197367	9999-12-31 00:00:00	t
9aa43133-573d-4187-b37f-b0c8e38fcdcc	a521bbf5-e65b-4b86-8047-fc2424c18f88	Data Granularity	N/A	02f88c70-c18a-4189-8125-b45a791b6739	9aa43133-573d-4187-b37f-b0c8e38fcdcc	active	\N	2014-07-01 05:18:55.197367	9999-12-31 00:00:00	t
458d023c-d5e6-451c-bb3d-566a9cadf7bc	a521bbf5-e65b-4b86-8047-fc2424c18f88	Geospatial Coverage	Robe (DC) Local Government Area	02f88c70-c18a-4189-8125-b45a791b6739	458d023c-d5e6-451c-bb3d-566a9cadf7bc	active	\N	2014-07-01 05:18:55.197367	9999-12-31 00:00:00	t
292e678d-f7a5-4ad8-a18b-2860130b68ae	a521bbf5-e65b-4b86-8047-fc2424c18f88	Data Status	N/A	02f88c70-c18a-4189-8125-b45a791b6739	292e678d-f7a5-4ad8-a18b-2860130b68ae	active	\N	2014-07-01 05:18:55.197367	9999-12-31 00:00:00	t
ef483469-15e6-4891-9c64-410c5ba2b9e1	edc0307a-ec97-4797-bf50-57be8f1f9357	Geospatial Coverage	Peterborough	f5074a8a-3fe3-494b-bc38-39a3e1ac3947	ef483469-15e6-4891-9c64-410c5ba2b9e1	active	\N	2014-07-01 05:17:29.692014	9999-12-31 00:00:00	t
cfa14e45-cf4c-46bd-937e-dbd84ec7c5fc	edc0307a-ec97-4797-bf50-57be8f1f9357	Temporal Coverage	2007-2011	f5074a8a-3fe3-494b-bc38-39a3e1ac3947	cfa14e45-cf4c-46bd-937e-dbd84ec7c5fc	active	\N	2014-07-01 05:17:29.692014	9999-12-31 00:00:00	t
f4fa6a19-3d96-405b-88d4-f07b4fd37bd3	edc0307a-ec97-4797-bf50-57be8f1f9357	Data Granularity	N/A	f5074a8a-3fe3-494b-bc38-39a3e1ac3947	f4fa6a19-3d96-405b-88d4-f07b4fd37bd3	active	\N	2014-07-01 05:17:29.692014	9999-12-31 00:00:00	t
f68023b7-14d0-4239-8f59-3ed545763454	7fe9cba1-cc09-4694-bba8-58c3d338a04c	Data Granularity	N/A	7d077f21-ae5d-48f2-b0ac-efcb4ade1348	f68023b7-14d0-4239-8f59-3ed545763454	active	\N	2014-07-03 03:39:46.364536	9999-12-31 00:00:00	t
841fefcb-30be-473b-bb37-4958d8bed793	edc0307a-ec97-4797-bf50-57be8f1f9357	Data Status	N/A	f5074a8a-3fe3-494b-bc38-39a3e1ac3947	841fefcb-30be-473b-bb37-4958d8bed793	active	\N	2014-07-01 05:17:29.692014	9999-12-31 00:00:00	t
22d5818b-879a-4570-bff2-7ea643ec8805	7fe9cba1-cc09-4694-bba8-58c3d338a04c	Geospatial Coverage	South Australia	7d077f21-ae5d-48f2-b0ac-efcb4ade1348	22d5818b-879a-4570-bff2-7ea643ec8805	active	\N	2014-07-03 03:39:46.364536	9999-12-31 00:00:00	t
7652fdc3-6520-4a3d-ae02-358b5ac69e4a	4ec703e0-5329-4de1-8b9f-d5ef3fc1cc09	Data Status	N/A	af286ca5-39b8-4044-915a-22d322ac23c8	7652fdc3-6520-4a3d-ae02-358b5ac69e4a	active	\N	2014-07-02 00:00:58.993125	9999-12-31 00:00:00	t
7cb6794a-54fe-4ea3-9981-bea5981fe1d9	4ec703e0-5329-4de1-8b9f-d5ef3fc1cc09	Data Location	Linked	af286ca5-39b8-4044-915a-22d322ac23c8	7cb6794a-54fe-4ea3-9981-bea5981fe1d9	active	\N	2014-07-02 00:00:58.993125	9999-12-31 00:00:00	t
04107620-164f-44f3-ac92-f96d907ec070	9d95d06d-a34d-46a0-822f-7437b4162bc3	Update Frequency	Annually	2c9356ff-9687-4252-9fdb-7c602f91b258	04107620-164f-44f3-ac92-f96d907ec070	active	\N	2014-07-01 05:27:54.59106	9999-12-31 00:00:00	t
8129b12c-68da-47fa-8431-afcf3740dfd1	9d95d06d-a34d-46a0-822f-7437b4162bc3	Geospatial Coverage	City of Salisbury LGA	2c9356ff-9687-4252-9fdb-7c602f91b258	8129b12c-68da-47fa-8431-afcf3740dfd1	active	\N	2014-07-01 05:27:54.59106	9999-12-31 00:00:00	t
9a60bf6c-6522-475d-831c-8378cfb635c4	9d95d06d-a34d-46a0-822f-7437b4162bc3	Data Location	City of Salisbury	2c9356ff-9687-4252-9fdb-7c602f91b258	9a60bf6c-6522-475d-831c-8378cfb635c4	active	\N	2014-07-01 05:27:54.59106	9999-12-31 00:00:00	t
878dc2f0-7d03-4ba4-92b8-fbd990d1679d	4ec703e0-5329-4de1-8b9f-d5ef3fc1cc09	Temporal Coverage	2007-2011	af286ca5-39b8-4044-915a-22d322ac23c8	878dc2f0-7d03-4ba4-92b8-fbd990d1679d	active	\N	2014-07-02 00:00:58.993125	9999-12-31 00:00:00	t
542159ef-1bd4-4033-8b26-ba87e14eba2c	4ec703e0-5329-4de1-8b9f-d5ef3fc1cc09	Update Frequency	Annually	af286ca5-39b8-4044-915a-22d322ac23c8	542159ef-1bd4-4033-8b26-ba87e14eba2c	active	\N	2014-07-02 00:00:58.993125	9999-12-31 00:00:00	t
6be25f75-4faf-4f5d-a3e1-fd69803c60c1	943869ff-2329-4ca4-99f1-395be0f9329c	Temporal Coverage	2007-2011	46e736ac-ee0d-47cc-9e6d-a4960ae7b474	6be25f75-4faf-4f5d-a3e1-fd69803c60c1	active	\N	2014-07-01 06:50:55.658526	9999-12-31 00:00:00	t
9bdb7337-b2fd-4223-8606-8fc766a96a03	943869ff-2329-4ca4-99f1-395be0f9329c	Geospatial Coverage	Salisbury (C) Local Government Area	46e736ac-ee0d-47cc-9e6d-a4960ae7b474	9bdb7337-b2fd-4223-8606-8fc766a96a03	active	\N	2014-07-01 06:50:55.658526	9999-12-31 00:00:00	t
6daa56b3-5aa2-4b95-b80c-3821c628829b	943869ff-2329-4ca4-99f1-395be0f9329c	Data Status	N/A	46e736ac-ee0d-47cc-9e6d-a4960ae7b474	6daa56b3-5aa2-4b95-b80c-3821c628829b	active	\N	2014-07-01 06:50:55.658526	9999-12-31 00:00:00	t
c0f78735-efed-438e-9342-e18e2b11471e	943869ff-2329-4ca4-99f1-395be0f9329c	Data Location	Linked	46e736ac-ee0d-47cc-9e6d-a4960ae7b474	c0f78735-efed-438e-9342-e18e2b11471e	active	\N	2014-07-01 06:50:55.658526	9999-12-31 00:00:00	t
bc6e7ea4-6ab0-47db-85f8-fec812536d8c	943869ff-2329-4ca4-99f1-395be0f9329c	Update Frequency	Annually	46e736ac-ee0d-47cc-9e6d-a4960ae7b474	bc6e7ea4-6ab0-47db-85f8-fec812536d8c	active	\N	2014-07-01 06:50:55.658526	9999-12-31 00:00:00	t
d47aa8d9-ab61-4669-a94c-1fa496139408	943869ff-2329-4ca4-99f1-395be0f9329c	Data Granularity	N/A	46e736ac-ee0d-47cc-9e6d-a4960ae7b474	d47aa8d9-ab61-4669-a94c-1fa496139408	active	\N	2014-07-01 06:50:55.658526	9999-12-31 00:00:00	t
b61af0d8-ed5a-446c-b493-97a250e914eb	cc3bba7a-2340-4575-8a6f-561e8c604bd6	Data Granularity	N/A	e0ec6791-d4ca-4087-9e88-14dd9c7e98f0	b61af0d8-ed5a-446c-b493-97a250e914eb	active	\N	2014-07-01 07:06:40.19796	9999-12-31 00:00:00	t
4e26d5f1-11b6-451a-b3fe-5cb125770c01	cc3bba7a-2340-4575-8a6f-561e8c604bd6	Update Frequency	Annually	e0ec6791-d4ca-4087-9e88-14dd9c7e98f0	4e26d5f1-11b6-451a-b3fe-5cb125770c01	active	\N	2014-07-01 07:06:40.19796	9999-12-31 00:00:00	t
864d635c-f55e-4bb9-9de1-1625decdaad7	cc3bba7a-2340-4575-8a6f-561e8c604bd6	Geospatial Coverage	Burnside (C) Local Government Area	e0ec6791-d4ca-4087-9e88-14dd9c7e98f0	864d635c-f55e-4bb9-9de1-1625decdaad7	active	\N	2014-07-01 07:06:40.19796	9999-12-31 00:00:00	t
d39a32fb-672f-43f7-9882-98d40f8200cd	cc3bba7a-2340-4575-8a6f-561e8c604bd6	Data Status	N/A	e0ec6791-d4ca-4087-9e88-14dd9c7e98f0	d39a32fb-672f-43f7-9882-98d40f8200cd	active	\N	2014-07-01 07:06:40.19796	9999-12-31 00:00:00	t
ea7d00ff-a748-447e-aae3-5a60de61bfd3	cc3bba7a-2340-4575-8a6f-561e8c604bd6	Temporal Coverage	2007-2011	e0ec6791-d4ca-4087-9e88-14dd9c7e98f0	ea7d00ff-a748-447e-aae3-5a60de61bfd3	active	\N	2014-07-01 07:06:40.19796	9999-12-31 00:00:00	t
47c24aba-a575-4966-af93-eebde8c4fba3	cc3bba7a-2340-4575-8a6f-561e8c604bd6	Data Location	Linked	e0ec6791-d4ca-4087-9e88-14dd9c7e98f0	47c24aba-a575-4966-af93-eebde8c4fba3	active	\N	2014-07-01 07:06:40.19796	9999-12-31 00:00:00	t
ec3fd36d-c8a3-467a-9a98-efd54e55735d	1612db12-2bf2-4d0b-9dd4-b5ae609bad2a	Data Status	N/A	e4a879f6-fb6c-40e6-a5f6-5daa8ce331c4	ec3fd36d-c8a3-467a-9a98-efd54e55735d	active	\N	2014-07-01 07:07:35.179515	9999-12-31 00:00:00	t
04969217-a3b8-4489-b560-faad1f2beccd	1612db12-2bf2-4d0b-9dd4-b5ae609bad2a	Data Granularity	N/A	e4a879f6-fb6c-40e6-a5f6-5daa8ce331c4	04969217-a3b8-4489-b560-faad1f2beccd	active	\N	2014-07-01 07:07:35.179515	9999-12-31 00:00:00	t
259363bf-af30-45ed-a497-9e200e4a3caf	1612db12-2bf2-4d0b-9dd4-b5ae609bad2a	Data Location	Linked	e4a879f6-fb6c-40e6-a5f6-5daa8ce331c4	259363bf-af30-45ed-a497-9e200e4a3caf	active	\N	2014-07-01 07:07:35.179515	9999-12-31 00:00:00	t
18af4812-8f67-4e89-82ac-de335af61787	1612db12-2bf2-4d0b-9dd4-b5ae609bad2a	Update Frequency	Annually	e4a879f6-fb6c-40e6-a5f6-5daa8ce331c4	18af4812-8f67-4e89-82ac-de335af61787	active	\N	2014-07-01 07:07:35.179515	9999-12-31 00:00:00	t
e489d0a1-c8e4-47d1-9c8f-87855823468a	1612db12-2bf2-4d0b-9dd4-b5ae609bad2a	Temporal Coverage	2007-2011	e4a879f6-fb6c-40e6-a5f6-5daa8ce331c4	e489d0a1-c8e4-47d1-9c8f-87855823468a	active	\N	2014-07-01 07:07:35.179515	9999-12-31 00:00:00	t
c62717fb-9894-408e-ab59-9f14d196751a	1612db12-2bf2-4d0b-9dd4-b5ae609bad2a	Geospatial Coverage	Southern Mallee (DC) Local Government Area	e4a879f6-fb6c-40e6-a5f6-5daa8ce331c4	c62717fb-9894-408e-ab59-9f14d196751a	active	\N	2014-07-01 07:07:35.179515	9999-12-31 00:00:00	t
9f1c98b9-2073-452a-8117-14e4601504d8	edc0307a-ec97-4797-bf50-57be8f1f9357	Data Location	Linked	f5074a8a-3fe3-494b-bc38-39a3e1ac3947	9f1c98b9-2073-452a-8117-14e4601504d8	active	f3685078-e702-4ae4-a34d-527dc5f8fec5	2014-07-01 05:17:29.692014	2014-07-01 22:35:00.823552	f
5b8bc326-cf35-477d-b117-89ad7cc97f73	8bfe1b88-c585-4bfc-b5af-26c4be880f01	Data Status	N/A	25d252d7-9db3-4f52-87f9-74a225337e11	5b8bc326-cf35-477d-b117-89ad7cc97f73	active	\N	2014-07-01 23:21:28.030264	9999-12-31 00:00:00	t
2a1a5ad6-0117-4105-8652-ca566859db99	a521bbf5-e65b-4b86-8047-fc2424c18f88	Update Frequency	Annually	02f88c70-c18a-4189-8125-b45a791b6739	2a1a5ad6-0117-4105-8652-ca566859db99	active	\N	2014-07-01 05:18:55.197367	9999-12-31 00:00:00	t
83c57f1e-0432-40ab-8f6d-33e05dafe204	7fe9cba1-cc09-4694-bba8-58c3d338a04c	Update Frequency	As Required	7d077f21-ae5d-48f2-b0ac-efcb4ade1348	83c57f1e-0432-40ab-8f6d-33e05dafe204	active	\N	2014-07-03 03:39:46.364536	9999-12-31 00:00:00	t
9f1c98b9-2073-452a-8117-14e4601504d8	edc0307a-ec97-4797-bf50-57be8f1f9357	Data Location	Hosted	f6bac961-aa30-4459-931b-d014591927cf	9f1c98b9-2073-452a-8117-14e4601504d8	active	86c5488c-71a8-4db9-9cd4-71bf1d1c36a0	2014-07-01 22:40:28.969742	2014-07-01 23:53:49.929656	f
d62fe8f6-7d4c-4532-bbae-caadcd96c0d8	df32548e-b5cd-4259-8b02-5459a02006e5	Data Location	Hosted	fb8a1919-391e-41fe-9749-62d4488d0405	d62fe8f6-7d4c-4532-bbae-caadcd96c0d8	active	9441142f-7999-44dd-bf07-4999ba74b788	2014-07-01 22:39:55.875415	2014-07-01 23:55:04.696169	f
7627e1a7-3b01-464c-bd05-52835b16d3b0	7358f6f6-befd-43e4-8ef5-7a6882044312	 Data Location	Hosted	bc84c14a-2559-4204-9e51-7ae03e42cd65	7627e1a7-3b01-464c-bd05-52835b16d3b0	active	9487f559-c93d-4444-b297-2a13bc0f6d0b	2014-07-01 22:39:30.878239	2014-07-01 23:56:26.215424	f
5a2007e3-c2ba-4af4-baa2-3adbb4be62cc	b057d8db-4a45-4075-84df-133403b7f436	Data Granularity	N/A	d3012c82-18dc-4f0e-a1f9-0e563dd1b6a3	5a2007e3-c2ba-4af4-baa2-3adbb4be62cc	active	\N	2014-07-01 07:15:06.398026	9999-12-31 00:00:00	t
b54b0b60-9708-416b-a114-625a0f5896f9	b057d8db-4a45-4075-84df-133403b7f436	Data Status	N/A	d3012c82-18dc-4f0e-a1f9-0e563dd1b6a3	b54b0b60-9708-416b-a114-625a0f5896f9	active	\N	2014-07-01 07:15:06.398026	9999-12-31 00:00:00	t
2b99f8f5-ba3c-44fe-a4dd-e4f92adb9b7d	b057d8db-4a45-4075-84df-133403b7f436	Update Frequency	Annually	d3012c82-18dc-4f0e-a1f9-0e563dd1b6a3	2b99f8f5-ba3c-44fe-a4dd-e4f92adb9b7d	active	\N	2014-07-01 07:15:06.398026	9999-12-31 00:00:00	t
18da52f7-b408-4057-a2a6-f0d89a161fb8	b057d8db-4a45-4075-84df-133403b7f436	Temporal Coverage	2007-2011	d3012c82-18dc-4f0e-a1f9-0e563dd1b6a3	18da52f7-b408-4057-a2a6-f0d89a161fb8	active	\N	2014-07-01 07:15:06.398026	9999-12-31 00:00:00	t
3799077b-ed4f-4e08-9818-44e19d0bb0d2	b057d8db-4a45-4075-84df-133403b7f436	Data Location	Linked	d3012c82-18dc-4f0e-a1f9-0e563dd1b6a3	3799077b-ed4f-4e08-9818-44e19d0bb0d2	active	\N	2014-07-01 07:15:06.398026	9999-12-31 00:00:00	t
89fbcdaf-be41-4c2f-9c27-e406d3168302	b057d8db-4a45-4075-84df-133403b7f436	Geospatial Coverage	Streaky Bay (DC) Local Government Area	d3012c82-18dc-4f0e-a1f9-0e563dd1b6a3	89fbcdaf-be41-4c2f-9c27-e406d3168302	active	\N	2014-07-01 07:15:06.398026	9999-12-31 00:00:00	t
5d1b0950-ad95-497f-9fed-ab2022b012f7	662b5c78-476e-4f38-a645-c527e3d56458	Data Location	Hosted	edd7e195-f73c-457f-9c8b-972cb6551aa8	5d1b0950-ad95-497f-9fed-ab2022b012f7	active	39ce33ad-3e18-49c2-b789-2926116871ca	2014-07-01 22:39:06.074929	2014-07-01 23:57:52.071607	f
b1e1295a-abd7-4801-be9a-cc1d9591562a	ffb997ef-54f2-4762-ad7f-c38374715ef5	Geospatial Coverage	Campbelltown (C) Local Government Area	d8011ac3-1636-47fd-ab86-982de6e4959d	b1e1295a-abd7-4801-be9a-cc1d9591562a	active	\N	2014-07-01 07:39:10.094098	9999-12-31 00:00:00	t
1498740b-e329-4713-8ef8-f3c80c9e3499	ffb997ef-54f2-4762-ad7f-c38374715ef5	Data Granularity	N/A	d8011ac3-1636-47fd-ab86-982de6e4959d	1498740b-e329-4713-8ef8-f3c80c9e3499	active	\N	2014-07-01 07:39:10.094098	9999-12-31 00:00:00	t
9c3815e0-3455-4541-9fe4-c385d0ea1ab6	ffb997ef-54f2-4762-ad7f-c38374715ef5	Update Frequency	Annually	d8011ac3-1636-47fd-ab86-982de6e4959d	9c3815e0-3455-4541-9fe4-c385d0ea1ab6	active	\N	2014-07-01 07:39:10.094098	9999-12-31 00:00:00	t
6398f3f3-1899-43a9-a79e-9e506f5f89c7	c56c892a-9179-4eb1-8a0d-35e5f9f58ec5	Data Location	Hosted	6adddba3-b92d-4c8c-8891-1eba38c472d3	6398f3f3-1899-43a9-a79e-9e506f5f89c7	active	5abeb10b-7a7f-4982-98a0-de7878f70327	2014-07-01 22:38:35.016929	2014-07-01 23:58:51.32109	f
23a14faf-e3f5-43af-bd5b-2eec770f0adf	179bd871-6585-488d-a0b1-fd483db57e11	Data Location	Hosted	d3f56907-2507-4e94-ba3f-bc60edffba4c	23a14faf-e3f5-43af-bd5b-2eec770f0adf	active	63510178-90f8-493c-99b8-f50095e646fc	2014-07-01 22:38:11.949368	2014-07-01 23:59:55.449209	f
49e455d2-3d06-43f8-937d-77bba09ff722	4ec703e0-5329-4de1-8b9f-d5ef3fc1cc09	Data Granularity	N/A	af286ca5-39b8-4044-915a-22d322ac23c8	49e455d2-3d06-43f8-937d-77bba09ff722	active	\N	2014-07-02 00:00:58.993125	9999-12-31 00:00:00	t
f052b1f0-ac2f-4914-8066-a491301c008c	4ec703e0-5329-4de1-8b9f-d5ef3fc1cc09	Geospatial Coverage	Unincorporated SA	af286ca5-39b8-4044-915a-22d322ac23c8	f052b1f0-ac2f-4914-8066-a491301c008c	active	\N	2014-07-02 00:00:58.993125	9999-12-31 00:00:00	t
7627e1a7-3b01-464c-bd05-52835b16d3b0	7358f6f6-befd-43e4-8ef5-7a6882044312	 Data Location	Linked	8b816cef-4b6d-46a8-ba18-07ca0698f8cd	7627e1a7-3b01-464c-bd05-52835b16d3b0	active	8b0e797d-ce02-460a-9238-c2fc088fd634	2014-07-01 04:58:03.185888	2014-07-01 22:36:04.562517	f
5d1b0950-ad95-497f-9fed-ab2022b012f7	662b5c78-476e-4f38-a645-c527e3d56458	Data Location	Linked	aabc29a7-e16f-4527-a749-8da83a0d2f08	5d1b0950-ad95-497f-9fed-ab2022b012f7	active	8b76030a-0f12-4410-a6cb-e16b1d918f9f	2014-07-01 04:51:10.251879	2014-07-01 22:36:34.914404	f
23a14faf-e3f5-43af-bd5b-2eec770f0adf	179bd871-6585-488d-a0b1-fd483db57e11	Data Location	Data	f1a07cfd-07a5-4f25-85f6-7beae20007b0	23a14faf-e3f5-43af-bd5b-2eec770f0adf	active	d3f56907-2507-4e94-ba3f-bc60edffba4c	2014-07-01 22:37:31.147372	2014-07-01 22:38:11.949368	f
6398f3f3-1899-43a9-a79e-9e506f5f89c7	c56c892a-9179-4eb1-8a0d-35e5f9f58ec5	Data Location	Data	598e74a9-f135-44a2-b5dd-20ae4c812867	6398f3f3-1899-43a9-a79e-9e506f5f89c7	active	6adddba3-b92d-4c8c-8891-1eba38c472d3	2014-07-01 22:37:04.515435	2014-07-01 22:38:35.016929	f
5d1b0950-ad95-497f-9fed-ab2022b012f7	662b5c78-476e-4f38-a645-c527e3d56458	Data Location	Data	8b76030a-0f12-4410-a6cb-e16b1d918f9f	5d1b0950-ad95-497f-9fed-ab2022b012f7	active	edd7e195-f73c-457f-9c8b-972cb6551aa8	2014-07-01 22:36:34.914404	2014-07-01 22:39:06.074929	f
42bb3951-4a7e-4cf9-abe0-b9a3fe95995c	a036641a-c7f6-4491-a8f3-0ed733215804	Data Location	Linked	ac8571f1-f691-4b30-b88d-eaec09b3d36e	42bb3951-4a7e-4cf9-abe0-b9a3fe95995c	active	\N	2014-07-01 23:43:46.874775	9999-12-31 00:00:00	t
7627e1a7-3b01-464c-bd05-52835b16d3b0	7358f6f6-befd-43e4-8ef5-7a6882044312	 Data Location	Data	8b0e797d-ce02-460a-9238-c2fc088fd634	7627e1a7-3b01-464c-bd05-52835b16d3b0	active	bc84c14a-2559-4204-9e51-7ae03e42cd65	2014-07-01 22:36:04.562517	2014-07-01 22:39:30.878239	f
d62fe8f6-7d4c-4532-bbae-caadcd96c0d8	df32548e-b5cd-4259-8b02-5459a02006e5	Data Location	Data	4669ce75-dbdd-49f5-9591-5766b4cce24d	d62fe8f6-7d4c-4532-bbae-caadcd96c0d8	active	fb8a1919-391e-41fe-9749-62d4488d0405	2014-07-01 22:35:35.449194	2014-07-01 22:39:55.875415	f
9f1c98b9-2073-452a-8117-14e4601504d8	edc0307a-ec97-4797-bf50-57be8f1f9357	Data Location	Data	f3685078-e702-4ae4-a34d-527dc5f8fec5	9f1c98b9-2073-452a-8117-14e4601504d8	active	f6bac961-aa30-4459-931b-d014591927cf	2014-07-01 22:35:00.823552	2014-07-01 22:40:28.969742	f
b7f287f4-99f0-491d-b86f-635680cc18fc	2a0d6531-6a1e-496d-b287-c7548125a183	Data Location	Data	d6dfc6a7-8710-46d8-b964-a30ad9fc2814	b7f287f4-99f0-491d-b86f-635680cc18fc	active	35d62fd0-5140-4c40-b21d-c8225c97fce3	2014-07-01 22:34:03.243005	2014-07-01 22:40:55.911987	f
00b9124d-a5b5-47c3-a2be-d60bb76e97c5	4bed6b48-075c-4869-b312-a3528689e1e0	Data Location	Hosted	a8276fe4-de99-4899-80af-b5be82f1c7f2	00b9124d-a5b5-47c3-a2be-d60bb76e97c5	active	e80d3a9e-4a40-4271-91ad-78000e66d9e9	2014-07-01 22:41:19.362509	2014-07-01 23:51:31.284995	f
b7f287f4-99f0-491d-b86f-635680cc18fc	2a0d6531-6a1e-496d-b287-c7548125a183	Data Location	Hosted	35d62fd0-5140-4c40-b21d-c8225c97fce3	b7f287f4-99f0-491d-b86f-635680cc18fc	active	67a30e62-ca60-470d-9eb0-850953ea59e0	2014-07-01 22:40:55.911987	2014-07-01 23:52:49.267605	f
2add1b1c-8ee3-4dc6-9979-3d0fa0e8a89a	2a0d6531-6a1e-496d-b287-c7548125a183	Data Granularity	N/A	3ddb2236-4054-45ca-b0ca-1f3a79574cc3	2add1b1c-8ee3-4dc6-9979-3d0fa0e8a89a	active	\N	2014-07-01 05:24:21.512343	9999-12-31 00:00:00	t
8d8078b4-8cc4-4d7a-9774-d625140bcd1d	7fe9cba1-cc09-4694-bba8-58c3d338a04c	Data Location	Linked	7d077f21-ae5d-48f2-b0ac-efcb4ade1348	8d8078b4-8cc4-4d7a-9774-d625140bcd1d	active	\N	2014-07-03 03:39:46.364536	9999-12-31 00:00:00	t
4c6f71f7-b999-4c8a-acbe-d5bb8368e619	2a0d6531-6a1e-496d-b287-c7548125a183	Data Status	N/A	3ddb2236-4054-45ca-b0ca-1f3a79574cc3	4c6f71f7-b999-4c8a-acbe-d5bb8368e619	active	\N	2014-07-01 05:24:21.512343	9999-12-31 00:00:00	t
995cb742-7076-46db-b35e-675b5a5fe735	2a0d6531-6a1e-496d-b287-c7548125a183	Temporal Coverage	2007-2011	3ddb2236-4054-45ca-b0ca-1f3a79574cc3	995cb742-7076-46db-b35e-675b5a5fe735	active	\N	2014-07-01 05:24:21.512343	9999-12-31 00:00:00	t
5c732b63-c017-41cb-84ca-ae0a29796164	2a0d6531-6a1e-496d-b287-c7548125a183	Geospatial Coverage	Orroroo Carrieton	3ddb2236-4054-45ca-b0ca-1f3a79574cc3	5c732b63-c017-41cb-84ca-ae0a29796164	active	\N	2014-07-01 05:24:21.512343	9999-12-31 00:00:00	t
04b0ea1d-fd29-4ace-9753-ec94e4ae77bb	b7c5d80c-0944-4b95-ad07-7082a8fa0e0a	Data Location	Linked	2cc181b7-ef20-45a0-9187-a94ef2e7ed70	04b0ea1d-fd29-4ace-9753-ec94e4ae77bb	active	\N	2014-07-02 00:02:20.483314	9999-12-31 00:00:00	t
b7f287f4-99f0-491d-b86f-635680cc18fc	2a0d6531-6a1e-496d-b287-c7548125a183	Data Location	Linked	3ddb2236-4054-45ca-b0ca-1f3a79574cc3	b7f287f4-99f0-491d-b86f-635680cc18fc	active	d6dfc6a7-8710-46d8-b964-a30ad9fc2814	2014-07-01 05:24:21.512343	2014-07-01 22:34:03.243005	f
b9b12e6a-ef18-40f7-b205-673288c4e031	2a9a66b7-7d65-47a5-9f7f-61fe3de91052	Data		722d8c70-59dc-4624-9e36-bd8057385b51	b9b12e6a-ef18-40f7-b205-673288c4e031	active	3f15b9d3-11a1-45dd-af8e-55803d08c77b	2014-07-01 05:29:18.642983	2014-07-01 05:31:39.271705	f
6152305f-9fcf-4653-aa53-e403926e38d0	ea1cb8f9-d6ec-4da9-9346-54b58218b005	Update Frequency	Annually	1baa1a2b-3864-4abc-b587-03de098b7141	6152305f-9fcf-4653-aa53-e403926e38d0	active	\N	2014-07-01 22:45:33.162017	9999-12-31 00:00:00	t
9fa41b77-6aed-4f3e-ac63-8d9281f928e7	ea1cb8f9-d6ec-4da9-9346-54b58218b005	Geospatial Coverage	Light	1baa1a2b-3864-4abc-b587-03de098b7141	9fa41b77-6aed-4f3e-ac63-8d9281f928e7	active	\N	2014-07-01 22:45:33.162017	9999-12-31 00:00:00	t
e18095bc-9cea-4235-844e-f7dd960439c0	ea1cb8f9-d6ec-4da9-9346-54b58218b005	Data Status	N/A	1baa1a2b-3864-4abc-b587-03de098b7141	e18095bc-9cea-4235-844e-f7dd960439c0	active	\N	2014-07-01 22:45:33.162017	9999-12-31 00:00:00	t
332256c5-7921-42a3-818d-5be4ad4fbb24	ea1cb8f9-d6ec-4da9-9346-54b58218b005	Temporal Coverage	2007-2011	1baa1a2b-3864-4abc-b587-03de098b7141	332256c5-7921-42a3-818d-5be4ad4fbb24	active	\N	2014-07-01 22:45:33.162017	9999-12-31 00:00:00	t
611d51b7-c54c-4024-b958-7fb9003bb34d	ea1cb8f9-d6ec-4da9-9346-54b58218b005	 Data Granularity	N/A	1baa1a2b-3864-4abc-b587-03de098b7141	611d51b7-c54c-4024-b958-7fb9003bb34d	active	\N	2014-07-01 22:45:33.162017	9999-12-31 00:00:00	t
7de24152-efc4-404e-8caa-758da6336049	7a86206e-565d-4704-a993-5e2537c47973	Data Location	Link	553aaa5d-019d-4b87-a7da-905602442e6d	7de24152-efc4-404e-8caa-758da6336049	active	fbd68c09-7001-4a10-8088-ac251fa98566	2014-07-01 23:44:04.143286	2014-07-02 00:04:06.898817	f
477f8858-80df-4925-81ed-fc4ff4919394	b7c5d80c-0944-4b95-ad07-7082a8fa0e0a	Geospatial Coverage	Lower Eyre Peninsula	3f70ac16-beb6-4d5f-aa3a-b3f9b5350599	477f8858-80df-4925-81ed-fc4ff4919394	active	\N	2014-07-01 22:50:03.996114	9999-12-31 00:00:00	t
d84bc393-96f7-4a5f-8fb2-98661d7a2d89	b7c5d80c-0944-4b95-ad07-7082a8fa0e0a	Temporal Coverage	2007-2011	3f70ac16-beb6-4d5f-aa3a-b3f9b5350599	d84bc393-96f7-4a5f-8fb2-98661d7a2d89	active	\N	2014-07-01 22:50:03.996114	9999-12-31 00:00:00	t
62366285-e2a7-4832-9660-de0c17d73cfa	b7c5d80c-0944-4b95-ad07-7082a8fa0e0a	Update Frequency	Annually	3f70ac16-beb6-4d5f-aa3a-b3f9b5350599	62366285-e2a7-4832-9660-de0c17d73cfa	active	\N	2014-07-01 22:50:03.996114	9999-12-31 00:00:00	t
8f0b4ab1-c1a8-4b84-af15-12f96584ab85	b7c5d80c-0944-4b95-ad07-7082a8fa0e0a	Data Status	N/A	3f70ac16-beb6-4d5f-aa3a-b3f9b5350599	8f0b4ab1-c1a8-4b84-af15-12f96584ab85	active	\N	2014-07-01 22:50:03.996114	9999-12-31 00:00:00	t
50e94a24-2660-4d82-96da-3e92a5c98c4b	b7c5d80c-0944-4b95-ad07-7082a8fa0e0a	Data Granularity	N/A	3f70ac16-beb6-4d5f-aa3a-b3f9b5350599	50e94a24-2660-4d82-96da-3e92a5c98c4b	active	\N	2014-07-01 22:50:03.996114	9999-12-31 00:00:00	t
a1e77b40-fcc9-4594-9e4d-2a5d255ac23c	c1b9308d-f2a1-4b2b-8247-60cd63e6ec12	Data Status	N/A	d0f71273-c318-4502-9276-b616fb04ab5b	a1e77b40-fcc9-4594-9e4d-2a5d255ac23c	active	\N	2014-07-01 23:11:22.36758	9999-12-31 00:00:00	t
57bcc7ee-2d87-4db3-ac22-bb43e9c2cdd8	c1b9308d-f2a1-4b2b-8247-60cd63e6ec12	Data Granularity	N/A	d0f71273-c318-4502-9276-b616fb04ab5b	57bcc7ee-2d87-4db3-ac22-bb43e9c2cdd8	active	\N	2014-07-01 23:11:22.36758	9999-12-31 00:00:00	t
8011e135-7d8d-419f-b90a-e312d1104e1a	c1b9308d-f2a1-4b2b-8247-60cd63e6ec12	Geospatial Coverage	Marion	d0f71273-c318-4502-9276-b616fb04ab5b	8011e135-7d8d-419f-b90a-e312d1104e1a	active	\N	2014-07-01 23:11:22.36758	9999-12-31 00:00:00	t
06e22deb-ad2f-47d1-94aa-c7c6ca21e0e4	c1b9308d-f2a1-4b2b-8247-60cd63e6ec12	Temporal Coverage	2007-2011	d0f71273-c318-4502-9276-b616fb04ab5b	06e22deb-ad2f-47d1-94aa-c7c6ca21e0e4	active	\N	2014-07-01 23:11:22.36758	9999-12-31 00:00:00	t
39c57193-3845-4d35-baa2-92d467b4cecd	c1b9308d-f2a1-4b2b-8247-60cd63e6ec12	Update Frequency	Annually	d0f71273-c318-4502-9276-b616fb04ab5b	39c57193-3845-4d35-baa2-92d467b4cecd	active	\N	2014-07-01 23:11:22.36758	9999-12-31 00:00:00	t
13450569-ba5d-4d10-89cf-9edf9802aa5c	8bfe1b88-c585-4bfc-b5af-26c4be880f01	Data Granularity	N/A	25d252d7-9db3-4f52-87f9-74a225337e11	13450569-ba5d-4d10-89cf-9edf9802aa5c	active	\N	2014-07-01 23:21:28.030264	9999-12-31 00:00:00	t
6adfd00a-1929-4bf8-afa7-990a9908d9f7	8bfe1b88-c585-4bfc-b5af-26c4be880f01	Temporal Coverage	2007-2011	25d252d7-9db3-4f52-87f9-74a225337e11	6adfd00a-1929-4bf8-afa7-990a9908d9f7	active	\N	2014-07-01 23:21:28.030264	9999-12-31 00:00:00	t
ce121eb4-34d3-4a2c-9c63-9a110bd2d4f0	ea1cb8f9-d6ec-4da9-9346-54b58218b005	Data Location	Hosted	1baa1a2b-3864-4abc-b587-03de098b7141	ce121eb4-34d3-4a2c-9c63-9a110bd2d4f0	active	5f5bf4a0-66c7-47c5-b2e1-8fdb2ee74950	2014-07-01 22:45:33.162017	2014-07-01 23:37:20.833184	f
04b0ea1d-fd29-4ace-9753-ec94e4ae77bb	b7c5d80c-0944-4b95-ad07-7082a8fa0e0a	Data Location	Hosted	3f70ac16-beb6-4d5f-aa3a-b3f9b5350599	04b0ea1d-fd29-4ace-9753-ec94e4ae77bb	active	ac014e61-6ef3-475f-a77a-b91e35f85dfc	2014-07-01 22:50:03.996114	2014-07-01 23:39:01.404466	f
7952d137-3f89-49f0-a98f-22df83a847b6	c1b9308d-f2a1-4b2b-8247-60cd63e6ec12	Data Location	Hosted	d0f71273-c318-4502-9276-b616fb04ab5b	7952d137-3f89-49f0-a98f-22df83a847b6	active	7b584240-8348-4a43-bdd4-16d04d0f06f0	2014-07-01 23:11:22.36758	2014-07-01 23:42:57.37506	f
902e328c-5330-457f-9ab1-5c27b41d370e	8bfe1b88-c585-4bfc-b5af-26c4be880f01	Data Location	Hosted	25d252d7-9db3-4f52-87f9-74a225337e11	902e328c-5330-457f-9ab1-5c27b41d370e	active	aa7a7e20-260f-43d4-aac4-63df23d1c05e	2014-07-01 23:21:28.030264	2014-07-01 23:50:31.092865	f
ee2f1656-d7fe-428f-ac5a-346c20c86ea7	4bed6b48-075c-4869-b312-a3528689e1e0	Geospatial Coverage	Onkaparinga	64f2b4b0-e1d1-4cc0-995d-4d13923df310	ee2f1656-d7fe-428f-ac5a-346c20c86ea7	active	\N	2014-07-01 05:30:38.264819	9999-12-31 00:00:00	t
05b86242-b713-4c59-b1f6-e5b3d5d7e46a	4bed6b48-075c-4869-b312-a3528689e1e0	Data Status	N/A	64f2b4b0-e1d1-4cc0-995d-4d13923df310	05b86242-b713-4c59-b1f6-e5b3d5d7e46a	active	\N	2014-07-01 05:30:38.264819	9999-12-31 00:00:00	t
4bec3628-fcfd-4dbc-b72d-957f0c3f0e3b	4bed6b48-075c-4869-b312-a3528689e1e0	Temporal Coverage	2007-2011	64f2b4b0-e1d1-4cc0-995d-4d13923df310	4bec3628-fcfd-4dbc-b72d-957f0c3f0e3b	active	\N	2014-07-01 05:30:38.264819	9999-12-31 00:00:00	t
d8b090d5-d89c-4667-a805-20cb34750ff4	4bed6b48-075c-4869-b312-a3528689e1e0	Data Granularity	N/A	64f2b4b0-e1d1-4cc0-995d-4d13923df310	d8b090d5-d89c-4667-a805-20cb34750ff4	active	\N	2014-07-01 05:30:38.264819	9999-12-31 00:00:00	t
352ea77e-93ca-4292-a356-00338b4cd138	1442cec5-dd1f-427e-a12a-4839f3379bd4	Data Granularity	N/A	c6b624c0-e657-47a0-aca5-3168ab368615	352ea77e-93ca-4292-a356-00338b4cd138	active	\N	2014-07-01 23:06:55.082036	9999-12-31 00:00:00	t
528fd29c-cc26-4d8d-826e-2ec96bb9dbb9	1442cec5-dd1f-427e-a12a-4839f3379bd4	Update Frequency	Annually	c6b624c0-e657-47a0-aca5-3168ab368615	528fd29c-cc26-4d8d-826e-2ec96bb9dbb9	active	\N	2014-07-01 23:06:55.082036	9999-12-31 00:00:00	t
4abf5877-721d-4d23-aa3f-a33c1631adfe	1442cec5-dd1f-427e-a12a-4839f3379bd4	Temporal Coverage	2007-2011	c6b624c0-e657-47a0-aca5-3168ab368615	4abf5877-721d-4d23-aa3f-a33c1631adfe	active	\N	2014-07-01 23:06:55.082036	9999-12-31 00:00:00	t
c435224d-f38d-4fb5-8a1f-018873143023	1442cec5-dd1f-427e-a12a-4839f3379bd4	Geospatial Coverage	Loxton Waikerie	c6b624c0-e657-47a0-aca5-3168ab368615	c435224d-f38d-4fb5-8a1f-018873143023	active	\N	2014-07-01 23:06:55.082036	9999-12-31 00:00:00	t
f9fa8ec2-44c2-4802-abf4-8bcbf0a8110d	1442cec5-dd1f-427e-a12a-4839f3379bd4	Data Status	N/A	c6b624c0-e657-47a0-aca5-3168ab368615	f9fa8ec2-44c2-4802-abf4-8bcbf0a8110d	active	\N	2014-07-01 23:06:55.082036	9999-12-31 00:00:00	t
38a946ff-5927-40eb-add7-9fcbe5d21a92	8bfe1b88-c585-4bfc-b5af-26c4be880f01	Geospatial Coverage	Murray Bridge	25d252d7-9db3-4f52-87f9-74a225337e11	38a946ff-5927-40eb-add7-9fcbe5d21a92	active	\N	2014-07-01 23:21:28.030264	9999-12-31 00:00:00	t
5244fd50-4b7f-4d2b-8a3a-390782696ea9	8bfe1b88-c585-4bfc-b5af-26c4be880f01	Update Frequency	Annually	25d252d7-9db3-4f52-87f9-74a225337e11	5244fd50-4b7f-4d2b-8a3a-390782696ea9	active	\N	2014-07-01 23:21:28.030264	9999-12-31 00:00:00	t
04b0ea1d-fd29-4ace-9753-ec94e4ae77bb	b7c5d80c-0944-4b95-ad07-7082a8fa0e0a	Data Location	Link	ac014e61-6ef3-475f-a77a-b91e35f85dfc	04b0ea1d-fd29-4ace-9753-ec94e4ae77bb	active	2cc181b7-ef20-45a0-9187-a94ef2e7ed70	2014-07-01 23:39:01.404466	2014-07-02 00:02:20.483314	f
01584951-9882-4e6f-8931-45c690977146	8b78c8c5-18f3-47a2-a63c-2da708d59589	Data Location	Linked	de0a7013-fe65-4116-8a38-bb8a5ee8a8fd	01584951-9882-4e6f-8931-45c690977146	active	\N	2014-07-02 00:03:02.780853	9999-12-31 00:00:00	t
80e07879-de21-45d8-a77e-2b07e4e7d7a0	4f76da87-64ec-4f00-a1d4-e0fc9db289da	Data Location	Link	c416ff59-96f6-4ade-b00f-786ef809469d	80e07879-de21-45d8-a77e-2b07e4e7d7a0	active	59ab3b95-63c7-4b85-a62a-5a0246f738a9	2014-07-01 23:31:47.523931	2014-07-02 00:44:33.985229	f
5564eac3-fed1-462d-8a14-e48998037e21	b6eacb3a-134d-4676-a25d-01efc5e5afb7	Update Frequency	Annually	bff2b6c5-a97d-4b6c-97b2-ec60e1c63fa9	5564eac3-fed1-462d-8a14-e48998037e21	active	\N	2014-07-01 23:30:34.545971	9999-12-31 00:00:00	t
cf17a726-3ed4-4488-ade9-c697a9dad468	b6eacb3a-134d-4676-a25d-01efc5e5afb7	Data Granularity	N/A	bff2b6c5-a97d-4b6c-97b2-ec60e1c63fa9	cf17a726-3ed4-4488-ade9-c697a9dad468	active	\N	2014-07-01 23:30:34.545971	9999-12-31 00:00:00	t
a152a688-8221-4c9c-8042-769132d633a4	b6eacb3a-134d-4676-a25d-01efc5e5afb7	Data Status	N/A	bff2b6c5-a97d-4b6c-97b2-ec60e1c63fa9	a152a688-8221-4c9c-8042-769132d633a4	active	\N	2014-07-01 23:30:34.545971	9999-12-31 00:00:00	t
185c8dcd-69e4-479e-94a5-9d8e1bb5f190	b6eacb3a-134d-4676-a25d-01efc5e5afb7	Data Location	Linked	bff2b6c5-a97d-4b6c-97b2-ec60e1c63fa9	185c8dcd-69e4-479e-94a5-9d8e1bb5f190	active	\N	2014-07-01 23:30:34.545971	9999-12-31 00:00:00	t
3ba3eda1-04af-4a35-a684-d6f46e9c1897	b6eacb3a-134d-4676-a25d-01efc5e5afb7	Temporal Coverage	2007-2011	bff2b6c5-a97d-4b6c-97b2-ec60e1c63fa9	3ba3eda1-04af-4a35-a684-d6f46e9c1897	active	\N	2014-07-01 23:30:34.545971	9999-12-31 00:00:00	t
0befb03a-11ec-4df1-8d1f-8c507ab411ea	b6eacb3a-134d-4676-a25d-01efc5e5afb7	Geospatial Coverage	Charles Sturt (C) Local Government Area	bff2b6c5-a97d-4b6c-97b2-ec60e1c63fa9	0befb03a-11ec-4df1-8d1f-8c507ab411ea	active	\N	2014-07-01 23:30:34.545971	9999-12-31 00:00:00	t
d3ee17dc-fd88-454c-bae3-09bd1906871d	4f76da87-64ec-4f00-a1d4-e0fc9db289da	Data Granularity	N/A	c416ff59-96f6-4ade-b00f-786ef809469d	d3ee17dc-fd88-454c-bae3-09bd1906871d	active	\N	2014-07-01 23:31:47.523931	9999-12-31 00:00:00	t
5c02667f-a2b2-47ca-8f92-6162b1ffb961	4f76da87-64ec-4f00-a1d4-e0fc9db289da	Update Frequency	Annually	c416ff59-96f6-4ade-b00f-786ef809469d	5c02667f-a2b2-47ca-8f92-6162b1ffb961	active	\N	2014-07-01 23:31:47.523931	9999-12-31 00:00:00	t
bc9917ac-4084-434c-899b-6f8a8abd8768	1442cec5-dd1f-427e-a12a-4839f3379bd4	Data Location	Hosted	c6b624c0-e657-47a0-aca5-3168ab368615	bc9917ac-4084-434c-899b-6f8a8abd8768	active	5d31663f-9897-43fc-8698-31c5cfabaf8f	2014-07-01 23:06:55.082036	2014-07-01 23:39:53.749864	f
843a4b5b-87a8-40d9-8701-33c56e7f6ac3	3f1332e3-ce09-4b87-99a5-0c92334e86f9	Update Frequency	Annually	92c8e982-45c5-430f-bf06-5e499e217a33	843a4b5b-87a8-40d9-8701-33c56e7f6ac3	active	\N	2014-07-01 23:40:35.788822	9999-12-31 00:00:00	t
c25d7237-a0a5-46ee-ab7a-5b2e0ac10f45	3f1332e3-ce09-4b87-99a5-0c92334e86f9	Data Status	N/A	92c8e982-45c5-430f-bf06-5e499e217a33	c25d7237-a0a5-46ee-ab7a-5b2e0ac10f45	active	\N	2014-07-01 23:40:35.788822	9999-12-31 00:00:00	t
2e0a1a20-20b6-4956-baf4-bcf68c99bf95	3f1332e3-ce09-4b87-99a5-0c92334e86f9	Temporal Coverage	2007-2011	92c8e982-45c5-430f-bf06-5e499e217a33	2e0a1a20-20b6-4956-baf4-bcf68c99bf95	active	\N	2014-07-01 23:40:35.788822	9999-12-31 00:00:00	t
3c79fc7e-dc34-4806-94e6-bf3780c81cf4	a036641a-c7f6-4491-a8f3-0ed733215804	Data Granularity	N/A	ac8571f1-f691-4b30-b88d-eaec09b3d36e	3c79fc7e-dc34-4806-94e6-bf3780c81cf4	active	\N	2014-07-01 23:43:46.874775	9999-12-31 00:00:00	t
e7a0b8b6-82ea-42d9-ba63-d2d7fd32ee2b	a036641a-c7f6-4491-a8f3-0ed733215804	Temporal Coverage	2007-2011	ac8571f1-f691-4b30-b88d-eaec09b3d36e	e7a0b8b6-82ea-42d9-ba63-d2d7fd32ee2b	active	\N	2014-07-01 23:43:46.874775	9999-12-31 00:00:00	t
c141c306-6a08-406b-bad1-3426931dada3	a036641a-c7f6-4491-a8f3-0ed733215804	Update Frequency	Annually	ac8571f1-f691-4b30-b88d-eaec09b3d36e	c141c306-6a08-406b-bad1-3426931dada3	active	\N	2014-07-01 23:43:46.874775	9999-12-31 00:00:00	t
02fad7d2-e519-48fb-afe6-23776d0e11c3	a036641a-c7f6-4491-a8f3-0ed733215804	Data Status	N/A	ac8571f1-f691-4b30-b88d-eaec09b3d36e	02fad7d2-e519-48fb-afe6-23776d0e11c3	active	\N	2014-07-01 23:43:46.874775	9999-12-31 00:00:00	t
01584951-9882-4e6f-8931-45c690977146	8b78c8c5-18f3-47a2-a63c-2da708d59589	Data Location	Link	8d1552b0-8e19-43f5-beaf-11fc7f34cecb	01584951-9882-4e6f-8931-45c690977146	active	de0a7013-fe65-4116-8a38-bb8a5ee8a8fd	2014-07-01 23:41:54.227032	2014-07-02 00:03:02.780853	f
f2167959-3974-43e1-b410-f122e7b44de6	8b78c8c5-18f3-47a2-a63c-2da708d59589	Geospatial Coverage	Mallala	d3a8ee60-33a1-4fc8-9c47-52be0750ebda	f2167959-3974-43e1-b410-f122e7b44de6	active	\N	2014-07-01 23:09:34.771188	9999-12-31 00:00:00	t
7e2a4706-ea17-475d-b2a8-f9be8daca8cd	8b78c8c5-18f3-47a2-a63c-2da708d59589	Temporal Coverage	2007-2011	d3a8ee60-33a1-4fc8-9c47-52be0750ebda	7e2a4706-ea17-475d-b2a8-f9be8daca8cd	active	\N	2014-07-01 23:09:34.771188	9999-12-31 00:00:00	t
75254949-f6b2-4b6e-abb0-3aec172b739f	8b78c8c5-18f3-47a2-a63c-2da708d59589	Data Granularity	N/A	d3a8ee60-33a1-4fc8-9c47-52be0750ebda	75254949-f6b2-4b6e-abb0-3aec172b739f	active	\N	2014-07-01 23:09:34.771188	9999-12-31 00:00:00	t
9b2c215c-46c5-4fa9-ac84-eb61b93a61b9	8b78c8c5-18f3-47a2-a63c-2da708d59589	Data Status	N/A	d3a8ee60-33a1-4fc8-9c47-52be0750ebda	9b2c215c-46c5-4fa9-ac84-eb61b93a61b9	active	\N	2014-07-01 23:09:34.771188	9999-12-31 00:00:00	t
ca0750f1-5720-494f-b432-a611b451f369	8b78c8c5-18f3-47a2-a63c-2da708d59589	Update Frequency	Annually	d3a8ee60-33a1-4fc8-9c47-52be0750ebda	ca0750f1-5720-494f-b432-a611b451f369	active	\N	2014-07-01 23:09:34.771188	9999-12-31 00:00:00	t
3f76f517-d5a8-4da5-b7df-22bbf58ca327	2a9a66b7-7d65-47a5-9f7f-61fe3de91052	Data Location	Linked	3f15b9d3-11a1-45dd-af8e-55803d08c77b	3f76f517-d5a8-4da5-b7df-22bbf58ca327	active	\N	2014-07-01 05:31:39.271705	9999-12-31 00:00:00	t
b62939a7-c8d0-49dc-9fdc-bc1dc7e1a808	2a9a66b7-7d65-47a5-9f7f-61fe3de91052	Update Frequency	Annually	3f15b9d3-11a1-45dd-af8e-55803d08c77b	b62939a7-c8d0-49dc-9fdc-bc1dc7e1a808	active	\N	2014-07-01 05:31:39.271705	9999-12-31 00:00:00	t
dae5665d-fde4-407f-b3ad-fa189141502c	2a9a66b7-7d65-47a5-9f7f-61fe3de91052	Data Status	N/A	3f15b9d3-11a1-45dd-af8e-55803d08c77b	dae5665d-fde4-407f-b3ad-fa189141502c	active	\N	2014-07-01 05:31:39.271705	9999-12-31 00:00:00	t
ab881e83-7ed4-47e4-ac62-fa602f94cde2	2a9a66b7-7d65-47a5-9f7f-61fe3de91052	Temporal Coverage	2007-2011	3f15b9d3-11a1-45dd-af8e-55803d08c77b	ab881e83-7ed4-47e4-ac62-fa602f94cde2	active	\N	2014-07-01 05:31:39.271705	9999-12-31 00:00:00	t
dd5fe279-808f-477d-923a-febaa60e3cfa	2a9a66b7-7d65-47a5-9f7f-61fe3de91052	Geospatial Coverage	Roxby Downs (M) Local Government Area	3f15b9d3-11a1-45dd-af8e-55803d08c77b	dd5fe279-808f-477d-923a-febaa60e3cfa	active	\N	2014-07-01 05:31:39.271705	9999-12-31 00:00:00	t
b9b12e6a-ef18-40f7-b205-673288c4e031	2a9a66b7-7d65-47a5-9f7f-61fe3de91052	Data		3f15b9d3-11a1-45dd-af8e-55803d08c77b	b9b12e6a-ef18-40f7-b205-673288c4e031	deleted	\N	2014-07-01 05:31:39.271705	9999-12-31 00:00:00	t
4ba28fbf-3a3a-44e8-aa75-c1401c393512	2a9a66b7-7d65-47a5-9f7f-61fe3de91052	Data Granularity	N/A	3f15b9d3-11a1-45dd-af8e-55803d08c77b	4ba28fbf-3a3a-44e8-aa75-c1401c393512	active	\N	2014-07-01 05:31:39.271705	9999-12-31 00:00:00	t
518c4bad-da61-4c0d-a27a-0c68b51ecca9	7a86206e-565d-4704-a993-5e2537c47973	Update Frequency	Annually	6f5b0838-a261-499b-86b9-06461665f3eb	518c4bad-da61-4c0d-a27a-0c68b51ecca9	active	\N	2014-07-01 23:13:02.802732	9999-12-31 00:00:00	t
d553215a-3fda-4425-ad60-80b545a6dd59	7a86206e-565d-4704-a993-5e2537c47973	Geospatial Coverage	Mid Murray	6f5b0838-a261-499b-86b9-06461665f3eb	d553215a-3fda-4425-ad60-80b545a6dd59	active	\N	2014-07-01 23:13:02.802732	9999-12-31 00:00:00	t
30278f93-4c77-42c8-a1e7-290dad5a7629	7a86206e-565d-4704-a993-5e2537c47973	Data Status	N/A	6f5b0838-a261-499b-86b9-06461665f3eb	30278f93-4c77-42c8-a1e7-290dad5a7629	active	\N	2014-07-01 23:13:02.802732	9999-12-31 00:00:00	t
f5d4166c-b835-4181-8b5d-c68a8b2e7a08	7a86206e-565d-4704-a993-5e2537c47973	Temporal Coverage	2007-2011	6f5b0838-a261-499b-86b9-06461665f3eb	f5d4166c-b835-4181-8b5d-c68a8b2e7a08	active	\N	2014-07-01 23:13:02.802732	9999-12-31 00:00:00	t
e21cc518-2043-413c-b7ba-a04b6da8c065	7a86206e-565d-4704-a993-5e2537c47973	Data Granularity	N/A	6f5b0838-a261-499b-86b9-06461665f3eb	e21cc518-2043-413c-b7ba-a04b6da8c065	active	\N	2014-07-01 23:13:02.802732	9999-12-31 00:00:00	t
77fe1ee9-1451-4a33-9987-6a655c8c96f6	d323f822-806f-4c22-b4a5-50eb0416fbc2	Temporal Coverage	2007-2011	3eff4079-ca01-477f-a709-663c33ea5fd6	77fe1ee9-1451-4a33-9987-6a655c8c96f6	active	\N	2014-07-02 00:04:11.393778	9999-12-31 00:00:00	t
6f4ae398-5f8d-49a7-806e-48a5897ae276	240827d3-a350-4b95-87f9-6e55e1c89fe5	Data Status	N/A	81e07181-b82d-418e-8c12-4bbcaa1a30aa	6f4ae398-5f8d-49a7-806e-48a5897ae276	active	\N	2014-07-01 23:16:07.772219	9999-12-31 00:00:00	t
887405d4-46fe-403e-ad0b-fbaa0a8a4444	240827d3-a350-4b95-87f9-6e55e1c89fe5	Temporal Coverage	2007-2011	81e07181-b82d-418e-8c12-4bbcaa1a30aa	887405d4-46fe-403e-ad0b-fbaa0a8a4444	active	\N	2014-07-01 23:16:07.772219	9999-12-31 00:00:00	t
b6c11b03-ff92-4fb8-8cf8-71a7244f487e	240827d3-a350-4b95-87f9-6e55e1c89fe5	Geospatial Coverage	Mount Barker	81e07181-b82d-418e-8c12-4bbcaa1a30aa	b6c11b03-ff92-4fb8-8cf8-71a7244f487e	active	\N	2014-07-01 23:16:07.772219	9999-12-31 00:00:00	t
d8f3e794-b9fb-4bb8-b5fc-d1ceb1053c55	240827d3-a350-4b95-87f9-6e55e1c89fe5	Update Frequency	Annually	81e07181-b82d-418e-8c12-4bbcaa1a30aa	d8f3e794-b9fb-4bb8-b5fc-d1ceb1053c55	active	\N	2014-07-01 23:16:07.772219	9999-12-31 00:00:00	t
5bad872a-376f-422e-b2c8-432e6d67f5a2	240827d3-a350-4b95-87f9-6e55e1c89fe5	Data Granularity	N/A	81e07181-b82d-418e-8c12-4bbcaa1a30aa	5bad872a-376f-422e-b2c8-432e6d67f5a2	active	\N	2014-07-01 23:16:07.772219	9999-12-31 00:00:00	t
e27ff59c-5b53-4881-9cb7-e09389fd5358	f4f90064-c1cd-4a1d-a569-e8d370e71e42	Data Granularity	N/A	38c7d3f9-d14a-42a4-a4ce-a5b7475410b6	e27ff59c-5b53-4881-9cb7-e09389fd5358	active	\N	2014-07-01 23:26:05.313928	9999-12-31 00:00:00	t
97c3e9f8-f5e3-4251-ad2d-24b3ed998ca5	f4f90064-c1cd-4a1d-a569-e8d370e71e42	Temporal Coverage	2007-2011	38c7d3f9-d14a-42a4-a4ce-a5b7475410b6	97c3e9f8-f5e3-4251-ad2d-24b3ed998ca5	active	\N	2014-07-01 23:26:05.313928	9999-12-31 00:00:00	t
48fdf10b-2605-4f40-9e24-7a4db83a6c91	f4f90064-c1cd-4a1d-a569-e8d370e71e42	Update Frequency	Annually	38c7d3f9-d14a-42a4-a4ce-a5b7475410b6	48fdf10b-2605-4f40-9e24-7a4db83a6c91	active	\N	2014-07-01 23:26:05.313928	9999-12-31 00:00:00	t
01584951-9882-4e6f-8931-45c690977146	8b78c8c5-18f3-47a2-a63c-2da708d59589	Data Location	Hosted	d3a8ee60-33a1-4fc8-9c47-52be0750ebda	01584951-9882-4e6f-8931-45c690977146	active	8d1552b0-8e19-43f5-beaf-11fc7f34cecb	2014-07-01 23:09:34.771188	2014-07-01 23:41:54.227032	f
7de24152-efc4-404e-8caa-758da6336049	7a86206e-565d-4704-a993-5e2537c47973	Data Location	Hosted	6f5b0838-a261-499b-86b9-06461665f3eb	7de24152-efc4-404e-8caa-758da6336049	active	553aaa5d-019d-4b87-a7da-905602442e6d	2014-07-01 23:13:02.802732	2014-07-01 23:44:04.143286	f
649d66b8-c019-4586-9d4f-84312bee6299	240827d3-a350-4b95-87f9-6e55e1c89fe5	Data Location	Hosted	81e07181-b82d-418e-8c12-4bbcaa1a30aa	649d66b8-c019-4586-9d4f-84312bee6299	active	da6a5da0-8d6c-44c6-b8c1-9e6d2bab2022	2014-07-01 23:16:07.772219	2014-07-01 23:46:26.342772	f
c7869b6f-9ec5-43ce-a17f-33d778af472f	a036641a-c7f6-4491-a8f3-0ed733215804	Geospatial Coverage	Cleve (DC) Local Government Area	ac8571f1-f691-4b30-b88d-eaec09b3d36e	c7869b6f-9ec5-43ce-a17f-33d778af472f	active	\N	2014-07-01 23:43:46.874775	9999-12-31 00:00:00	t
7952d137-3f89-49f0-a98f-22df83a847b6	c1b9308d-f2a1-4b2b-8247-60cd63e6ec12	Data Location	Link	7b584240-8348-4a43-bdd4-16d04d0f06f0	7952d137-3f89-49f0-a98f-22df83a847b6	active	729dcdcd-b5e8-4833-a07d-f9654e4746fe	2014-07-01 23:42:57.37506	2014-07-02 00:03:32.029389	f
7952d137-3f89-49f0-a98f-22df83a847b6	c1b9308d-f2a1-4b2b-8247-60cd63e6ec12	Data Location	Linked	729dcdcd-b5e8-4833-a07d-f9654e4746fe	7952d137-3f89-49f0-a98f-22df83a847b6	active	\N	2014-07-02 00:03:32.029389	9999-12-31 00:00:00	t
e75fc021-1679-44b6-b764-29b9830cce30	d323f822-806f-4c22-b4a5-50eb0416fbc2	Data Location	Linked	3eff4079-ca01-477f-a709-663c33ea5fd6	e75fc021-1679-44b6-b764-29b9830cce30	active	\N	2014-07-02 00:04:11.393778	9999-12-31 00:00:00	t
0a825915-bf5c-480d-b1e8-7f4ae7384ccd	d323f822-806f-4c22-b4a5-50eb0416fbc2	Data Granularity	N/A	3eff4079-ca01-477f-a709-663c33ea5fd6	0a825915-bf5c-480d-b1e8-7f4ae7384ccd	active	\N	2014-07-02 00:04:11.393778	9999-12-31 00:00:00	t
9e674f16-150f-4037-bda2-9c620a010071	d323f822-806f-4c22-b4a5-50eb0416fbc2	Data Status	N/A	3eff4079-ca01-477f-a709-663c33ea5fd6	9e674f16-150f-4037-bda2-9c620a010071	active	\N	2014-07-02 00:04:11.393778	9999-12-31 00:00:00	t
839a8d81-9819-4301-b62e-fdef25e92c34	d323f822-806f-4c22-b4a5-50eb0416fbc2	Update Frequency	Annually	3eff4079-ca01-477f-a709-663c33ea5fd6	839a8d81-9819-4301-b62e-fdef25e92c34	active	\N	2014-07-02 00:04:11.393778	9999-12-31 00:00:00	t
369d8bb9-d029-4b2c-aa20-e33ddaa8184f	d323f822-806f-4c22-b4a5-50eb0416fbc2	Geospatial Coverage	Unley (C) Local Government Area	3eff4079-ca01-477f-a709-663c33ea5fd6	369d8bb9-d029-4b2c-aa20-e33ddaa8184f	active	\N	2014-07-02 00:04:11.393778	9999-12-31 00:00:00	t
7f2dd6c2-59a0-4054-82e1-0ee18d7d2811	a76d85d8-741f-4c72-a59c-6c86f401cb8f	Data Status	Inactive	420631c0-0624-4c52-8a8e-15a3f6a2c917	7f2dd6c2-59a0-4054-82e1-0ee18d7d2811	active	\N	2014-07-03 03:41:44.308341	9999-12-31 00:00:00	t
31f82e72-7a56-4fd9-94a7-713af6f97c30	a76d85d8-741f-4c72-a59c-6c86f401cb8f	Data Granularity	N/A	420631c0-0624-4c52-8a8e-15a3f6a2c917	31f82e72-7a56-4fd9-94a7-713af6f97c30	active	\N	2014-07-03 03:41:44.308341	9999-12-31 00:00:00	t
40b69b96-9b90-4ba4-841c-74b38eac3bf9	a76d85d8-741f-4c72-a59c-6c86f401cb8f	Update Frequency	As Required	420631c0-0624-4c52-8a8e-15a3f6a2c917	40b69b96-9b90-4ba4-841c-74b38eac3bf9	active	\N	2014-07-03 03:41:44.308341	9999-12-31 00:00:00	t
12e99143-381f-453a-a5e5-3ae04f0de51f	a76d85d8-741f-4c72-a59c-6c86f401cb8f	Geospatial Coverage	South Australia	420631c0-0624-4c52-8a8e-15a3f6a2c917	12e99143-381f-453a-a5e5-3ae04f0de51f	active	\N	2014-07-03 03:41:44.308341	9999-12-31 00:00:00	t
e22e2115-448a-4914-88fc-69b206478306	76dc6887-9cbe-44f2-99b5-dac94dcff4da	Data Granularity	N/A	1cf4f09c-f7dd-48a1-8ff5-62e67da177d4	e22e2115-448a-4914-88fc-69b206478306	active	\N	2014-07-02 00:08:31.410964	9999-12-31 00:00:00	t
4d12a54e-d550-465f-a9cc-8e70d2641c6c	76dc6887-9cbe-44f2-99b5-dac94dcff4da	Data Status	N/A	1cf4f09c-f7dd-48a1-8ff5-62e67da177d4	4d12a54e-d550-465f-a9cc-8e70d2641c6c	active	\N	2014-07-02 00:08:31.410964	9999-12-31 00:00:00	t
460fbe30-c0ae-4bf5-9231-ab37be8935d9	76dc6887-9cbe-44f2-99b5-dac94dcff4da	Geospatial Coverage	Victor Harbor (C) Local Government Area	1cf4f09c-f7dd-48a1-8ff5-62e67da177d4	460fbe30-c0ae-4bf5-9231-ab37be8935d9	active	\N	2014-07-02 00:08:31.410964	9999-12-31 00:00:00	t
1f695738-f5fe-41e0-9468-bfb14cad5236	76dc6887-9cbe-44f2-99b5-dac94dcff4da	Data Location	Linked	1cf4f09c-f7dd-48a1-8ff5-62e67da177d4	1f695738-f5fe-41e0-9468-bfb14cad5236	active	\N	2014-07-02 00:08:31.410964	9999-12-31 00:00:00	t
21460a94-10ff-46e9-9639-10e5b1b77de8	76dc6887-9cbe-44f2-99b5-dac94dcff4da	Temporal Coverage	2007-2011	1cf4f09c-f7dd-48a1-8ff5-62e67da177d4	21460a94-10ff-46e9-9639-10e5b1b77de8	active	\N	2014-07-02 00:08:31.410964	9999-12-31 00:00:00	t
535c66f8-1812-44a5-9d8e-e650f44e85fc	76dc6887-9cbe-44f2-99b5-dac94dcff4da	Update Frequency	Annually	1cf4f09c-f7dd-48a1-8ff5-62e67da177d4	535c66f8-1812-44a5-9d8e-e650f44e85fc	active	\N	2014-07-02 00:08:31.410964	9999-12-31 00:00:00	t
cfbc722a-c128-4b01-96e7-b5f64c50ed96	772ca66b-236f-4205-b7d2-0c31b1a394f9	Data Location	Linked	c4653b85-2986-4922-9421-2b76b2131f52	cfbc722a-c128-4b01-96e7-b5f64c50ed96	active	\N	2014-07-02 00:14:17.443087	9999-12-31 00:00:00	t
bf933a1b-dcc0-453f-b584-478c8130c993	772ca66b-236f-4205-b7d2-0c31b1a394f9	Update Frequency	Annually	c4653b85-2986-4922-9421-2b76b2131f52	bf933a1b-dcc0-453f-b584-478c8130c993	active	\N	2014-07-02 00:14:17.443087	9999-12-31 00:00:00	t
c95a909e-c708-4e73-a943-18e23967390d	b748e223-c41c-4fd9-a102-4aa0bf616a11	Data Location	Linked	68b36f81-293b-4a91-81c2-0846aae5fc45	c95a909e-c708-4e73-a943-18e23967390d	active	\N	2014-07-02 00:15:26.37614	9999-12-31 00:00:00	t
de71c609-7b97-4ce1-b689-8395ab506474	b748e223-c41c-4fd9-a102-4aa0bf616a11	Data Granularity	N/A	68b36f81-293b-4a91-81c2-0846aae5fc45	de71c609-7b97-4ce1-b689-8395ab506474	active	\N	2014-07-02 00:15:26.37614	9999-12-31 00:00:00	t
4a8d511c-41e2-4175-9620-193dc688cbf8	b748e223-c41c-4fd9-a102-4aa0bf616a11	Data Status	N/A	68b36f81-293b-4a91-81c2-0846aae5fc45	4a8d511c-41e2-4175-9620-193dc688cbf8	active	\N	2014-07-02 00:15:26.37614	9999-12-31 00:00:00	t
cee0e1d8-a753-466a-866c-80f4c6b0697f	b748e223-c41c-4fd9-a102-4aa0bf616a11	Update Frequency	Annually	68b36f81-293b-4a91-81c2-0846aae5fc45	cee0e1d8-a753-466a-866c-80f4c6b0697f	active	\N	2014-07-02 00:15:26.37614	9999-12-31 00:00:00	t
6bd3453f-69d2-4442-a901-27343fcd3aec	b748e223-c41c-4fd9-a102-4aa0bf616a11	Temporal Coverage	2007-2011	68b36f81-293b-4a91-81c2-0846aae5fc45	6bd3453f-69d2-4442-a901-27343fcd3aec	active	\N	2014-07-02 00:15:26.37614	9999-12-31 00:00:00	t
d271c60f-8488-45a8-a57e-6248b93d3173	b748e223-c41c-4fd9-a102-4aa0bf616a11	Geospatial Coverage	Wakefield (DC) Local Government Area	68b36f81-293b-4a91-81c2-0846aae5fc45	d271c60f-8488-45a8-a57e-6248b93d3173	active	\N	2014-07-02 00:15:26.37614	9999-12-31 00:00:00	t
a09c034b-6272-4c86-90a9-3343c0e45b6f	b946725e-190f-4995-9c53-30a0a8315dd4	Geospatial Coverage	Walkerville (M) Local Government Area	1ee22994-d98d-476a-a374-5e44e7fce135	a09c034b-6272-4c86-90a9-3343c0e45b6f	active	\N	2014-07-02 00:18:35.504997	9999-12-31 00:00:00	t
5f067d69-eb44-4dc3-a849-cecf0219233a	b946725e-190f-4995-9c53-30a0a8315dd4	Data Status	N/A	1ee22994-d98d-476a-a374-5e44e7fce135	5f067d69-eb44-4dc3-a849-cecf0219233a	active	\N	2014-07-02 00:18:35.504997	9999-12-31 00:00:00	t
4d0e92f1-2889-44a9-9bb4-fbd68d1a266c	b946725e-190f-4995-9c53-30a0a8315dd4	Data Location	Linked	1ee22994-d98d-476a-a374-5e44e7fce135	4d0e92f1-2889-44a9-9bb4-fbd68d1a266c	active	\N	2014-07-02 00:18:35.504997	9999-12-31 00:00:00	t
68856c9c-3e9d-43d7-9073-5cb032830bc5	b946725e-190f-4995-9c53-30a0a8315dd4	Data Granularity	N/A	1ee22994-d98d-476a-a374-5e44e7fce135	68856c9c-3e9d-43d7-9073-5cb032830bc5	active	\N	2014-07-02 00:18:35.504997	9999-12-31 00:00:00	t
bc1c8eb8-0a13-4b55-b3aa-7e5257471232	b946725e-190f-4995-9c53-30a0a8315dd4	Temporal Coverage	2007-2011	1ee22994-d98d-476a-a374-5e44e7fce135	bc1c8eb8-0a13-4b55-b3aa-7e5257471232	active	\N	2014-07-02 00:18:35.504997	9999-12-31 00:00:00	t
649d66b8-c019-4586-9d4f-84312bee6299	240827d3-a350-4b95-87f9-6e55e1c89fe5	Data Location	Link	da6a5da0-8d6c-44c6-b8c1-9e6d2bab2022	649d66b8-c019-4586-9d4f-84312bee6299	active	64d13bac-01b3-4f01-8a12-f4a2b6aa6ec8	2014-07-01 23:46:26.342772	2014-07-02 00:39:24.493118	f
40424584-05bc-4568-8a2c-925252105ead	a76d85d8-741f-4c72-a59c-6c86f401cb8f	Temporal Coverage	December 2012	420631c0-0624-4c52-8a8e-15a3f6a2c917	40424584-05bc-4568-8a2c-925252105ead	active	\N	2014-07-03 03:41:44.308341	9999-12-31 00:00:00	t
5d8542b9-fa0d-42c4-ba90-18a6b8ce435d	5e599130-3739-4275-8bac-3cf787588c25	Data Location	Linked	4b6400c1-bb3d-4b24-b0a3-97f780d3766b	5d8542b9-fa0d-42c4-ba90-18a6b8ce435d	active	\N	2014-07-01 23:47:49.747353	9999-12-31 00:00:00	t
3983e51c-e6ea-4346-8e6a-9347b06f9252	5e599130-3739-4275-8bac-3cf787588c25	Data Granularity	N/A	4b6400c1-bb3d-4b24-b0a3-97f780d3766b	3983e51c-e6ea-4346-8e6a-9347b06f9252	active	\N	2014-07-01 23:47:49.747353	9999-12-31 00:00:00	t
b9902589-2bbd-46f7-a07f-348c7aa06e67	5e599130-3739-4275-8bac-3cf787588c25	Data Status	N/A	4b6400c1-bb3d-4b24-b0a3-97f780d3766b	b9902589-2bbd-46f7-a07f-348c7aa06e67	active	\N	2014-07-01 23:47:49.747353	9999-12-31 00:00:00	t
7bedc5d3-afd3-4614-bc98-db2e38af747a	5e599130-3739-4275-8bac-3cf787588c25	Temporal Coverage	2007-2011	4b6400c1-bb3d-4b24-b0a3-97f780d3766b	7bedc5d3-afd3-4614-bc98-db2e38af747a	active	\N	2014-07-01 23:47:49.747353	9999-12-31 00:00:00	t
53aeb090-1387-4899-b3e5-3312f0ff1fda	5e599130-3739-4275-8bac-3cf787588c25	Update Frequency	Annually	4b6400c1-bb3d-4b24-b0a3-97f780d3766b	53aeb090-1387-4899-b3e5-3312f0ff1fda	active	\N	2014-07-01 23:47:49.747353	9999-12-31 00:00:00	t
e269634a-7f68-4ea6-8546-294f46751acc	5e599130-3739-4275-8bac-3cf787588c25	Geospatial Coverage	Tea Tree Gully (C) Local Government Area	4b6400c1-bb3d-4b24-b0a3-97f780d3766b	e269634a-7f68-4ea6-8546-294f46751acc	active	\N	2014-07-01 23:47:49.747353	9999-12-31 00:00:00	t
7de24152-efc4-404e-8caa-758da6336049	7a86206e-565d-4704-a993-5e2537c47973	Data Location	Linked	fbd68c09-7001-4a10-8088-ac251fa98566	7de24152-efc4-404e-8caa-758da6336049	active	\N	2014-07-02 00:04:06.898817	9999-12-31 00:00:00	t
e15572dd-b2b2-4d9b-8254-14a664ce10ef	a76d85d8-741f-4c72-a59c-6c86f401cb8f	Data Location	Linked	420631c0-0624-4c52-8a8e-15a3f6a2c917	e15572dd-b2b2-4d9b-8254-14a664ce10ef	active	\N	2014-07-03 03:41:44.308341	9999-12-31 00:00:00	t
a2129732-fbc5-48e8-8388-312ef0edb6e4	e86dd675-c0ef-4ce3-a52e-4f46f266e56a	Geospatial Coverage	South Australia	649dbf12-cf30-492c-8456-c3f57f5efe14	a2129732-fbc5-48e8-8388-312ef0edb6e4	active	\N	2014-07-03 04:05:18.277328	9999-12-31 00:00:00	t
015e37f3-d772-4ec2-9da0-4f948d169cef	e86dd675-c0ef-4ce3-a52e-4f46f266e56a	Data Granularity	N/A	649dbf12-cf30-492c-8456-c3f57f5efe14	015e37f3-d772-4ec2-9da0-4f948d169cef	active	\N	2014-07-03 04:05:18.277328	9999-12-31 00:00:00	t
809ee2d4-0955-44ac-a161-fc36b15a5408	8b1bbf8a-51d3-42a2-ac9f-28b04a52a3be	Data Granularity	N/A	aa2fd86c-627f-4827-9e21-fdd202267726	809ee2d4-0955-44ac-a161-fc36b15a5408	active	\N	2014-07-01 23:50:04.754565	9999-12-31 00:00:00	t
1a428140-f68b-46d1-bf27-894208790199	8b1bbf8a-51d3-42a2-ac9f-28b04a52a3be	Temporal Coverage	2007-2011	aa2fd86c-627f-4827-9e21-fdd202267726	1a428140-f68b-46d1-bf27-894208790199	active	\N	2014-07-01 23:50:04.754565	9999-12-31 00:00:00	t
d1fae0fb-c504-4b0f-9f65-fdc3dfbe0772	8b1bbf8a-51d3-42a2-ac9f-28b04a52a3be	Geospatial Coverage	Coober Pedy (DC) Local Government Area	aa2fd86c-627f-4827-9e21-fdd202267726	d1fae0fb-c504-4b0f-9f65-fdc3dfbe0772	active	\N	2014-07-01 23:50:04.754565	9999-12-31 00:00:00	t
1bc8e6f7-a1f4-43b6-8b94-1a37eb3027b5	8b1bbf8a-51d3-42a2-ac9f-28b04a52a3be	Update Frequency	Annually	aa2fd86c-627f-4827-9e21-fdd202267726	1bc8e6f7-a1f4-43b6-8b94-1a37eb3027b5	active	\N	2014-07-01 23:50:04.754565	9999-12-31 00:00:00	t
a51bf129-28fc-4486-a37f-38a745c24d79	8b1bbf8a-51d3-42a2-ac9f-28b04a52a3be	Data Location	Linked	aa2fd86c-627f-4827-9e21-fdd202267726	a51bf129-28fc-4486-a37f-38a745c24d79	active	\N	2014-07-01 23:50:04.754565	9999-12-31 00:00:00	t
cb7aa9e7-25a4-4f1c-851a-6fb9ade3fce7	8b1bbf8a-51d3-42a2-ac9f-28b04a52a3be	Data Status	N/A	aa2fd86c-627f-4827-9e21-fdd202267726	cb7aa9e7-25a4-4f1c-851a-6fb9ade3fce7	active	\N	2014-07-01 23:50:04.754565	9999-12-31 00:00:00	t
a1e25ffa-378d-426b-9df6-af89aac5cb37	772ca66b-236f-4205-b7d2-0c31b1a394f9	Data Granularity	N/A	c4653b85-2986-4922-9421-2b76b2131f52	a1e25ffa-378d-426b-9df6-af89aac5cb37	active	\N	2014-07-02 00:14:17.443087	9999-12-31 00:00:00	t
53740b99-29cb-42cd-a62a-69b65558f56e	772ca66b-236f-4205-b7d2-0c31b1a394f9	Temporal Coverage	2007-2011	c4653b85-2986-4922-9421-2b76b2131f52	53740b99-29cb-42cd-a62a-69b65558f56e	active	\N	2014-07-02 00:14:17.443087	9999-12-31 00:00:00	t
ae9821ff-76ed-4ce9-a6fb-5736f6d32a23	772ca66b-236f-4205-b7d2-0c31b1a394f9	Data Status	N/A	c4653b85-2986-4922-9421-2b76b2131f52	ae9821ff-76ed-4ce9-a6fb-5736f6d32a23	active	\N	2014-07-02 00:14:17.443087	9999-12-31 00:00:00	t
856c7b17-6013-4bfd-a813-14b0da1ea9eb	772ca66b-236f-4205-b7d2-0c31b1a394f9	Geospatial Coverage	Elliston (DC) Local Government Area	c4653b85-2986-4922-9421-2b76b2131f52	856c7b17-6013-4bfd-a813-14b0da1ea9eb	active	\N	2014-07-02 00:14:17.443087	9999-12-31 00:00:00	t
db1de3ea-e6f6-429b-b2cf-6a81af0a5228	a6714470-102d-4283-ba21-5024a08f9d28	Data Location	Link	28b868ca-b62c-4522-bbd8-44d1830af773	db1de3ea-e6f6-429b-b2cf-6a81af0a5228	active	d4712f3d-72d3-433c-abc9-b12441280f8d	2014-07-01 23:49:14.590198	2014-07-02 00:40:30.867551	f
902e328c-5330-457f-9ab1-5c27b41d370e	8bfe1b88-c585-4bfc-b5af-26c4be880f01	Data Location	Link	aa7a7e20-260f-43d4-aac4-63df23d1c05e	902e328c-5330-457f-9ab1-5c27b41d370e	active	6a9cfbf0-0369-4ec8-9690-97a1bc3e7430	2014-07-01 23:50:31.092865	2014-07-02 00:42:03.946718	f
2171ce2f-afd7-4c84-b1a1-b962f49b9626	9683f764-4033-474f-b742-9bbc4688dee1	Update Frequency	Annually	e622a284-847c-4018-9c47-4f6f133c6c44	2171ce2f-afd7-4c84-b1a1-b962f49b9626	active	\N	2014-07-01 23:52:46.209463	9999-12-31 00:00:00	t
48399650-8d4f-4d11-a47a-b3668b886aaa	9683f764-4033-474f-b742-9bbc4688dee1	Data Status	N/A	e622a284-847c-4018-9c47-4f6f133c6c44	48399650-8d4f-4d11-a47a-b3668b886aaa	active	\N	2014-07-01 23:52:46.209463	9999-12-31 00:00:00	t
60fefcb9-3654-42a9-ac23-5b403cbe0709	9683f764-4033-474f-b742-9bbc4688dee1	Data Granularity	N/A	e622a284-847c-4018-9c47-4f6f133c6c44	60fefcb9-3654-42a9-ac23-5b403cbe0709	active	\N	2014-07-01 23:52:46.209463	9999-12-31 00:00:00	t
92cd1feb-693e-4080-bd96-910344e2aefb	9683f764-4033-474f-b742-9bbc4688dee1	Data Location	Linked	e622a284-847c-4018-9c47-4f6f133c6c44	92cd1feb-693e-4080-bd96-910344e2aefb	active	\N	2014-07-01 23:52:46.209463	9999-12-31 00:00:00	t
25e19a63-0c07-42b8-a150-4e9a4dc280d9	9683f764-4033-474f-b742-9bbc4688dee1	Temporal Coverage	2007-2011	e622a284-847c-4018-9c47-4f6f133c6c44	25e19a63-0c07-42b8-a150-4e9a4dc280d9	active	\N	2014-07-01 23:52:46.209463	9999-12-31 00:00:00	t
44cb99ff-8d16-401a-a9d7-b2dbd69cd6c6	9683f764-4033-474f-b742-9bbc4688dee1	Geospatial Coverage	http://www.ocsar.sa.gov.au/region_files/LGA%20The%20Coorong%20(DC).html	e622a284-847c-4018-9c47-4f6f133c6c44	44cb99ff-8d16-401a-a9d7-b2dbd69cd6c6	active	\N	2014-07-01 23:52:46.209463	9999-12-31 00:00:00	t
00b9124d-a5b5-47c3-a2be-d60bb76e97c5	4bed6b48-075c-4869-b312-a3528689e1e0	Data Location	Link	e80d3a9e-4a40-4271-91ad-78000e66d9e9	00b9124d-a5b5-47c3-a2be-d60bb76e97c5	active	fd24550b-e5eb-4f6d-ae0b-a4ce089c0432	2014-07-01 23:51:31.284995	2014-07-02 00:45:04.808995	f
b7f287f4-99f0-491d-b86f-635680cc18fc	2a0d6531-6a1e-496d-b287-c7548125a183	Data Location	Link	67a30e62-ca60-470d-9eb0-850953ea59e0	b7f287f4-99f0-491d-b86f-635680cc18fc	active	49b5b164-3a2b-4979-b870-bac56d50f7b2	2014-07-01 23:52:49.267605	2014-07-02 00:45:34.952806	f
62f22daa-ebbc-4943-93f7-0333a055ea01	b946725e-190f-4995-9c53-30a0a8315dd4	Update Frequency	Annually	1ee22994-d98d-476a-a374-5e44e7fce135	62f22daa-ebbc-4943-93f7-0333a055ea01	active	\N	2014-07-02 00:18:35.504997	9999-12-31 00:00:00	t
4ac6bb72-9434-4b05-88bc-10939d13c223	d3bc4d40-3fb6-45b8-b25d-2c88fb92e917	Geospatial Coverage	Wattle Range (DC) Local Government Area	b32c6759-240f-4d24-a0fa-c4a40ba8d466	4ac6bb72-9434-4b05-88bc-10939d13c223	active	\N	2014-07-02 00:23:52.717246	9999-12-31 00:00:00	t
0c0473b4-f280-4703-b4a9-a3305ad3a25a	d3bc4d40-3fb6-45b8-b25d-2c88fb92e917	Data Granularity	N/A	b32c6759-240f-4d24-a0fa-c4a40ba8d466	0c0473b4-f280-4703-b4a9-a3305ad3a25a	active	\N	2014-07-02 00:23:52.717246	9999-12-31 00:00:00	t
48ef3a12-0c75-43c7-8103-1476fb7dedd3	d3bc4d40-3fb6-45b8-b25d-2c88fb92e917	Update Frequency	Annually	b32c6759-240f-4d24-a0fa-c4a40ba8d466	48ef3a12-0c75-43c7-8103-1476fb7dedd3	active	\N	2014-07-02 00:23:52.717246	9999-12-31 00:00:00	t
1d156c6a-7358-43b6-a75d-335bb6d2b5a9	d3bc4d40-3fb6-45b8-b25d-2c88fb92e917	Data Status	N/A	b32c6759-240f-4d24-a0fa-c4a40ba8d466	1d156c6a-7358-43b6-a75d-335bb6d2b5a9	active	\N	2014-07-02 00:23:52.717246	9999-12-31 00:00:00	t
a2b09f2b-e2fc-4b1b-b5fd-6025a7d295aa	d3bc4d40-3fb6-45b8-b25d-2c88fb92e917	Data Location	Linked	b32c6759-240f-4d24-a0fa-c4a40ba8d466	a2b09f2b-e2fc-4b1b-b5fd-6025a7d295aa	active	\N	2014-07-02 00:23:52.717246	9999-12-31 00:00:00	t
0443caa0-6b24-466b-8e78-146d19424e0b	d3bc4d40-3fb6-45b8-b25d-2c88fb92e917	Temporal Coverage	2007-2011	b32c6759-240f-4d24-a0fa-c4a40ba8d466	0443caa0-6b24-466b-8e78-146d19424e0b	active	\N	2014-07-02 00:23:52.717246	9999-12-31 00:00:00	t
83fac34c-e6db-4224-99ae-13f055893b6a	00c76a19-126c-4889-95f5-131ba026c764	Geospatial Coverage	Flinders Ranges (DC) Local Government Area	7c439139-205a-4678-844b-9996e028f71d	83fac34c-e6db-4224-99ae-13f055893b6a	active	\N	2014-07-02 00:24:53.570333	9999-12-31 00:00:00	t
0b75f58d-ab49-477b-a727-72bbd39daaee	00c76a19-126c-4889-95f5-131ba026c764	Data Location	Linked	7c439139-205a-4678-844b-9996e028f71d	0b75f58d-ab49-477b-a727-72bbd39daaee	active	\N	2014-07-02 00:24:53.570333	9999-12-31 00:00:00	t
29a1e9ba-9f36-43f6-8f24-0ae8d6abfb12	00c76a19-126c-4889-95f5-131ba026c764	Data Granularity	N/A	7c439139-205a-4678-844b-9996e028f71d	29a1e9ba-9f36-43f6-8f24-0ae8d6abfb12	active	\N	2014-07-02 00:24:53.570333	9999-12-31 00:00:00	t
5fa01e49-14f2-4efe-ab19-8c00af377cc0	00c76a19-126c-4889-95f5-131ba026c764	Update Frequency	Annually	7c439139-205a-4678-844b-9996e028f71d	5fa01e49-14f2-4efe-ab19-8c00af377cc0	active	\N	2014-07-02 00:24:53.570333	9999-12-31 00:00:00	t
5862692f-9bb9-4f7c-93ff-1813724b897b	00c76a19-126c-4889-95f5-131ba026c764	Data Status	N/A	7c439139-205a-4678-844b-9996e028f71d	5862692f-9bb9-4f7c-93ff-1813724b897b	active	\N	2014-07-02 00:24:53.570333	9999-12-31 00:00:00	t
ed37fb59-cf6e-4b4c-a097-831ca652d96c	00c76a19-126c-4889-95f5-131ba026c764	Temporal Coverage	2007-2011	7c439139-205a-4678-844b-9996e028f71d	ed37fb59-cf6e-4b4c-a097-831ca652d96c	active	\N	2014-07-02 00:24:53.570333	9999-12-31 00:00:00	t
5fc72a26-1226-463d-9c13-8b53b82d7ff2	bb7500c8-8f84-45d3-bce7-71e41db5e18c	Update Frequency	Annually	6b587042-e580-4f09-8727-4df32e73b1d6	5fc72a26-1226-463d-9c13-8b53b82d7ff2	active	\N	2014-07-02 00:35:49.827659	9999-12-31 00:00:00	t
a008f3b5-55b0-4356-a87a-6a7436985f44	bb7500c8-8f84-45d3-bce7-71e41db5e18c	Temporal Coverage	2007-2011	6b587042-e580-4f09-8727-4df32e73b1d6	a008f3b5-55b0-4356-a87a-6a7436985f44	active	\N	2014-07-02 00:35:49.827659	9999-12-31 00:00:00	t
cc0ef32e-5266-4250-add5-a648c272502e	bb7500c8-8f84-45d3-bce7-71e41db5e18c	Data Location	Linked	6b587042-e580-4f09-8727-4df32e73b1d6	cc0ef32e-5266-4250-add5-a648c272502e	active	\N	2014-07-02 00:35:49.827659	9999-12-31 00:00:00	t
862fff3f-fa73-4574-a13a-5a60b643b19d	bb7500c8-8f84-45d3-bce7-71e41db5e18c	Data Granularity	N/A	6b587042-e580-4f09-8727-4df32e73b1d6	862fff3f-fa73-4574-a13a-5a60b643b19d	active	\N	2014-07-02 00:35:49.827659	9999-12-31 00:00:00	t
ac998d48-70bc-4337-a1dd-5a13065b1c6f	bb7500c8-8f84-45d3-bce7-71e41db5e18c	Geospatial Coverage	Franklin Harbour (DC) Local Government Area	6b587042-e580-4f09-8727-4df32e73b1d6	ac998d48-70bc-4337-a1dd-5a13065b1c6f	active	\N	2014-07-02 00:35:49.827659	9999-12-31 00:00:00	t
81a84cfa-506d-4c11-838d-16fbe0bf07f4	bb7500c8-8f84-45d3-bce7-71e41db5e18c	Data Status	N/A	6b587042-e580-4f09-8727-4df32e73b1d6	81a84cfa-506d-4c11-838d-16fbe0bf07f4	active	\N	2014-07-02 00:35:49.827659	9999-12-31 00:00:00	t
649d66b8-c019-4586-9d4f-84312bee6299	240827d3-a350-4b95-87f9-6e55e1c89fe5	Data Location	Linked	64d13bac-01b3-4f01-8a12-f4a2b6aa6ec8	649d66b8-c019-4586-9d4f-84312bee6299	active	\N	2014-07-02 00:39:24.493118	9999-12-31 00:00:00	t
2f7a10a1-d27f-42e6-8c9b-141c105d94c2	821512e8-c7a7-43ea-a1d9-783634567335	Data Location	Linked	df18b2b1-1d67-4b2e-bb57-be1c7d6a0a9e	2f7a10a1-d27f-42e6-8c9b-141c105d94c2	active	\N	2014-07-02 00:39:55.064411	9999-12-31 00:00:00	t
2f7a10a1-d27f-42e6-8c9b-141c105d94c2	821512e8-c7a7-43ea-a1d9-783634567335	Data Location	Link	78ee8d2b-d665-41bf-91a8-a8fc5dce47f2	2f7a10a1-d27f-42e6-8c9b-141c105d94c2	active	df18b2b1-1d67-4b2e-bb57-be1c7d6a0a9e	2014-07-01 23:47:41.146787	2014-07-02 00:39:55.064411	f
db1de3ea-e6f6-429b-b2cf-6a81af0a5228	a6714470-102d-4283-ba21-5024a08f9d28	Data Location	Linked	d4712f3d-72d3-433c-abc9-b12441280f8d	db1de3ea-e6f6-429b-b2cf-6a81af0a5228	active	\N	2014-07-02 00:40:30.867551	9999-12-31 00:00:00	t
902e328c-5330-457f-9ab1-5c27b41d370e	8bfe1b88-c585-4bfc-b5af-26c4be880f01	Data Location	Linked	6a9cfbf0-0369-4ec8-9690-97a1bc3e7430	902e328c-5330-457f-9ab1-5c27b41d370e	active	\N	2014-07-02 00:42:03.946718	9999-12-31 00:00:00	t
8800ad14-3290-49f3-b6d3-b682308b5977	f4f90064-c1cd-4a1d-a569-e8d370e71e42	Data Location	Linked	d0f61a5d-75be-4901-9f82-053cfab332d7	8800ad14-3290-49f3-b6d3-b682308b5977	active	\N	2014-07-02 00:42:50.545237	9999-12-31 00:00:00	t
8800ad14-3290-49f3-b6d3-b682308b5977	f4f90064-c1cd-4a1d-a569-e8d370e71e42	Data Location	Link	38c7d3f9-d14a-42a4-a4ce-a5b7475410b6	8800ad14-3290-49f3-b6d3-b682308b5977	active	d0f61a5d-75be-4901-9f82-053cfab332d7	2014-07-01 23:26:05.313928	2014-07-02 00:42:50.545237	f
c5cd10d7-78d6-4319-8b5f-bae788f145e9	483a6d7c-2556-4599-a6c9-567c0faa3229	Data Location	Linked	b9fcb210-919d-44b1-8562-234a3470c5ed	c5cd10d7-78d6-4319-8b5f-bae788f145e9	active	\N	2014-07-02 00:43:26.889283	9999-12-31 00:00:00	t
00b9124d-a5b5-47c3-a2be-d60bb76e97c5	4bed6b48-075c-4869-b312-a3528689e1e0	Data Location	Linked	fd24550b-e5eb-4f6d-ae0b-a4ce089c0432	00b9124d-a5b5-47c3-a2be-d60bb76e97c5	active	\N	2014-07-02 00:45:04.808995	9999-12-31 00:00:00	t
9f1c98b9-2073-452a-8117-14e4601504d8	edc0307a-ec97-4797-bf50-57be8f1f9357	Data Location	Link	86c5488c-71a8-4db9-9cd4-71bf1d1c36a0	9f1c98b9-2073-452a-8117-14e4601504d8	active	6019bfa3-be94-4dc2-925b-8e5ca759b659	2014-07-01 23:53:49.929656	2014-07-02 00:46:07.014682	f
9f1c98b9-2073-452a-8117-14e4601504d8	edc0307a-ec97-4797-bf50-57be8f1f9357	Data Location	Linked	6019bfa3-be94-4dc2-925b-8e5ca759b659	9f1c98b9-2073-452a-8117-14e4601504d8	active	\N	2014-07-02 00:46:07.014682	9999-12-31 00:00:00	t
23a14faf-e3f5-43af-bd5b-2eec770f0adf	179bd871-6585-488d-a0b1-fd483db57e11	Data Location	Link	63510178-90f8-493c-99b8-f50095e646fc	23a14faf-e3f5-43af-bd5b-2eec770f0adf	active	10c53961-3fc7-413d-b16b-26e01ba71d46	2014-07-01 23:59:55.449209	2014-07-02 00:48:16.878176	f
dbe0fdba-48fb-4cf7-ae8d-322f1aa7f084	e653699b-1dd5-439a-8e44-2b52decb0f5e	Data Granularity	N/A	6fcc2002-af06-4504-b849-ffebc905b326	dbe0fdba-48fb-4cf7-ae8d-322f1aa7f084	active	\N	2014-07-02 00:44:18.430695	9999-12-31 00:00:00	t
9a8a3c0b-c060-49df-a156-9aabe6b64ba5	e653699b-1dd5-439a-8e44-2b52decb0f5e	Data Status	N/A	6fcc2002-af06-4504-b849-ffebc905b326	9a8a3c0b-c060-49df-a156-9aabe6b64ba5	active	\N	2014-07-02 00:44:18.430695	9999-12-31 00:00:00	t
4c6a0b6e-3574-4c9b-bd8f-12c840e32bcf	e653699b-1dd5-439a-8e44-2b52decb0f5e	Update Frequency	Annually	6fcc2002-af06-4504-b849-ffebc905b326	4c6a0b6e-3574-4c9b-bd8f-12c840e32bcf	active	\N	2014-07-02 00:44:18.430695	9999-12-31 00:00:00	t
8fd75dc4-18f8-4b42-a070-13c2a9978bea	e653699b-1dd5-439a-8e44-2b52decb0f5e	Temporal Coverage	2007-2011	6fcc2002-af06-4504-b849-ffebc905b326	8fd75dc4-18f8-4b42-a070-13c2a9978bea	active	\N	2014-07-02 00:44:18.430695	9999-12-31 00:00:00	t
dec63736-d23f-422b-b443-29007ebf6b13	e653699b-1dd5-439a-8e44-2b52decb0f5e	Data Location	Linked	6fcc2002-af06-4504-b849-ffebc905b326	dec63736-d23f-422b-b443-29007ebf6b13	active	\N	2014-07-02 00:44:18.430695	9999-12-31 00:00:00	t
9c2b1792-0c45-4fa1-ba2d-ede47efd479e	e653699b-1dd5-439a-8e44-2b52decb0f5e	Geospatial Coverage	Gawler (T) Local Government Area	6fcc2002-af06-4504-b849-ffebc905b326	9c2b1792-0c45-4fa1-ba2d-ede47efd479e	active	\N	2014-07-02 00:44:18.430695	9999-12-31 00:00:00	t
80e07879-de21-45d8-a77e-2b07e4e7d7a0	4f76da87-64ec-4f00-a1d4-e0fc9db289da	Data Location	Linked	59ab3b95-63c7-4b85-a62a-5a0246f738a9	80e07879-de21-45d8-a77e-2b07e4e7d7a0	active	\N	2014-07-02 00:44:33.985229	9999-12-31 00:00:00	t
b7f287f4-99f0-491d-b86f-635680cc18fc	2a0d6531-6a1e-496d-b287-c7548125a183	Data Location	Linked	49b5b164-3a2b-4979-b870-bac56d50f7b2	b7f287f4-99f0-491d-b86f-635680cc18fc	active	\N	2014-07-02 00:45:34.952806	9999-12-31 00:00:00	t
d62fe8f6-7d4c-4532-bbae-caadcd96c0d8	df32548e-b5cd-4259-8b02-5459a02006e5	Data Location	Linked	c63d3554-f830-4949-9ad7-6603ce7861c1	d62fe8f6-7d4c-4532-bbae-caadcd96c0d8	active	\N	2014-07-02 00:46:39.843858	9999-12-31 00:00:00	t
d62fe8f6-7d4c-4532-bbae-caadcd96c0d8	df32548e-b5cd-4259-8b02-5459a02006e5	Data Location	Link	9441142f-7999-44dd-bf07-4999ba74b788	d62fe8f6-7d4c-4532-bbae-caadcd96c0d8	active	c63d3554-f830-4949-9ad7-6603ce7861c1	2014-07-01 23:55:04.696169	2014-07-02 00:46:39.843858	f
7627e1a7-3b01-464c-bd05-52835b16d3b0	7358f6f6-befd-43e4-8ef5-7a6882044312	 Data Location	Link	9487f559-c93d-4444-b297-2a13bc0f6d0b	7627e1a7-3b01-464c-bd05-52835b16d3b0	active	1979860c-fe71-4895-9d38-b8ea45a81447	2014-07-01 23:56:26.215424	2014-07-02 00:47:11.605097	f
7627e1a7-3b01-464c-bd05-52835b16d3b0	7358f6f6-befd-43e4-8ef5-7a6882044312	 Data Location	Linked	1979860c-fe71-4895-9d38-b8ea45a81447	7627e1a7-3b01-464c-bd05-52835b16d3b0	active	\N	2014-07-02 00:47:11.605097	9999-12-31 00:00:00	t
468faa0c-0d69-4b14-937f-c2735e61a0cf	ff5c0a38-9cc8-4602-accf-31e1780cef97	Update Frequency	As Required	b8fe7548-bc43-42de-85a6-da969c687f47	468faa0c-0d69-4b14-937f-c2735e61a0cf	active	\N	2014-07-03 03:42:53.953842	9999-12-31 00:00:00	t
6398f3f3-1899-43a9-a79e-9e506f5f89c7	c56c892a-9179-4eb1-8a0d-35e5f9f58ec5	Data Location	Linked	f767f968-33aa-43a3-b433-e52dea0531e3	6398f3f3-1899-43a9-a79e-9e506f5f89c7	active	\N	2014-07-02 00:47:41.413018	9999-12-31 00:00:00	t
3fa9cd13-97ab-4698-b547-692b918329df	89e864c9-c799-4c63-b901-415da057fdcc	Data Location	Linked	cae6ad62-c954-4600-8910-583fc59388e3	3fa9cd13-97ab-4698-b547-692b918329df	active	\N	2014-07-02 00:49:58.166618	9999-12-31 00:00:00	t
4e0dcd50-c460-4314-8e50-0624c960853f	89e864c9-c799-4c63-b901-415da057fdcc	Geospatial Coverage	Australian-wide	cae6ad62-c954-4600-8910-583fc59388e3	4e0dcd50-c460-4314-8e50-0624c960853f	active	\N	2014-07-02 00:49:58.166618	9999-12-31 00:00:00	t
c7ae76f9-308b-428e-9997-6e02f3e0cf4a	89e864c9-c799-4c63-b901-415da057fdcc	Update Frequency	Immediate	cae6ad62-c954-4600-8910-583fc59388e3	c7ae76f9-308b-428e-9997-6e02f3e0cf4a	active	\N	2014-07-02 00:49:58.166618	9999-12-31 00:00:00	t
6d469b9f-9f14-4de2-8604-2579b840340e	e9ff7b52-b603-451b-a57f-8c032f5091d3	Temporal Coverage	2007-2011	5dd51d32-1d61-4f53-8eb2-cc13b3a459f1	6d469b9f-9f14-4de2-8604-2579b840340e	active	\N	2014-07-02 00:54:24.009129	9999-12-31 00:00:00	t
916a7518-93d9-45a6-b2be-76ea25ab89a9	e9ff7b52-b603-451b-a57f-8c032f5091d3	Update Frequency	Annually	5dd51d32-1d61-4f53-8eb2-cc13b3a459f1	916a7518-93d9-45a6-b2be-76ea25ab89a9	active	\N	2014-07-02 00:54:24.009129	9999-12-31 00:00:00	t
c8ad0f4e-a489-4e49-b2ac-c01cdec8885a	e9ff7b52-b603-451b-a57f-8c032f5091d3	Geospatial Coverage	Whyalla (C) Local Government Area	5dd51d32-1d61-4f53-8eb2-cc13b3a459f1	c8ad0f4e-a489-4e49-b2ac-c01cdec8885a	active	\N	2014-07-02 00:54:24.009129	9999-12-31 00:00:00	t
ee503e7d-40db-4739-a62b-50bb0d782a8c	e9ff7b52-b603-451b-a57f-8c032f5091d3	Data Location	Linked	5dd51d32-1d61-4f53-8eb2-cc13b3a459f1	ee503e7d-40db-4739-a62b-50bb0d782a8c	active	\N	2014-07-02 00:54:24.009129	9999-12-31 00:00:00	t
62073eab-fe49-4013-a8a6-0a54dc5f43d0	e9ff7b52-b603-451b-a57f-8c032f5091d3	Data Granularity	N/A	5dd51d32-1d61-4f53-8eb2-cc13b3a459f1	62073eab-fe49-4013-a8a6-0a54dc5f43d0	active	\N	2014-07-02 00:54:24.009129	9999-12-31 00:00:00	t
0b66216e-5676-4c48-b4dc-cd13d0083ed2	e9ff7b52-b603-451b-a57f-8c032f5091d3	Data Status	N/A	5dd51d32-1d61-4f53-8eb2-cc13b3a459f1	0b66216e-5676-4c48-b4dc-cd13d0083ed2	active	\N	2014-07-02 00:54:24.009129	9999-12-31 00:00:00	t
3d10881e-024c-4965-a33b-cd775c60135a	89e864c9-c799-4c63-b901-415da057fdcc	Temporal Coverage		cae6ad62-c954-4600-8910-583fc59388e3	3d10881e-024c-4965-a33b-cd775c60135a	active	c81defd8-1b32-468f-8e27-45f812b8dabc	2014-07-02 00:49:58.166618	2014-07-02 00:55:14.829655	f
500ee201-ed64-46a7-99a9-7767815eec5a	b14ce4ff-bb8f-4a9f-8641-1981686dfa33	Temporal Coverage	2007-2011	b2020618-f4fc-447c-b1b0-2e25ece0aa21	500ee201-ed64-46a7-99a9-7767815eec5a	active	\N	2014-07-02 00:58:39.216086	9999-12-31 00:00:00	t
1ef756a5-3fa4-4e29-b203-14f26b7ec428	b14ce4ff-bb8f-4a9f-8641-1981686dfa33	Data Location	Linked	b2020618-f4fc-447c-b1b0-2e25ece0aa21	1ef756a5-3fa4-4e29-b203-14f26b7ec428	active	\N	2014-07-02 00:58:39.216086	9999-12-31 00:00:00	t
40acfd75-42de-4dab-8f60-0abe4153dd5a	b14ce4ff-bb8f-4a9f-8641-1981686dfa33	Update Frequency	Annually	b2020618-f4fc-447c-b1b0-2e25ece0aa21	40acfd75-42de-4dab-8f60-0abe4153dd5a	active	\N	2014-07-02 00:58:39.216086	9999-12-31 00:00:00	t
12ea7905-ba16-4dd4-9341-978f08aae17e	b14ce4ff-bb8f-4a9f-8641-1981686dfa33	Data Granularity	N/A	b2020618-f4fc-447c-b1b0-2e25ece0aa21	12ea7905-ba16-4dd4-9341-978f08aae17e	active	\N	2014-07-02 00:58:39.216086	9999-12-31 00:00:00	t
23a14faf-e3f5-43af-bd5b-2eec770f0adf	179bd871-6585-488d-a0b1-fd483db57e11	Data Location	Linked	10c53961-3fc7-413d-b16b-26e01ba71d46	23a14faf-e3f5-43af-bd5b-2eec770f0adf	active	\N	2014-07-02 00:48:16.878176	9999-12-31 00:00:00	t
a6ff31b3-1499-4835-9307-3a597b889450	ff5c0a38-9cc8-4602-accf-31e1780cef97	Data Granularity	N/A	b8fe7548-bc43-42de-85a6-da969c687f47	a6ff31b3-1499-4835-9307-3a597b889450	active	\N	2014-07-03 03:42:53.953842	9999-12-31 00:00:00	t
12ba40aa-02d1-4b3f-ba94-8c920c4fa742	ff5c0a38-9cc8-4602-accf-31e1780cef97	Data Status	Inactive	b8fe7548-bc43-42de-85a6-da969c687f47	12ba40aa-02d1-4b3f-ba94-8c920c4fa742	active	\N	2014-07-03 03:42:53.953842	9999-12-31 00:00:00	t
95f9cd9f-c7d0-4ffb-bd21-ea7bda07ec14	ff5c0a38-9cc8-4602-accf-31e1780cef97	Temporal Coverage	December 2012	b8fe7548-bc43-42de-85a6-da969c687f47	95f9cd9f-c7d0-4ffb-bd21-ea7bda07ec14	active	\N	2014-07-03 03:42:53.953842	9999-12-31 00:00:00	t
cebdd16a-8d70-4f86-b28f-582708f0f007	ff5c0a38-9cc8-4602-accf-31e1780cef97	Data Location	Linked	b8fe7548-bc43-42de-85a6-da969c687f47	cebdd16a-8d70-4f86-b28f-582708f0f007	active	\N	2014-07-03 03:42:53.953842	9999-12-31 00:00:00	t
bbcb1e3f-4f6d-4483-9de3-cb378a52acbe	ff5c0a38-9cc8-4602-accf-31e1780cef97	Geospatial Coverage	South Australia	b8fe7548-bc43-42de-85a6-da969c687f47	bbcb1e3f-4f6d-4483-9de3-cb378a52acbe	active	\N	2014-07-03 03:42:53.953842	9999-12-31 00:00:00	t
57742383-52f7-47d9-85e9-fe531f902f56	e86dd675-c0ef-4ce3-a52e-4f46f266e56a	Data Status	Inactive	649dbf12-cf30-492c-8456-c3f57f5efe14	57742383-52f7-47d9-85e9-fe531f902f56	active	\N	2014-07-03 04:05:18.277328	9999-12-31 00:00:00	t
4113af44-f712-4ee1-9402-31c1a0e6656c	e86dd675-c0ef-4ce3-a52e-4f46f266e56a	Data Location	Linked	649dbf12-cf30-492c-8456-c3f57f5efe14	4113af44-f712-4ee1-9402-31c1a0e6656c	active	\N	2014-07-03 04:05:18.277328	9999-12-31 00:00:00	t
e1943cf8-1ef7-4d83-99a1-70cef0e7e759	e86dd675-c0ef-4ce3-a52e-4f46f266e56a	Update Frequency	Complete	649dbf12-cf30-492c-8456-c3f57f5efe14	e1943cf8-1ef7-4d83-99a1-70cef0e7e759	active	\N	2014-07-03 04:05:18.277328	9999-12-31 00:00:00	t
b5ad65ae-eee4-488a-b7f8-fca98684837f	e86dd675-c0ef-4ce3-a52e-4f46f266e56a	Temporal Coverage	1997	649dbf12-cf30-492c-8456-c3f57f5efe14	b5ad65ae-eee4-488a-b7f8-fca98684837f	active	\N	2014-07-03 04:05:18.277328	9999-12-31 00:00:00	t
9bb15977-5dee-4d24-9933-f0256d43a631	56a26686-9e02-437d-9bcb-830ecdf6bf40	Update Frequency	As Required	10f8d24f-9e13-4f14-9c40-406cfe7494a5	9bb15977-5dee-4d24-9933-f0256d43a631	active	\N	2014-07-03 04:08:59.904293	9999-12-31 00:00:00	t
7df2eed9-fd66-4083-bd6f-5b729310eac3	56a26686-9e02-437d-9bcb-830ecdf6bf40	Data Location	Linked	10f8d24f-9e13-4f14-9c40-406cfe7494a5	7df2eed9-fd66-4083-bd6f-5b729310eac3	active	\N	2014-07-03 04:08:59.904293	9999-12-31 00:00:00	t
915ca101-f51a-49dc-80f0-720ce4e59430	56a26686-9e02-437d-9bcb-830ecdf6bf40	Data Granularity	N/A	10f8d24f-9e13-4f14-9c40-406cfe7494a5	915ca101-f51a-49dc-80f0-720ce4e59430	active	\N	2014-07-03 04:08:59.904293	9999-12-31 00:00:00	t
414e9122-ad9c-4a52-949c-e3b744510573	56a26686-9e02-437d-9bcb-830ecdf6bf40	Geospatial Coverage	South Australia	10f8d24f-9e13-4f14-9c40-406cfe7494a5	414e9122-ad9c-4a52-949c-e3b744510573	active	\N	2014-07-03 04:08:59.904293	9999-12-31 00:00:00	t
acd95b31-1261-449f-9fcf-b95cf4535ab5	56a26686-9e02-437d-9bcb-830ecdf6bf40	Temporal Coverage	July 2009	10f8d24f-9e13-4f14-9c40-406cfe7494a5	acd95b31-1261-449f-9fcf-b95cf4535ab5	active	\N	2014-07-03 04:08:59.904293	9999-12-31 00:00:00	t
bd22dff7-8b65-4591-9eb7-bf3317ab458c	56a26686-9e02-437d-9bcb-830ecdf6bf40	Data Status	Inactive	10f8d24f-9e13-4f14-9c40-406cfe7494a5	bd22dff7-8b65-4591-9eb7-bf3317ab458c	active	\N	2014-07-03 04:08:59.904293	9999-12-31 00:00:00	t
8e99f50c-66f6-4de6-b4e8-1ee48533cea2	d51f4828-9b06-499c-9ea3-b5fc638eee75	Data Status	Inactive	8f7224b7-d6d4-4938-8691-ae2862c8609b	8e99f50c-66f6-4de6-b4e8-1ee48533cea2	active	\N	2014-07-03 04:12:08.855776	9999-12-31 00:00:00	t
f6936cb2-a8da-4856-8a62-1a726b5bd416	d51f4828-9b06-499c-9ea3-b5fc638eee75	Temporal Coverage	1998	8f7224b7-d6d4-4938-8691-ae2862c8609b	f6936cb2-a8da-4856-8a62-1a726b5bd416	active	\N	2014-07-03 04:12:08.855776	9999-12-31 00:00:00	t
28d8943a-1a73-4803-9dce-16660fcdec41	eb5cf41e-7170-488b-8c03-9e04292f1ff7	Data Location	Linked	d081fcbc-cc8b-44ed-8d20-7445877dd424	28d8943a-1a73-4803-9dce-16660fcdec41	active	\N	2014-07-03 04:13:46.696506	9999-12-31 00:00:00	t
3a841f3e-b58b-46b7-bd1b-cb316e20cd71	eb5cf41e-7170-488b-8c03-9e04292f1ff7	Geospatial Coverage	South Australia	d081fcbc-cc8b-44ed-8d20-7445877dd424	3a841f3e-b58b-46b7-bd1b-cb316e20cd71	active	\N	2014-07-03 04:13:46.696506	9999-12-31 00:00:00	t
37703381-52da-46fe-9fd6-f9102b7033d9	eb5cf41e-7170-488b-8c03-9e04292f1ff7	Data Granularity	N/A	d081fcbc-cc8b-44ed-8d20-7445877dd424	37703381-52da-46fe-9fd6-f9102b7033d9	active	\N	2014-07-03 04:13:46.696506	9999-12-31 00:00:00	t
a950442e-e83b-4a68-877c-29e8aa99b68e	eb5cf41e-7170-488b-8c03-9e04292f1ff7	Data Status	Inactive	d081fcbc-cc8b-44ed-8d20-7445877dd424	a950442e-e83b-4a68-877c-29e8aa99b68e	active	\N	2014-07-03 04:13:46.696506	9999-12-31 00:00:00	t
a56eefee-1df4-4402-9c00-c7d1634b930e	eb5cf41e-7170-488b-8c03-9e04292f1ff7	Temporal Coverage	May 2014	d081fcbc-cc8b-44ed-8d20-7445877dd424	a56eefee-1df4-4402-9c00-c7d1634b930e	active	\N	2014-07-03 04:13:46.696506	9999-12-31 00:00:00	t
a79a712c-a23e-4f33-832d-93e91900f2d9	eb5cf41e-7170-488b-8c03-9e04292f1ff7	Update Frequency	As Required	d081fcbc-cc8b-44ed-8d20-7445877dd424	a79a712c-a23e-4f33-832d-93e91900f2d9	active	\N	2014-07-03 04:13:46.696506	9999-12-31 00:00:00	t
82bfb844-89b8-4345-8222-489523ca28fa	4a8f52e9-7247-4a75-8fe6-283fc6210a0b	Geospatial Coverage	South Australia	67fdaf92-80ab-48e9-a640-c3d16a0745fa	82bfb844-89b8-4345-8222-489523ca28fa	active	\N	2014-07-03 04:18:24.51719	9999-12-31 00:00:00	t
74d1831e-e402-423a-bb42-a9c2fc169df4	4a8f52e9-7247-4a75-8fe6-283fc6210a0b	Update Frequency	As Required	67fdaf92-80ab-48e9-a640-c3d16a0745fa	74d1831e-e402-423a-bb42-a9c2fc169df4	active	\N	2014-07-03 04:18:24.51719	9999-12-31 00:00:00	t
adaa2ff0-d84c-4ac7-9e79-712f69344f3d	4a8f52e9-7247-4a75-8fe6-283fc6210a0b	Data Status	Active	67fdaf92-80ab-48e9-a640-c3d16a0745fa	adaa2ff0-d84c-4ac7-9e79-712f69344f3d	active	\N	2014-07-03 04:18:24.51719	9999-12-31 00:00:00	t
4b97cc51-c473-4a55-9381-0d5c2badf802	4a8f52e9-7247-4a75-8fe6-283fc6210a0b	Data Granularity	N/A	67fdaf92-80ab-48e9-a640-c3d16a0745fa	4b97cc51-c473-4a55-9381-0d5c2badf802	active	\N	2014-07-03 04:18:24.51719	9999-12-31 00:00:00	t
f1de69d1-e115-4af0-b181-ed66dc0dbc97	ec2dd02e-cdfd-4cd1-80ec-670593bcae4a	Data Status	N/A	366bb803-acf7-4547-b864-129fafe601d2	f1de69d1-e115-4af0-b181-ed66dc0dbc97	active	\N	2014-07-02 00:49:18.628082	9999-12-31 00:00:00	t
ee92a713-1b79-47b7-b5ac-6988e4929c5a	ec2dd02e-cdfd-4cd1-80ec-670593bcae4a	Data Location	Linked	366bb803-acf7-4547-b864-129fafe601d2	ee92a713-1b79-47b7-b5ac-6988e4929c5a	active	\N	2014-07-02 00:49:18.628082	9999-12-31 00:00:00	t
0178532a-ab7c-4667-930d-037aef258073	ec2dd02e-cdfd-4cd1-80ec-670593bcae4a	Temporal Coverage	2007-2011	366bb803-acf7-4547-b864-129fafe601d2	0178532a-ab7c-4667-930d-037aef258073	active	\N	2014-07-02 00:49:18.628082	9999-12-31 00:00:00	t
bf50b9a4-89ac-48ef-8d84-4eb495c9aca0	ec2dd02e-cdfd-4cd1-80ec-670593bcae4a	Data Granularity	N/A	366bb803-acf7-4547-b864-129fafe601d2	bf50b9a4-89ac-48ef-8d84-4eb495c9aca0	active	\N	2014-07-02 00:49:18.628082	9999-12-31 00:00:00	t
3df8f747-971d-4169-bbf8-100d51b771ec	ec2dd02e-cdfd-4cd1-80ec-670593bcae4a	Geospatial Coverage	West Torrens (C) Local Government Area	366bb803-acf7-4547-b864-129fafe601d2	3df8f747-971d-4169-bbf8-100d51b771ec	active	\N	2014-07-02 00:49:18.628082	9999-12-31 00:00:00	t
eac1a137-042f-47b4-8553-55c476d9d809	ec2dd02e-cdfd-4cd1-80ec-670593bcae4a	Update Frequency	Annually	366bb803-acf7-4547-b864-129fafe601d2	eac1a137-042f-47b4-8553-55c476d9d809	active	\N	2014-07-02 00:49:18.628082	9999-12-31 00:00:00	t
3d10881e-024c-4965-a33b-cd775c60135a	89e864c9-c799-4c63-b901-415da057fdcc	Temporal Coverage	June - July 2014	c81defd8-1b32-468f-8e27-45f812b8dabc	3d10881e-024c-4965-a33b-cd775c60135a	active	\N	2014-07-02 00:55:14.829655	9999-12-31 00:00:00	t
b7048b9f-e0f8-4997-8df9-9c08d6615d93	137e6931-05ce-48cd-b1da-e04c1ba3c844	Data Location	Linked	a39501eb-3a36-4b88-84d2-20dc03236fad	b7048b9f-e0f8-4997-8df9-9c08d6615d93	active	\N	2014-07-03 03:44:16.052663	9999-12-31 00:00:00	t
070cc814-13e0-48a4-b566-7a32defeeeb8	137e6931-05ce-48cd-b1da-e04c1ba3c844	Geospatial Coverage	South Australia	a39501eb-3a36-4b88-84d2-20dc03236fad	070cc814-13e0-48a4-b566-7a32defeeeb8	active	\N	2014-07-03 03:44:16.052663	9999-12-31 00:00:00	t
c7d912a8-5e21-4be6-ab98-34093c8c9b83	137e6931-05ce-48cd-b1da-e04c1ba3c844	Data Status	Inactive	a39501eb-3a36-4b88-84d2-20dc03236fad	c7d912a8-5e21-4be6-ab98-34093c8c9b83	active	\N	2014-07-03 03:44:16.052663	9999-12-31 00:00:00	t
fd6ababb-eec1-4233-9e6a-33631ebc53dc	137e6931-05ce-48cd-b1da-e04c1ba3c844	Temporal Coverage	December 2012	a39501eb-3a36-4b88-84d2-20dc03236fad	fd6ababb-eec1-4233-9e6a-33631ebc53dc	active	\N	2014-07-03 03:44:16.052663	9999-12-31 00:00:00	t
fe61ce70-e691-430c-83d9-1720d3d23685	137e6931-05ce-48cd-b1da-e04c1ba3c844	Data Granularity	N/A	a39501eb-3a36-4b88-84d2-20dc03236fad	fe61ce70-e691-430c-83d9-1720d3d23685	active	\N	2014-07-03 03:44:16.052663	9999-12-31 00:00:00	t
2ea2acff-cf4f-40c5-aff6-e8bde7e32593	137e6931-05ce-48cd-b1da-e04c1ba3c844	Update Frequency	As Required	a39501eb-3a36-4b88-84d2-20dc03236fad	2ea2acff-cf4f-40c5-aff6-e8bde7e32593	active	\N	2014-07-03 03:44:16.052663	9999-12-31 00:00:00	t
324f5e09-263e-4389-b340-09ffa8a938db	d169483c-4440-4ae8-8581-82e2690f7ed1	Data Location	Linked	3a281b0b-80b7-4dfe-be31-e585d82abc07	324f5e09-263e-4389-b340-09ffa8a938db	active	\N	2014-07-03 03:45:47.791396	9999-12-31 00:00:00	t
39a04b93-4630-4c1d-9ae8-9e6cabae44ff	d169483c-4440-4ae8-8581-82e2690f7ed1	Temporal Coverage	July 2004	3a281b0b-80b7-4dfe-be31-e585d82abc07	39a04b93-4630-4c1d-9ae8-9e6cabae44ff	active	\N	2014-07-03 03:45:47.791396	9999-12-31 00:00:00	t
0fba5a3a-1795-46d4-9393-25d55d32b25c	d169483c-4440-4ae8-8581-82e2690f7ed1	Geospatial Coverage	South Australia	3a281b0b-80b7-4dfe-be31-e585d82abc07	0fba5a3a-1795-46d4-9393-25d55d32b25c	active	\N	2014-07-03 03:45:47.791396	9999-12-31 00:00:00	t
f04d1951-ccc6-4ce4-a0c6-4494dbe41676	d169483c-4440-4ae8-8581-82e2690f7ed1	Data Granularity	N/A	3a281b0b-80b7-4dfe-be31-e585d82abc07	f04d1951-ccc6-4ce4-a0c6-4494dbe41676	active	\N	2014-07-03 03:45:47.791396	9999-12-31 00:00:00	t
a2101eef-88f4-4977-b580-0e3205d6e307	d169483c-4440-4ae8-8581-82e2690f7ed1	Data Status	Inactive	3a281b0b-80b7-4dfe-be31-e585d82abc07	a2101eef-88f4-4977-b580-0e3205d6e307	active	\N	2014-07-03 03:45:47.791396	9999-12-31 00:00:00	t
f7833ae0-d960-40ce-a029-ba5ac2e46ed7	d169483c-4440-4ae8-8581-82e2690f7ed1	Update Frequency	As Required	3a281b0b-80b7-4dfe-be31-e585d82abc07	f7833ae0-d960-40ce-a029-ba5ac2e46ed7	active	\N	2014-07-03 03:45:47.791396	9999-12-31 00:00:00	t
3af604f4-ed82-4060-9cf8-bda64ef1f799	bed61f00-f0e0-434d-b3d7-bbf910455eca	Temporal Coverage	March 2012	08b4fad5-9073-41eb-937e-e77b8a3cb30f	3af604f4-ed82-4060-9cf8-bda64ef1f799	active	\N	2014-07-03 03:48:29.237831	9999-12-31 00:00:00	t
450d1da0-803a-4fc8-b960-5eadb845f1f2	bed61f00-f0e0-434d-b3d7-bbf910455eca	Update Frequency	As Required	08b4fad5-9073-41eb-937e-e77b8a3cb30f	450d1da0-803a-4fc8-b960-5eadb845f1f2	active	\N	2014-07-03 03:48:29.237831	9999-12-31 00:00:00	t
f85260ca-45e4-4b6a-848c-7146e68f881d	bed61f00-f0e0-434d-b3d7-bbf910455eca	Data Status	Active	08b4fad5-9073-41eb-937e-e77b8a3cb30f	f85260ca-45e4-4b6a-848c-7146e68f881d	active	\N	2014-07-03 03:48:29.237831	9999-12-31 00:00:00	t
1721b235-cf68-47a9-aafb-d1818366aa39	bed61f00-f0e0-434d-b3d7-bbf910455eca	Data Location	Linked	08b4fad5-9073-41eb-937e-e77b8a3cb30f	1721b235-cf68-47a9-aafb-d1818366aa39	active	\N	2014-07-03 03:48:29.237831	9999-12-31 00:00:00	t
2ec3fcc7-4a5e-476b-8fc3-ddb9d594323c	bed61f00-f0e0-434d-b3d7-bbf910455eca	Geospatial Coverage	South Australia	08b4fad5-9073-41eb-937e-e77b8a3cb30f	2ec3fcc7-4a5e-476b-8fc3-ddb9d594323c	active	\N	2014-07-03 03:48:29.237831	9999-12-31 00:00:00	t
a340a257-1e68-408b-90a1-e58004f7e3e8	bed61f00-f0e0-434d-b3d7-bbf910455eca	Data Granularity	N/A	08b4fad5-9073-41eb-937e-e77b8a3cb30f	a340a257-1e68-408b-90a1-e58004f7e3e8	active	\N	2014-07-03 03:48:29.237831	9999-12-31 00:00:00	t
30f6f037-669c-46ca-a8d9-4e7a66f90fb4	0d99de21-7201-4411-8516-b07cbc336fdc	Data Granularity	N/A	3e88c9bd-e46b-4254-9147-4ce2f1484978	30f6f037-669c-46ca-a8d9-4e7a66f90fb4	active	\N	2014-07-03 03:49:54.958347	9999-12-31 00:00:00	t
a06c2cea-6453-4be7-8746-51f860a06980	0d99de21-7201-4411-8516-b07cbc336fdc	Update Frequency	As Required	3e88c9bd-e46b-4254-9147-4ce2f1484978	a06c2cea-6453-4be7-8746-51f860a06980	active	\N	2014-07-03 03:49:54.958347	9999-12-31 00:00:00	t
fb7105a4-01bf-4908-b471-8458525c67c5	b14ce4ff-bb8f-4a9f-8641-1981686dfa33	Data Status	N/A	b2020618-f4fc-447c-b1b0-2e25ece0aa21	fb7105a4-01bf-4908-b471-8458525c67c5	active	\N	2014-07-02 00:58:39.216086	9999-12-31 00:00:00	t
4523979f-518a-4ebf-9b10-edd117611250	b14ce4ff-bb8f-4a9f-8641-1981686dfa33	Geospatial Coverage	Wudinna (DC) Local Government Area	b2020618-f4fc-447c-b1b0-2e25ece0aa21	4523979f-518a-4ebf-9b10-edd117611250	active	\N	2014-07-02 00:58:39.216086	9999-12-31 00:00:00	t
ef9bcae2-75ae-4201-8df3-3e3bcb91f6a1	0d99de21-7201-4411-8516-b07cbc336fdc	Temporal Coverage	2004	3e88c9bd-e46b-4254-9147-4ce2f1484978	ef9bcae2-75ae-4201-8df3-3e3bcb91f6a1	active	\N	2014-07-03 03:49:54.958347	9999-12-31 00:00:00	t
77074a88-f1b9-4735-b23a-bf0d78a1fcaf	0d99de21-7201-4411-8516-b07cbc336fdc	Data Location	Linked	3e88c9bd-e46b-4254-9147-4ce2f1484978	77074a88-f1b9-4735-b23a-bf0d78a1fcaf	active	\N	2014-07-03 03:49:54.958347	9999-12-31 00:00:00	t
196c9efd-0f71-4d2e-a1a6-e3039901d9ee	0d99de21-7201-4411-8516-b07cbc336fdc	Data Status	Inactive	3e88c9bd-e46b-4254-9147-4ce2f1484978	196c9efd-0f71-4d2e-a1a6-e3039901d9ee	active	\N	2014-07-03 03:49:54.958347	9999-12-31 00:00:00	t
07fd37d6-574b-49fc-a9ff-57d0e0f0d20c	0d99de21-7201-4411-8516-b07cbc336fdc	Geospatial Coverage	Mount Lofty Ranges	3e88c9bd-e46b-4254-9147-4ce2f1484978	07fd37d6-574b-49fc-a9ff-57d0e0f0d20c	active	\N	2014-07-03 03:49:54.958347	9999-12-31 00:00:00	t
a5a2c455-0657-40d9-9d22-3e663c65a715	31a2d19d-f032-4ff1-aa48-e394bc7930be	Data Granularity	N/A	aa4cfb28-0458-4979-9057-4a2153dbeece	a5a2c455-0657-40d9-9d22-3e663c65a715	active	\N	2014-07-03 04:06:26.52383	9999-12-31 00:00:00	t
553f2798-22ed-4773-97ca-46d72aa45d58	31a2d19d-f032-4ff1-aa48-e394bc7930be	Temporal Coverage	1997	aa4cfb28-0458-4979-9057-4a2153dbeece	553f2798-22ed-4773-97ca-46d72aa45d58	active	\N	2014-07-03 04:06:26.52383	9999-12-31 00:00:00	t
04bdb36d-0845-4c40-8853-2ca6cdcd4441	31a2d19d-f032-4ff1-aa48-e394bc7930be	Update Frequency	As Required	aa4cfb28-0458-4979-9057-4a2153dbeece	04bdb36d-0845-4c40-8853-2ca6cdcd4441	active	\N	2014-07-03 04:06:26.52383	9999-12-31 00:00:00	t
cfaeb7b0-bb50-4bdc-b226-8785dec12b77	31a2d19d-f032-4ff1-aa48-e394bc7930be	Data Location	Linked	aa4cfb28-0458-4979-9057-4a2153dbeece	cfaeb7b0-bb50-4bdc-b226-8785dec12b77	active	\N	2014-07-03 04:06:26.52383	9999-12-31 00:00:00	t
68aebd15-8ca0-4d42-961c-6b2d77b26b72	31a2d19d-f032-4ff1-aa48-e394bc7930be	Data Status	Active	aa4cfb28-0458-4979-9057-4a2153dbeece	68aebd15-8ca0-4d42-961c-6b2d77b26b72	active	\N	2014-07-03 04:06:26.52383	9999-12-31 00:00:00	t
1f92c4f4-3003-494f-8c81-174bbcff02a1	31a2d19d-f032-4ff1-aa48-e394bc7930be	Geospatial Coverage	South Australia	aa4cfb28-0458-4979-9057-4a2153dbeece	1f92c4f4-3003-494f-8c81-174bbcff02a1	active	\N	2014-07-03 04:06:26.52383	9999-12-31 00:00:00	t
936016cf-a1fb-4e7c-9e70-572c3e05320c	18548efb-c403-4b03-8e97-78d862a4c86b	Data Granularity	N/A	bb1311e4-d166-440b-9642-874bd661ea75	936016cf-a1fb-4e7c-9e70-572c3e05320c	active	\N	2014-07-03 04:07:45.260472	9999-12-31 00:00:00	t
a1771199-e9ba-4e78-937d-0085f494da94	18548efb-c403-4b03-8e97-78d862a4c86b	Data Status	Inactive	bb1311e4-d166-440b-9642-874bd661ea75	a1771199-e9ba-4e78-937d-0085f494da94	active	\N	2014-07-03 04:07:45.260472	9999-12-31 00:00:00	t
68b8beb5-ca45-4405-b394-77af68f93647	18548efb-c403-4b03-8e97-78d862a4c86b	Geospatial Coverage	South Australia	bb1311e4-d166-440b-9642-874bd661ea75	68b8beb5-ca45-4405-b394-77af68f93647	active	\N	2014-07-03 04:07:45.260472	9999-12-31 00:00:00	t
01b68ae1-c46b-4925-95e5-e0fc6dd631ad	18548efb-c403-4b03-8e97-78d862a4c86b	Update Frequency	As Required	bb1311e4-d166-440b-9642-874bd661ea75	01b68ae1-c46b-4925-95e5-e0fc6dd631ad	active	\N	2014-07-03 04:07:45.260472	9999-12-31 00:00:00	t
1b3be736-ace4-46a6-8a80-fd97d3432737	18548efb-c403-4b03-8e97-78d862a4c86b	Data Location	Linked	bb1311e4-d166-440b-9642-874bd661ea75	1b3be736-ace4-46a6-8a80-fd97d3432737	active	\N	2014-07-03 04:07:45.260472	9999-12-31 00:00:00	t
3aee6b1b-ecac-4de7-9f20-322be55aa13d	6bf4a9ae-86ce-43b7-969c-15c2ff0b20a6	Data Status	Inactive	6e86cdfd-e5be-4e17-ae45-8555acccddbb	3aee6b1b-ecac-4de7-9f20-322be55aa13d	active	\N	2014-07-03 04:10:19.948262	9999-12-31 00:00:00	t
909ae1f9-8cc3-49de-bfbf-e965386b7123	6bf4a9ae-86ce-43b7-969c-15c2ff0b20a6	Geospatial Coverage	South Australia	6e86cdfd-e5be-4e17-ae45-8555acccddbb	909ae1f9-8cc3-49de-bfbf-e965386b7123	active	\N	2014-07-03 04:10:19.948262	9999-12-31 00:00:00	t
4077d7c6-151c-48b4-8abd-281a09f0db45	6bf4a9ae-86ce-43b7-969c-15c2ff0b20a6	Data Granularity	N/A	6e86cdfd-e5be-4e17-ae45-8555acccddbb	4077d7c6-151c-48b4-8abd-281a09f0db45	active	\N	2014-07-03 04:10:19.948262	9999-12-31 00:00:00	t
badac074-1aaa-43fa-946a-86fa4c15b28b	6bf4a9ae-86ce-43b7-969c-15c2ff0b20a6	Update Frequency	As Required	6e86cdfd-e5be-4e17-ae45-8555acccddbb	badac074-1aaa-43fa-946a-86fa4c15b28b	active	\N	2014-07-03 04:10:19.948262	9999-12-31 00:00:00	t
d2d5f809-5b3c-4cc7-a91f-0284505818dd	6bf4a9ae-86ce-43b7-969c-15c2ff0b20a6	Temporal Coverage	2005-2009	6e86cdfd-e5be-4e17-ae45-8555acccddbb	d2d5f809-5b3c-4cc7-a91f-0284505818dd	active	\N	2014-07-03 04:10:19.948262	9999-12-31 00:00:00	t
5446ec24-d308-4292-a38a-30702368bf1a	6bf4a9ae-86ce-43b7-969c-15c2ff0b20a6	Data Location	Linked	6e86cdfd-e5be-4e17-ae45-8555acccddbb	5446ec24-d308-4292-a38a-30702368bf1a	active	\N	2014-07-03 04:10:19.948262	9999-12-31 00:00:00	t
e6e86149-ecbb-43c4-b2d2-b0525dc253f1	d51f4828-9b06-499c-9ea3-b5fc638eee75	Geospatial Coverage	South Australia	8f7224b7-d6d4-4938-8691-ae2862c8609b	e6e86149-ecbb-43c4-b2d2-b0525dc253f1	active	\N	2014-07-03 04:12:08.855776	9999-12-31 00:00:00	t
01564f93-752f-427a-9732-325aef852308	d51f4828-9b06-499c-9ea3-b5fc638eee75	Update Frequency	As Required	8f7224b7-d6d4-4938-8691-ae2862c8609b	01564f93-752f-427a-9732-325aef852308	active	\N	2014-07-03 04:12:08.855776	9999-12-31 00:00:00	t
437c67bb-4316-46e7-96e2-6f091d9bb016	d51f4828-9b06-499c-9ea3-b5fc638eee75	Data Granularity	N/A	8f7224b7-d6d4-4938-8691-ae2862c8609b	437c67bb-4316-46e7-96e2-6f091d9bb016	active	\N	2014-07-03 04:12:08.855776	9999-12-31 00:00:00	t
933da3a1-53f5-4525-9588-ec0434c80c41	d51f4828-9b06-499c-9ea3-b5fc638eee75	Data Location	Linked	8f7224b7-d6d4-4938-8691-ae2862c8609b	933da3a1-53f5-4525-9588-ec0434c80c41	active	\N	2014-07-03 04:12:08.855776	9999-12-31 00:00:00	t
42070e19-646d-49fa-a932-458cd2c8db39	47f695d5-ba24-4946-a4a4-6fdcc5895dc7	Data Granularity	N/A	72527b3e-e464-44c0-bc1f-4108f37615eb	42070e19-646d-49fa-a932-458cd2c8db39	active	\N	2014-07-02 01:02:29.947968	9999-12-31 00:00:00	t
59187c0b-e655-4935-842c-6463e7a22576	47f695d5-ba24-4946-a4a4-6fdcc5895dc7	Temporal Coverage	2007-2011	72527b3e-e464-44c0-bc1f-4108f37615eb	59187c0b-e655-4935-842c-6463e7a22576	active	\N	2014-07-02 01:02:29.947968	9999-12-31 00:00:00	t
dd915242-79b2-4992-8030-cba1afa00d02	47f695d5-ba24-4946-a4a4-6fdcc5895dc7	Data Status	N/A	72527b3e-e464-44c0-bc1f-4108f37615eb	dd915242-79b2-4992-8030-cba1afa00d02	active	\N	2014-07-02 01:02:29.947968	9999-12-31 00:00:00	t
056046c4-298f-4f46-bc69-99d0d3886b1d	47f695d5-ba24-4946-a4a4-6fdcc5895dc7	Update Frequency	Annually	72527b3e-e464-44c0-bc1f-4108f37615eb	056046c4-298f-4f46-bc69-99d0d3886b1d	active	\N	2014-07-02 01:02:29.947968	9999-12-31 00:00:00	t
1a921183-e2d0-438a-bd17-c06971298fe4	47f695d5-ba24-4946-a4a4-6fdcc5895dc7	Geospatial Coverage	Yankalilla (DC) Local Government Area	72527b3e-e464-44c0-bc1f-4108f37615eb	1a921183-e2d0-438a-bd17-c06971298fe4	active	\N	2014-07-02 01:02:29.947968	9999-12-31 00:00:00	t
ef46c1b3-786e-46fd-931b-42989fa96a47	47f695d5-ba24-4946-a4a4-6fdcc5895dc7	Data Location	Linked	72527b3e-e464-44c0-bc1f-4108f37615eb	ef46c1b3-786e-46fd-931b-42989fa96a47	active	\N	2014-07-02 01:02:29.947968	9999-12-31 00:00:00	t
7864d83b-e265-4103-a697-edab02615380	bd50f83d-19a9-487e-8fea-85be5c761ca5	Data Location	Linked	4992ce9e-f2c5-4893-8cf8-a69cd87475d3	7864d83b-e265-4103-a697-edab02615380	active	\N	2014-07-02 01:05:43.892261	9999-12-31 00:00:00	t
c0362d7b-eb8a-4fb8-8c4a-be811baf2aa9	bd50f83d-19a9-487e-8fea-85be5c761ca5	Update Frequency	Annually	4992ce9e-f2c5-4893-8cf8-a69cd87475d3	c0362d7b-eb8a-4fb8-8c4a-be811baf2aa9	active	\N	2014-07-02 01:05:43.892261	9999-12-31 00:00:00	t
6b7e52b7-a8b1-4dc2-8662-09d17182cf77	bd50f83d-19a9-487e-8fea-85be5c761ca5	Geospatial Coverage	Yorke Peninsula (DC) Local Government Area	4992ce9e-f2c5-4893-8cf8-a69cd87475d3	6b7e52b7-a8b1-4dc2-8662-09d17182cf77	active	\N	2014-07-02 01:05:43.892261	9999-12-31 00:00:00	t
5fe65112-b1bf-49ee-9942-e9bac922c857	bd50f83d-19a9-487e-8fea-85be5c761ca5	Temporal Coverage	2007-2011	4992ce9e-f2c5-4893-8cf8-a69cd87475d3	5fe65112-b1bf-49ee-9942-e9bac922c857	active	\N	2014-07-02 01:05:43.892261	9999-12-31 00:00:00	t
9c7314ff-a407-4808-b1b3-ba564942a4a7	bd50f83d-19a9-487e-8fea-85be5c761ca5	Data Status	N/A	4992ce9e-f2c5-4893-8cf8-a69cd87475d3	9c7314ff-a407-4808-b1b3-ba564942a4a7	active	\N	2014-07-02 01:05:43.892261	9999-12-31 00:00:00	t
f64a3c3c-880a-4858-8abf-68a385fc00fb	bd50f83d-19a9-487e-8fea-85be5c761ca5	Data Granularity	N/A	4992ce9e-f2c5-4893-8cf8-a69cd87475d3	f64a3c3c-880a-4858-8abf-68a385fc00fb	active	\N	2014-07-02 01:05:43.892261	9999-12-31 00:00:00	t
5674588e-a076-422d-a6b7-67f1d07a99ee	b73e0996-72d2-42f4-8543-42a6510f0082	Data Granularity	N/A	54bdff8a-aa7d-467e-b7c3-2c82128a4d59	5674588e-a076-422d-a6b7-67f1d07a99ee	active	\N	2014-07-02 01:53:48.813999	9999-12-31 00:00:00	t
99148a49-77cc-4b31-9384-1472f60928ce	b73e0996-72d2-42f4-8543-42a6510f0082	Update Frequency	Annually	54bdff8a-aa7d-467e-b7c3-2c82128a4d59	99148a49-77cc-4b31-9384-1472f60928ce	active	\N	2014-07-02 01:53:48.813999	9999-12-31 00:00:00	t
f669a96e-ad59-4f6f-bd7d-01284086384b	b73e0996-72d2-42f4-8543-42a6510f0082	Data Location	Linked	54bdff8a-aa7d-467e-b7c3-2c82128a4d59	f669a96e-ad59-4f6f-bd7d-01284086384b	active	\N	2014-07-02 01:53:48.813999	9999-12-31 00:00:00	t
0ce47e6b-1742-4bbe-bdd0-3afa653f4847	b73e0996-72d2-42f4-8543-42a6510f0082	Geospatial Coverage	Goyder (DC) Local Government Area	54bdff8a-aa7d-467e-b7c3-2c82128a4d59	0ce47e6b-1742-4bbe-bdd0-3afa653f4847	active	\N	2014-07-02 01:53:48.813999	9999-12-31 00:00:00	t
4e016e6d-dd67-47ad-8163-2ea028d3f57c	b73e0996-72d2-42f4-8543-42a6510f0082	Temporal Coverage	2007-2011	54bdff8a-aa7d-467e-b7c3-2c82128a4d59	4e016e6d-dd67-47ad-8163-2ea028d3f57c	active	\N	2014-07-02 01:53:48.813999	9999-12-31 00:00:00	t
26258f40-f434-49f0-9b8a-67744724709a	b73e0996-72d2-42f4-8543-42a6510f0082	Data Status	N/A	54bdff8a-aa7d-467e-b7c3-2c82128a4d59	26258f40-f434-49f0-9b8a-67744724709a	active	\N	2014-07-02 01:53:48.813999	9999-12-31 00:00:00	t
15644669-3539-4a0f-9267-04f21327b864	58750bb9-5c71-4d62-8f57-6eb9858a23b7	Temporal Coverage	2007-2011	3de29a10-a9b2-42cf-a50a-5b40b8eb3278	15644669-3539-4a0f-9267-04f21327b864	active	\N	2014-07-02 01:57:03.202789	9999-12-31 00:00:00	t
562ff8f1-86e7-44bf-9f8c-cd6dbbfb7556	58750bb9-5c71-4d62-8f57-6eb9858a23b7	Data Location	Linked	3de29a10-a9b2-42cf-a50a-5b40b8eb3278	562ff8f1-86e7-44bf-9f8c-cd6dbbfb7556	active	\N	2014-07-02 01:57:03.202789	9999-12-31 00:00:00	t
cf15306b-5012-4cf8-af27-cbe5268d41bb	58750bb9-5c71-4d62-8f57-6eb9858a23b7	Geospatial Coverage	Grant (DC) Local Government Area	3de29a10-a9b2-42cf-a50a-5b40b8eb3278	cf15306b-5012-4cf8-af27-cbe5268d41bb	active	\N	2014-07-02 01:57:03.202789	9999-12-31 00:00:00	t
1f7685a7-8c3c-4afa-acd8-1ff3fce51843	58750bb9-5c71-4d62-8f57-6eb9858a23b7	Data Status	N/A	3de29a10-a9b2-42cf-a50a-5b40b8eb3278	1f7685a7-8c3c-4afa-acd8-1ff3fce51843	active	\N	2014-07-02 01:57:03.202789	9999-12-31 00:00:00	t
8bd205d4-7e37-48d3-be3c-75375c147956	58750bb9-5c71-4d62-8f57-6eb9858a23b7	Data Granularity	N/A	3de29a10-a9b2-42cf-a50a-5b40b8eb3278	8bd205d4-7e37-48d3-be3c-75375c147956	active	\N	2014-07-02 01:57:03.202789	9999-12-31 00:00:00	t
9cf7b5df-ebc5-4daa-8e17-b1500ad5f3f8	58750bb9-5c71-4d62-8f57-6eb9858a23b7	Update Frequency	Annually	3de29a10-a9b2-42cf-a50a-5b40b8eb3278	9cf7b5df-ebc5-4daa-8e17-b1500ad5f3f8	active	\N	2014-07-02 01:57:03.202789	9999-12-31 00:00:00	t
f021ae98-a305-4c67-a702-bb8ed4cb2945	e7772452-c3da-4c39-974b-b16a03cc6618	Data Status	N/A	f5c5c3d2-fa27-4e76-946a-b85b80124905	f021ae98-a305-4c67-a702-bb8ed4cb2945	active	\N	2014-07-02 02:00:54.73676	9999-12-31 00:00:00	t
4bc3b325-6dfa-4156-b0ac-a68e077c5725	e7772452-c3da-4c39-974b-b16a03cc6618	Data Granularity	N/A	f5c5c3d2-fa27-4e76-946a-b85b80124905	4bc3b325-6dfa-4156-b0ac-a68e077c5725	active	\N	2014-07-02 02:00:54.73676	9999-12-31 00:00:00	t
130bd5dc-9e4e-4e4f-b1b2-627e161a3a45	e7772452-c3da-4c39-974b-b16a03cc6618	Data Location	Linked	f5c5c3d2-fa27-4e76-946a-b85b80124905	130bd5dc-9e4e-4e4f-b1b2-627e161a3a45	active	\N	2014-07-02 02:00:54.73676	9999-12-31 00:00:00	t
df3ce5ac-d1ef-4c5e-8d8a-0bb8e1376e5a	e7772452-c3da-4c39-974b-b16a03cc6618	Update Frequency	Annually	f5c5c3d2-fa27-4e76-946a-b85b80124905	df3ce5ac-d1ef-4c5e-8d8a-0bb8e1376e5a	active	\N	2014-07-02 02:00:54.73676	9999-12-31 00:00:00	t
ecb8d3a7-ac65-46d3-8355-ba40cba90621	e7772452-c3da-4c39-974b-b16a03cc6618	Geospatial Coverage	Holdfast Bay (C) Local Government Area	f5c5c3d2-fa27-4e76-946a-b85b80124905	ecb8d3a7-ac65-46d3-8355-ba40cba90621	active	\N	2014-07-02 02:00:54.73676	9999-12-31 00:00:00	t
fadc1ecf-faa5-4e36-b938-9b6466ffb510	e7772452-c3da-4c39-974b-b16a03cc6618	Temporal Coverage	2007-2011	f5c5c3d2-fa27-4e76-946a-b85b80124905	fadc1ecf-faa5-4e36-b938-9b6466ffb510	active	\N	2014-07-02 02:00:54.73676	9999-12-31 00:00:00	t
51a9d36f-9867-4225-9e64-5d3f4357c540	d90d6075-4b7c-49a3-9aab-094103471889	Data Granularity	N/A	75b0b8e2-c317-4f84-9502-e8eedac17436	51a9d36f-9867-4225-9e64-5d3f4357c540	active	\N	2014-07-03 03:51:04.540713	9999-12-31 00:00:00	t
c5ae2c56-a013-465b-af91-4c89398098a3	d90d6075-4b7c-49a3-9aab-094103471889	Temporal Coverage	2004	75b0b8e2-c317-4f84-9502-e8eedac17436	c5ae2c56-a013-465b-af91-4c89398098a3	active	\N	2014-07-03 03:51:04.540713	9999-12-31 00:00:00	t
ceda94e9-ba50-4f8f-905d-1fa3c14152d8	d90d6075-4b7c-49a3-9aab-094103471889	Data Status	Inactive	75b0b8e2-c317-4f84-9502-e8eedac17436	ceda94e9-ba50-4f8f-905d-1fa3c14152d8	active	\N	2014-07-03 03:51:04.540713	9999-12-31 00:00:00	t
068d55f4-0664-479e-a41c-76ba9aef75fc	d90d6075-4b7c-49a3-9aab-094103471889	Data Location	Linked	75b0b8e2-c317-4f84-9502-e8eedac17436	068d55f4-0664-479e-a41c-76ba9aef75fc	active	\N	2014-07-03 03:51:04.540713	9999-12-31 00:00:00	t
daeccbbb-3d1a-43ca-b190-a1228115bc9e	d90d6075-4b7c-49a3-9aab-094103471889	Update Frequency	As Required	75b0b8e2-c317-4f84-9502-e8eedac17436	daeccbbb-3d1a-43ca-b190-a1228115bc9e	active	\N	2014-07-03 03:51:04.540713	9999-12-31 00:00:00	t
48ea09cb-bfe4-4dee-bc97-12ed11777390	d90d6075-4b7c-49a3-9aab-094103471889	Geospatial Coverage	Mount Lofty Ranges	75b0b8e2-c317-4f84-9502-e8eedac17436	48ea09cb-bfe4-4dee-bc97-12ed11777390	active	\N	2014-07-03 03:51:04.540713	9999-12-31 00:00:00	t
a502fd29-dafb-403d-971b-ddb89b6b9897	8e223bcf-7a32-4d43-a0b9-f39c5f65a7da	Data Status	Inactive	c2a65581-75d8-4732-b523-284443a40188	a502fd29-dafb-403d-971b-ddb89b6b9897	active	\N	2014-07-03 03:52:48.773038	9999-12-31 00:00:00	t
fc9d76ae-8c61-457b-a7b1-e80ce0d8211e	8e223bcf-7a32-4d43-a0b9-f39c5f65a7da	Temporal Coverage	March 2012	c2a65581-75d8-4732-b523-284443a40188	fc9d76ae-8c61-457b-a7b1-e80ce0d8211e	active	\N	2014-07-03 03:52:48.773038	9999-12-31 00:00:00	t
37ae8bfc-6e96-4c2f-9f6d-e4b10a3abe9a	8e223bcf-7a32-4d43-a0b9-f39c5f65a7da	Geospatial Coverage	South Australia	c2a65581-75d8-4732-b523-284443a40188	37ae8bfc-6e96-4c2f-9f6d-e4b10a3abe9a	active	\N	2014-07-03 03:52:48.773038	9999-12-31 00:00:00	t
c7f6d4c5-fa14-4212-9410-1bb674e2a0a1	8e223bcf-7a32-4d43-a0b9-f39c5f65a7da	Data Location	Linked	c2a65581-75d8-4732-b523-284443a40188	c7f6d4c5-fa14-4212-9410-1bb674e2a0a1	active	\N	2014-07-03 03:52:48.773038	9999-12-31 00:00:00	t
9be8622c-cd03-454d-8619-cda44574ecd2	8e223bcf-7a32-4d43-a0b9-f39c5f65a7da	Update Frequency	As Required	c2a65581-75d8-4732-b523-284443a40188	9be8622c-cd03-454d-8619-cda44574ecd2	active	\N	2014-07-03 03:52:48.773038	9999-12-31 00:00:00	t
c26e79ef-afe3-43ce-87f9-2b30ab60b0a9	8e223bcf-7a32-4d43-a0b9-f39c5f65a7da	Data Granularity	N/A	c2a65581-75d8-4732-b523-284443a40188	c26e79ef-afe3-43ce-87f9-2b30ab60b0a9	active	\N	2014-07-03 03:52:48.773038	9999-12-31 00:00:00	t
662496c0-5cf7-4bc7-9e99-ec1da4b70832	00f1ac6c-0b3d-4611-8f58-ff942800d4c2	Temporal Coverage	March 2012	dbb5f4cb-e5d2-4ec0-9f1f-90ad4c70c813	662496c0-5cf7-4bc7-9e99-ec1da4b70832	active	\N	2014-07-03 03:55:36.464293	9999-12-31 00:00:00	t
62c34360-1198-4207-bff1-4c35da6af442	00f1ac6c-0b3d-4611-8f58-ff942800d4c2	Geospatial Coverage	South Australia	dbb5f4cb-e5d2-4ec0-9f1f-90ad4c70c813	62c34360-1198-4207-bff1-4c35da6af442	active	\N	2014-07-03 03:55:36.464293	9999-12-31 00:00:00	t
581d2c29-6b28-4cbc-ad02-0a5db74c7311	00f1ac6c-0b3d-4611-8f58-ff942800d4c2	Data Status	Inactive	dbb5f4cb-e5d2-4ec0-9f1f-90ad4c70c813	581d2c29-6b28-4cbc-ad02-0a5db74c7311	active	\N	2014-07-03 03:55:36.464293	9999-12-31 00:00:00	t
694010cb-2398-4fc3-88a2-424bfd1d99a0	00f1ac6c-0b3d-4611-8f58-ff942800d4c2	Update Frequency	As Required	dbb5f4cb-e5d2-4ec0-9f1f-90ad4c70c813	694010cb-2398-4fc3-88a2-424bfd1d99a0	active	\N	2014-07-03 03:55:36.464293	9999-12-31 00:00:00	t
47b54112-a476-4f56-8009-d6bf8a63c1f2	00f1ac6c-0b3d-4611-8f58-ff942800d4c2	Data Location	Linked	dbb5f4cb-e5d2-4ec0-9f1f-90ad4c70c813	47b54112-a476-4f56-8009-d6bf8a63c1f2	active	\N	2014-07-03 03:55:36.464293	9999-12-31 00:00:00	t
b2d17e82-2f43-4ff4-9570-c0bf570655b2	00f1ac6c-0b3d-4611-8f58-ff942800d4c2	Data Granularity	N/A	dbb5f4cb-e5d2-4ec0-9f1f-90ad4c70c813	b2d17e82-2f43-4ff4-9570-c0bf570655b2	active	\N	2014-07-03 03:55:36.464293	9999-12-31 00:00:00	t
c7fce2cb-58a1-4069-9ecc-a1ad800d98b9	199cff6d-fe34-4021-b2b2-fa11a96fd42d	Data Status	Inactive	7454cb41-82ac-4c36-a2d5-80167ca482e1	c7fce2cb-58a1-4069-9ecc-a1ad800d98b9	active	\N	2014-07-03 04:03:59.314451	9999-12-31 00:00:00	t
20c6cff2-1517-4389-af74-cf3658fb9ff7	199cff6d-fe34-4021-b2b2-fa11a96fd42d	Update Frequency	Complete	7454cb41-82ac-4c36-a2d5-80167ca482e1	20c6cff2-1517-4389-af74-cf3658fb9ff7	active	\N	2014-07-03 04:03:59.314451	9999-12-31 00:00:00	t
96f9c4a1-6939-4194-a095-1e9c49b59c5e	199cff6d-fe34-4021-b2b2-fa11a96fd42d	Temporal Coverage	1997	7454cb41-82ac-4c36-a2d5-80167ca482e1	96f9c4a1-6939-4194-a095-1e9c49b59c5e	active	\N	2014-07-03 04:03:59.314451	9999-12-31 00:00:00	t
ae92e9bd-4317-4925-8d6c-fa922df06e3c	199cff6d-fe34-4021-b2b2-fa11a96fd42d	Data Granularity	N/A	7454cb41-82ac-4c36-a2d5-80167ca482e1	ae92e9bd-4317-4925-8d6c-fa922df06e3c	active	\N	2014-07-03 04:03:59.314451	9999-12-31 00:00:00	t
d98b1999-f941-41e1-91d2-e84951e6d3fc	199cff6d-fe34-4021-b2b2-fa11a96fd42d	Data Location	Linked	7454cb41-82ac-4c36-a2d5-80167ca482e1	d98b1999-f941-41e1-91d2-e84951e6d3fc	active	\N	2014-07-03 04:03:59.314451	9999-12-31 00:00:00	t
07fb4a6d-a251-40f9-a2c4-7c09fd740742	199cff6d-fe34-4021-b2b2-fa11a96fd42d	Geospatial Coverage	South Australia	7454cb41-82ac-4c36-a2d5-80167ca482e1	07fb4a6d-a251-40f9-a2c4-7c09fd740742	active	\N	2014-07-03 04:03:59.314451	9999-12-31 00:00:00	t
f77fe247-fab8-4f4c-a0d9-31b026c081d1	d73a62b2-a105-46aa-bd16-11e738e04f66	Update Frequency	Annually	54411bda-f043-47be-bd04-2197da3ec2d2	f77fe247-fab8-4f4c-a0d9-31b026c081d1	active	\N	2014-07-02 02:15:35.235414	9999-12-31 00:00:00	t
803298ab-fa5d-4425-873f-0eec47e3339e	d73a62b2-a105-46aa-bd16-11e738e04f66	Data Location	Hosted	54411bda-f043-47be-bd04-2197da3ec2d2	803298ab-fa5d-4425-873f-0eec47e3339e	active	\N	2014-07-02 02:15:35.235414	9999-12-31 00:00:00	t
00423c0f-c822-4db3-b3da-e3cd10ea193a	d73a62b2-a105-46aa-bd16-11e738e04f66	Data Granularity	Financial Year	54411bda-f043-47be-bd04-2197da3ec2d2	00423c0f-c822-4db3-b3da-e3cd10ea193a	active	\N	2014-07-02 02:15:35.235414	9999-12-31 00:00:00	t
c48ff42d-00ab-47f5-90b2-8e440fee302d	d73a62b2-a105-46aa-bd16-11e738e04f66	Geospatial Coverage	South Australia	54411bda-f043-47be-bd04-2197da3ec2d2	c48ff42d-00ab-47f5-90b2-8e440fee302d	active	\N	2014-07-02 02:15:35.235414	9999-12-31 00:00:00	t
777dae52-ebc5-4301-9503-72c396d31096	d73a62b2-a105-46aa-bd16-11e738e04f66	Temporal Coverage	2008-09 to 2012-13	54411bda-f043-47be-bd04-2197da3ec2d2	777dae52-ebc5-4301-9503-72c396d31096	active	\N	2014-07-02 02:15:35.235414	9999-12-31 00:00:00	t
72fe3011-7f39-4638-a5f3-76fdbfce1fdc	d73a62b2-a105-46aa-bd16-11e738e04f66	Data Status	Active	54411bda-f043-47be-bd04-2197da3ec2d2	72fe3011-7f39-4638-a5f3-76fdbfce1fdc	active	\N	2014-07-02 02:15:35.235414	9999-12-31 00:00:00	t
d7281474-2fe6-4fd3-9b7b-059dcaf44b41	80e32891-3ca9-448c-b232-9a0c3af6d596	Data Granularity	N/A	7e0051b2-ee23-4714-bfa7-b91983b9b5ff	d7281474-2fe6-4fd3-9b7b-059dcaf44b41	active	\N	2014-07-02 02:32:44.29486	9999-12-31 00:00:00	t
349617f1-4ae9-45a0-8aee-648ad1357f87	80e32891-3ca9-448c-b232-9a0c3af6d596	Geospatial Coverage	http://www.ocsar.sa.gov.au/region_files/LGA%20Kangaroo%20Island%20%28DC%29.html	7e0051b2-ee23-4714-bfa7-b91983b9b5ff	349617f1-4ae9-45a0-8aee-648ad1357f87	active	\N	2014-07-02 02:32:44.29486	9999-12-31 00:00:00	t
d92e35cb-bbe0-4ab1-a78a-0f44b9a8de37	80e32891-3ca9-448c-b232-9a0c3af6d596	Temporal Coverage	2007-2011	7e0051b2-ee23-4714-bfa7-b91983b9b5ff	d92e35cb-bbe0-4ab1-a78a-0f44b9a8de37	active	\N	2014-07-02 02:32:44.29486	9999-12-31 00:00:00	t
36bdac84-80d3-4b6f-a6d8-f612884d2b56	80e32891-3ca9-448c-b232-9a0c3af6d596	Update Frequency	Annually	7e0051b2-ee23-4714-bfa7-b91983b9b5ff	36bdac84-80d3-4b6f-a6d8-f612884d2b56	active	\N	2014-07-02 02:32:44.29486	9999-12-31 00:00:00	t
87bc71c4-4623-44a1-853c-eefed3a98e72	80e32891-3ca9-448c-b232-9a0c3af6d596	Data Location	Linked	7e0051b2-ee23-4714-bfa7-b91983b9b5ff	87bc71c4-4623-44a1-853c-eefed3a98e72	active	\N	2014-07-02 02:32:44.29486	9999-12-31 00:00:00	t
bde16d4e-62e2-479b-be54-1cb7ee10d065	80e32891-3ca9-448c-b232-9a0c3af6d596	Data Status	N/A	7e0051b2-ee23-4714-bfa7-b91983b9b5ff	bde16d4e-62e2-479b-be54-1cb7ee10d065	active	\N	2014-07-02 02:32:44.29486	9999-12-31 00:00:00	t
cca13d71-d2da-46a7-8c7f-bfe34ba153b2	51a36ab6-9d9a-4f61-bd1c-4444845afc39	Data Location	Linked	3f901e21-3643-43be-a224-56b4c583d626	cca13d71-d2da-46a7-8c7f-bfe34ba153b2	active	\N	2014-07-02 04:07:56.952206	9999-12-31 00:00:00	t
b92bffa0-eed3-4118-838f-fad7d2e39da2	51a36ab6-9d9a-4f61-bd1c-4444845afc39	Geospatial Coverage	Karoonda East Murray (DC) Local Government Area	3f901e21-3643-43be-a224-56b4c583d626	b92bffa0-eed3-4118-838f-fad7d2e39da2	active	\N	2014-07-02 04:07:56.952206	9999-12-31 00:00:00	t
cf70266f-9ebc-458e-9e8d-2f71525d0a1f	51a36ab6-9d9a-4f61-bd1c-4444845afc39	Data Granularity	N/A	3f901e21-3643-43be-a224-56b4c583d626	cf70266f-9ebc-458e-9e8d-2f71525d0a1f	active	\N	2014-07-02 04:07:56.952206	9999-12-31 00:00:00	t
596292fc-dfae-49cc-881b-3546fc91149c	51a36ab6-9d9a-4f61-bd1c-4444845afc39	Data Status	N/A	3f901e21-3643-43be-a224-56b4c583d626	596292fc-dfae-49cc-881b-3546fc91149c	active	\N	2014-07-02 04:07:56.952206	9999-12-31 00:00:00	t
82bf743b-e199-43d2-9a1b-6ddf74c2a630	51a36ab6-9d9a-4f61-bd1c-4444845afc39	Temporal Coverage	2007-2011	3f901e21-3643-43be-a224-56b4c583d626	82bf743b-e199-43d2-9a1b-6ddf74c2a630	active	\N	2014-07-02 04:07:56.952206	9999-12-31 00:00:00	t
c791064b-1d2f-4eda-9827-8f00f9333178	51a36ab6-9d9a-4f61-bd1c-4444845afc39	Update Frequency	Annually	3f901e21-3643-43be-a224-56b4c583d626	c791064b-1d2f-4eda-9827-8f00f9333178	active	\N	2014-07-02 04:07:56.952206	9999-12-31 00:00:00	t
35626806-2435-461c-82da-420f4b7130d8	76230080-1b6f-419a-adba-99cc723a2314	Geospatial Coverage	Kimba (DC) Local Government Area	a225ddeb-4338-463d-9552-643430c45437	35626806-2435-461c-82da-420f4b7130d8	active	\N	2014-07-02 04:22:07.580219	9999-12-31 00:00:00	t
0f53811f-ad3f-4560-9630-3f305c09725e	76230080-1b6f-419a-adba-99cc723a2314	Data Granularity	N/A	a225ddeb-4338-463d-9552-643430c45437	0f53811f-ad3f-4560-9630-3f305c09725e	active	\N	2014-07-02 04:22:07.580219	9999-12-31 00:00:00	t
d0fd8c36-b08e-44a3-a8c5-47fc0f0bf040	76230080-1b6f-419a-adba-99cc723a2314	Update Frequency	Annually	a225ddeb-4338-463d-9552-643430c45437	d0fd8c36-b08e-44a3-a8c5-47fc0f0bf040	active	\N	2014-07-02 04:22:07.580219	9999-12-31 00:00:00	t
eb39737b-0327-40c6-a911-43fc1911ce75	76230080-1b6f-419a-adba-99cc723a2314	Data Status	N/A	a225ddeb-4338-463d-9552-643430c45437	eb39737b-0327-40c6-a911-43fc1911ce75	active	\N	2014-07-02 04:22:07.580219	9999-12-31 00:00:00	t
2a206c21-88f7-45fd-b854-905a00df65f7	76230080-1b6f-419a-adba-99cc723a2314	Temporal Coverage	2007-2011	a225ddeb-4338-463d-9552-643430c45437	2a206c21-88f7-45fd-b854-905a00df65f7	active	\N	2014-07-02 04:22:07.580219	9999-12-31 00:00:00	t
c95fb0d5-89b5-43a3-b75b-a4681b97ff12	76230080-1b6f-419a-adba-99cc723a2314	Data Location	Linked	a225ddeb-4338-463d-9552-643430c45437	c95fb0d5-89b5-43a3-b75b-a4681b97ff12	active	\N	2014-07-02 04:22:07.580219	9999-12-31 00:00:00	t
856f462d-d06c-45e3-8f93-289f8cdd15cd	f7d03fcc-72e1-4e2d-a3b0-0ebde9201741	Data Location	Linked	68f3289b-a66d-4db9-bba2-e25cf3f919a1	856f462d-d06c-45e3-8f93-289f8cdd15cd	active	\N	2014-07-02 04:26:10.372036	9999-12-31 00:00:00	t
07e7a3bf-cd89-4fa7-8512-5775fc214989	f7d03fcc-72e1-4e2d-a3b0-0ebde9201741	Data Granularity	N/A	68f3289b-a66d-4db9-bba2-e25cf3f919a1	07e7a3bf-cd89-4fa7-8512-5775fc214989	active	\N	2014-07-02 04:26:10.372036	9999-12-31 00:00:00	t
b4ffbd34-8fc5-4723-8c25-5dcd07a2b4e9	f7d03fcc-72e1-4e2d-a3b0-0ebde9201741	Data Status	N/A	68f3289b-a66d-4db9-bba2-e25cf3f919a1	b4ffbd34-8fc5-4723-8c25-5dcd07a2b4e9	active	\N	2014-07-02 04:26:10.372036	9999-12-31 00:00:00	t
a881adcc-1f79-46f2-9322-eee76c74eed8	f7d03fcc-72e1-4e2d-a3b0-0ebde9201741	Geospatial Coverage	Kingston (DC) Local Government Area	68f3289b-a66d-4db9-bba2-e25cf3f919a1	a881adcc-1f79-46f2-9322-eee76c74eed8	active	\N	2014-07-02 04:26:10.372036	9999-12-31 00:00:00	t
aee547cd-4913-4391-9575-48397ed1f465	f7d03fcc-72e1-4e2d-a3b0-0ebde9201741	Update Frequency	Annually	68f3289b-a66d-4db9-bba2-e25cf3f919a1	aee547cd-4913-4391-9575-48397ed1f465	active	\N	2014-07-02 04:26:10.372036	9999-12-31 00:00:00	t
a4c88192-e1ba-430e-b6a2-73b3c0fd8e8d	f7d03fcc-72e1-4e2d-a3b0-0ebde9201741	Temporal Coverage	2007-2011	68f3289b-a66d-4db9-bba2-e25cf3f919a1	a4c88192-e1ba-430e-b6a2-73b3c0fd8e8d	active	\N	2014-07-02 04:26:10.372036	9999-12-31 00:00:00	t
50c770bc-ceb6-4b70-91d2-62e82725760a	2ddbb77b-af67-46ee-bfc2-6f24ac3be01e	Data Location	Linked	56f62dad-489c-4da9-bb79-b4319a2c00cd	50c770bc-ceb6-4b70-91d2-62e82725760a	active	\N	2014-07-03 03:58:26.516636	9999-12-31 00:00:00	t
8043c308-97aa-44a0-9660-5c4d163b1b37	2ddbb77b-af67-46ee-bfc2-6f24ac3be01e	Data Granularity	N/A	56f62dad-489c-4da9-bb79-b4319a2c00cd	8043c308-97aa-44a0-9660-5c4d163b1b37	active	\N	2014-07-03 03:58:26.516636	9999-12-31 00:00:00	t
7d2e3a37-bdfe-4169-a370-571324e7cd9f	2ddbb77b-af67-46ee-bfc2-6f24ac3be01e	Data Status	Inactive	56f62dad-489c-4da9-bb79-b4319a2c00cd	7d2e3a37-bdfe-4169-a370-571324e7cd9f	active	\N	2014-07-03 03:58:26.516636	9999-12-31 00:00:00	t
8f1ac4f1-dde3-432d-b539-46323f3fe456	2ddbb77b-af67-46ee-bfc2-6f24ac3be01e	Temporal Coverage	March 2012	56f62dad-489c-4da9-bb79-b4319a2c00cd	8f1ac4f1-dde3-432d-b539-46323f3fe456	active	\N	2014-07-03 03:58:26.516636	9999-12-31 00:00:00	t
2b280e5c-29b6-4e38-bcad-c37661738f60	2ddbb77b-af67-46ee-bfc2-6f24ac3be01e	Update Frequency	As Required	56f62dad-489c-4da9-bb79-b4319a2c00cd	2b280e5c-29b6-4e38-bcad-c37661738f60	active	\N	2014-07-03 03:58:26.516636	9999-12-31 00:00:00	t
8fac9835-b0a3-4328-ac29-c731eeea469d	71ddb1f9-ac70-473b-af27-7ab14d5debbf	Update Frequency	Daily	6b15317d-1ed8-494d-84d3-a3d62fea40be	8fac9835-b0a3-4328-ac29-c731eeea469d	active	\N	2014-07-02 04:31:23.439478	9999-12-31 00:00:00	t
1acfc72f-966b-4137-b4a4-514b12594aa2	71ddb1f9-ac70-473b-af27-7ab14d5debbf	Temporal Coverage	Current	6b15317d-1ed8-494d-84d3-a3d62fea40be	1acfc72f-966b-4137-b4a4-514b12594aa2	active	\N	2014-07-02 04:31:23.439478	9999-12-31 00:00:00	t
c14ce725-5f5a-4574-b75e-6bee5232fc74	71ddb1f9-ac70-473b-af27-7ab14d5debbf	Geospatial Coverage	South Australia	6b15317d-1ed8-494d-84d3-a3d62fea40be	c14ce725-5f5a-4574-b75e-6bee5232fc74	active	\N	2014-07-02 04:31:23.439478	9999-12-31 00:00:00	t
cd8bd284-2971-435e-889f-f7dbaa871b7c	7002bf38-6f74-4b6f-a01a-620dd065511a	Data Status	Active	b662efea-244d-4a1c-9ea9-e303a5432d8b	cd8bd284-2971-435e-889f-f7dbaa871b7c	active	\N	2014-07-03 00:58:12.895022	9999-12-31 00:00:00	t
6018ee6d-334e-4994-8db9-14d5b4c5cba1	71ddb1f9-ac70-473b-af27-7ab14d5debbf	Data Granularity	Data is updated daily and visible within the dataset the following day	6b15317d-1ed8-494d-84d3-a3d62fea40be	6018ee6d-334e-4994-8db9-14d5b4c5cba1	active	\N	2014-07-02 04:31:23.439478	9999-12-31 00:00:00	t
370e6ffe-57a9-4e86-bdd5-0216578c3eb6	71ddb1f9-ac70-473b-af27-7ab14d5debbf	Data Location	Linked	6b15317d-1ed8-494d-84d3-a3d62fea40be	370e6ffe-57a9-4e86-bdd5-0216578c3eb6	active	\N	2014-07-02 04:31:23.439478	9999-12-31 00:00:00	t
d363625d-0737-441c-ac94-e7eabd62a11e	2ddbb77b-af67-46ee-bfc2-6f24ac3be01e	Geospatial Coverage	South Australia	56f62dad-489c-4da9-bb79-b4319a2c00cd	d363625d-0737-441c-ac94-e7eabd62a11e	active	\N	2014-07-03 03:58:26.516636	9999-12-31 00:00:00	t
90aea3a7-1af7-4f5b-af99-2e1c6881314a	cc790713-4cf0-4bd4-bca8-f195d8e202b7	Temporal Coverage	Current	ae45fb17-e4e4-4730-a1db-563657e00e91	90aea3a7-1af7-4f5b-af99-2e1c6881314a	active	\N	2014-07-02 04:50:50.631726	9999-12-31 00:00:00	t
ac5cf25c-dc8f-400d-912a-f2733487d06f	cc790713-4cf0-4bd4-bca8-f195d8e202b7	Data Location	Linked	ae45fb17-e4e4-4730-a1db-563657e00e91	ac5cf25c-dc8f-400d-912a-f2733487d06f	active	\N	2014-07-02 04:50:50.631726	9999-12-31 00:00:00	t
7a2a49c0-7a62-4cbf-a26d-789bfbbeed1b	cc790713-4cf0-4bd4-bca8-f195d8e202b7	Data Granularity	Data is typically updated on a catchment, basin or administrative region basis and frequency ranges from annually for high rainfall areas through to five yearly or more for arid regions. 	ae45fb17-e4e4-4730-a1db-563657e00e91	7a2a49c0-7a62-4cbf-a26d-789bfbbeed1b	active	\N	2014-07-02 04:50:50.631726	9999-12-31 00:00:00	t
46eaff27-c5fe-490e-b1eb-d5305cab837c	cc790713-4cf0-4bd4-bca8-f195d8e202b7	Update Frequency	Monthly	ae45fb17-e4e4-4730-a1db-563657e00e91	46eaff27-c5fe-490e-b1eb-d5305cab837c	active	\N	2014-07-02 04:50:50.631726	9999-12-31 00:00:00	t
a1d01ee5-c7a3-4a7e-9748-df0839128d0f	cc790713-4cf0-4bd4-bca8-f195d8e202b7	Geospatial Coverage	South Australia	ae45fb17-e4e4-4730-a1db-563657e00e91	a1d01ee5-c7a3-4a7e-9748-df0839128d0f	active	\N	2014-07-02 04:50:50.631726	9999-12-31 00:00:00	t
78af6c2b-d537-4e14-9bc8-5c242d79ab84	ea435574-23e6-4769-9154-956362109f7c	Data Location	Linked	56407e04-8411-401d-bac0-34b9be973540	78af6c2b-d537-4e14-9bc8-5c242d79ab84	active	\N	2014-07-02 05:00:08.363649	9999-12-31 00:00:00	t
1ec48505-62a2-4f4a-975f-3a0d6dff2d5c	ea435574-23e6-4769-9154-956362109f7c	Geospatial Coverage	South Australia	56407e04-8411-401d-bac0-34b9be973540	1ec48505-62a2-4f4a-975f-3a0d6dff2d5c	active	\N	2014-07-02 05:00:08.363649	9999-12-31 00:00:00	t
f2b49b1e-ece9-4e51-9175-e8c50b62cd40	ea435574-23e6-4769-9154-956362109f7c	Data Granularity	Data is typically updated on a catchment, basin or administrative region basis and frequency ranges from annually for high rainfall areas through to five yearly or more for arid regions. 	56407e04-8411-401d-bac0-34b9be973540	f2b49b1e-ece9-4e51-9175-e8c50b62cd40	active	\N	2014-07-02 05:00:08.363649	9999-12-31 00:00:00	t
46355b1d-10a3-4d5e-8ba7-794ecb084a91	ea435574-23e6-4769-9154-956362109f7c	Temporal Coverage	Current	56407e04-8411-401d-bac0-34b9be973540	46355b1d-10a3-4d5e-8ba7-794ecb084a91	active	\N	2014-07-02 05:00:08.363649	9999-12-31 00:00:00	t
661c19c2-78b7-44b3-ba9e-9b08aaee8c4c	ea435574-23e6-4769-9154-956362109f7c	Update Frequency	Monthly	56407e04-8411-401d-bac0-34b9be973540	661c19c2-78b7-44b3-ba9e-9b08aaee8c4c	active	\N	2014-07-02 05:00:08.363649	9999-12-31 00:00:00	t
5efe00a1-1989-4ac9-8bfb-5221aae88b06	25fe95d4-e304-4fce-92e0-f2b1ac4ae00d	Status	Redundant	c6413f5c-4a7c-4df1-a400-286e8bf49853	5efe00a1-1989-4ac9-8bfb-5221aae88b06	active	\N	2014-07-02 05:43:46.199909	9999-12-31 00:00:00	t
86f6def7-866e-4160-90a9-f8959fb991c5	40e574ec-ee9e-4a9d-8150-fcc7635e34f3	Status	Redundant	81a92d09-544a-4cee-ac0f-52682f5c0bf3	86f6def7-866e-4160-90a9-f8959fb991c5	active	\N	2014-07-02 06:06:03.865479	9999-12-31 00:00:00	t
820bc3af-3362-486c-ae23-d9d5e3f05dd1	3c7082b1-aa42-4767-bccc-5b33e3b428b3	Status	Redundant	bda9013b-6f6c-4184-b5e7-ef5a542d4611	820bc3af-3362-486c-ae23-d9d5e3f05dd1	active	\N	2014-07-02 06:15:18.45808	9999-12-31 00:00:00	t
6a46f3d7-c0e1-404c-965d-1317d200f92a	4279f483-9fcf-46a3-aaf2-b9bb7f09bf72	Status	Redundant	9d28315d-70ad-45d2-8ac2-f8cda2b2b2b9	6a46f3d7-c0e1-404c-965d-1317d200f92a	active	\N	2014-07-02 06:22:54.068964	9999-12-31 00:00:00	t
72254bce-fcfe-4653-8fb2-add1d657a32e	c4cf212a-bfa8-475c-b400-32f13094f769	Geospatial Coverage	South Australia	adc5f6ce-d122-4420-96ad-42842f27548a	72254bce-fcfe-4653-8fb2-add1d657a32e	active	\N	2014-07-02 23:58:35.052739	9999-12-31 00:00:00	t
0f71a1e1-91ad-47e2-8100-d246c2bd6078	c4cf212a-bfa8-475c-b400-32f13094f769	Update Frequency	Annually	adc5f6ce-d122-4420-96ad-42842f27548a	0f71a1e1-91ad-47e2-8100-d246c2bd6078	active	\N	2014-07-02 23:58:35.052739	9999-12-31 00:00:00	t
daeb09ce-0a24-4b37-957f-b4f925478136	c4cf212a-bfa8-475c-b400-32f13094f769	Temporal Coverage	2008-09 to 2012-13	adc5f6ce-d122-4420-96ad-42842f27548a	daeb09ce-0a24-4b37-957f-b4f925478136	active	\N	2014-07-02 23:58:35.052739	9999-12-31 00:00:00	t
e419fe7b-5599-49b5-ad04-19f34805eed4	c4cf212a-bfa8-475c-b400-32f13094f769	Data Granularity	N/A	adc5f6ce-d122-4420-96ad-42842f27548a	e419fe7b-5599-49b5-ad04-19f34805eed4	active	\N	2014-07-02 23:58:35.052739	9999-12-31 00:00:00	t
03820e81-b486-42c9-8bad-3e4da3c06e1a	c4cf212a-bfa8-475c-b400-32f13094f769	Data Location	Hosted	adc5f6ce-d122-4420-96ad-42842f27548a	03820e81-b486-42c9-8bad-3e4da3c06e1a	active	\N	2014-07-02 23:58:35.052739	9999-12-31 00:00:00	t
b3c6bcac-6384-4a46-9ab7-9c21b440ace6	c4cf212a-bfa8-475c-b400-32f13094f769	Data Status	Inactive	adc5f6ce-d122-4420-96ad-42842f27548a	b3c6bcac-6384-4a46-9ab7-9c21b440ace6	active	a00f8e57-697e-47d0-8cfb-5eb1b9d20a2b	2014-07-02 23:58:35.052739	2014-07-03 00:10:54.070063	f
b3c6bcac-6384-4a46-9ab7-9c21b440ace6	c4cf212a-bfa8-475c-b400-32f13094f769	Data Status	Active	a00f8e57-697e-47d0-8cfb-5eb1b9d20a2b	b3c6bcac-6384-4a46-9ab7-9c21b440ace6	active	\N	2014-07-03 00:10:54.070063	9999-12-31 00:00:00	t
24305ffd-8b7f-4e1f-ab64-6d2d46750e95	d1e69047-cc62-4208-8bb8-b3a00facefc8	Geospatial Coverage	Mounty Lofty Ranges	9ec71e00-e9f9-47b5-b15a-62f0ce8292f0	24305ffd-8b7f-4e1f-ab64-6d2d46750e95	active	\N	2014-07-03 00:53:56.660846	9999-12-31 00:00:00	t
774db0cc-27a0-443f-8c15-44a733d233fc	d1e69047-cc62-4208-8bb8-b3a00facefc8	Temporal Coverage	2004	9ec71e00-e9f9-47b5-b15a-62f0ce8292f0	774db0cc-27a0-443f-8c15-44a733d233fc	active	\N	2014-07-03 00:53:56.660846	9999-12-31 00:00:00	t
0da2a6d0-9e19-458d-9bde-2e2202e0c437	d1e69047-cc62-4208-8bb8-b3a00facefc8	Data Location	Linked	9ec71e00-e9f9-47b5-b15a-62f0ce8292f0	0da2a6d0-9e19-458d-9bde-2e2202e0c437	active	\N	2014-07-03 00:53:56.660846	9999-12-31 00:00:00	t
56f1702d-fd47-4ade-8fac-4248e96df8a4	d1e69047-cc62-4208-8bb8-b3a00facefc8	Data Status	Inactive	9ec71e00-e9f9-47b5-b15a-62f0ce8292f0	56f1702d-fd47-4ade-8fac-4248e96df8a4	active	\N	2014-07-03 00:53:56.660846	9999-12-31 00:00:00	t
4f20fca7-e9b6-4043-b173-9b1d254cff7f	d1e69047-cc62-4208-8bb8-b3a00facefc8	Data Granularity	N/A	9ec71e00-e9f9-47b5-b15a-62f0ce8292f0	4f20fca7-e9b6-4043-b173-9b1d254cff7f	active	\N	2014-07-03 00:53:56.660846	9999-12-31 00:00:00	t
ba0aa116-1e95-4179-a43d-a4ad234316b8	7002bf38-6f74-4b6f-a01a-620dd065511a	Data Granularity	N/A	b662efea-244d-4a1c-9ea9-e303a5432d8b	ba0aa116-1e95-4179-a43d-a4ad234316b8	active	\N	2014-07-03 00:58:12.895022	9999-12-31 00:00:00	t
ef76f478-ee8a-4a6b-8fc0-4e27588f3dcf	7002bf38-6f74-4b6f-a01a-620dd065511a	Temporal Coverage	February 2014	b662efea-244d-4a1c-9ea9-e303a5432d8b	ef76f478-ee8a-4a6b-8fc0-4e27588f3dcf	active	\N	2014-07-03 00:58:12.895022	9999-12-31 00:00:00	t
b2e9f5ca-8a7e-4b54-b24b-f678067250f4	7002bf38-6f74-4b6f-a01a-620dd065511a	Geospatial Coverage	South Australia	b662efea-244d-4a1c-9ea9-e303a5432d8b	b2e9f5ca-8a7e-4b54-b24b-f678067250f4	active	\N	2014-07-03 00:58:12.895022	9999-12-31 00:00:00	t
93bd9b85-9595-4779-b65a-eceff01127f5	7002bf38-6f74-4b6f-a01a-620dd065511a	Data Location	Linked	b662efea-244d-4a1c-9ea9-e303a5432d8b	93bd9b85-9595-4779-b65a-eceff01127f5	active	\N	2014-07-03 00:58:12.895022	9999-12-31 00:00:00	t
97ad9690-1ba6-4766-ba0c-e3db0e0d2d3e	f846a33e-f4b7-4c77-90b9-2697e54fd2a6	Data Granularity	N/A	293fcc90-5719-46c6-b8b8-32b21443d5ef	97ad9690-1ba6-4766-ba0c-e3db0e0d2d3e	active	\N	2014-07-03 01:01:41.727578	9999-12-31 00:00:00	t
430babeb-507c-40c4-83dd-854e80d2e40f	f846a33e-f4b7-4c77-90b9-2697e54fd2a6	Temporal Coverage	February 2014	293fcc90-5719-46c6-b8b8-32b21443d5ef	430babeb-507c-40c4-83dd-854e80d2e40f	active	\N	2014-07-03 01:01:41.727578	9999-12-31 00:00:00	t
31c23326-cdf9-4341-98ca-c0cf63270bf1	f846a33e-f4b7-4c77-90b9-2697e54fd2a6	Geospatial Coverage	South Australia	293fcc90-5719-46c6-b8b8-32b21443d5ef	31c23326-cdf9-4341-98ca-c0cf63270bf1	active	\N	2014-07-03 01:01:41.727578	9999-12-31 00:00:00	t
fac3bbfb-ac23-4a46-b1a7-8bf9cd962fd1	f846a33e-f4b7-4c77-90b9-2697e54fd2a6	Data Status	Active	293fcc90-5719-46c6-b8b8-32b21443d5ef	fac3bbfb-ac23-4a46-b1a7-8bf9cd962fd1	active	\N	2014-07-03 01:01:41.727578	9999-12-31 00:00:00	t
c03cfc51-d198-446a-a3a9-93faf348016e	f846a33e-f4b7-4c77-90b9-2697e54fd2a6	Update Frequency	As Required	293fcc90-5719-46c6-b8b8-32b21443d5ef	c03cfc51-d198-446a-a3a9-93faf348016e	active	\N	2014-07-03 01:01:41.727578	9999-12-31 00:00:00	t
69b23ca9-34e3-481b-b562-9cef1619b010	f846a33e-f4b7-4c77-90b9-2697e54fd2a6	Data Location	Linked	293fcc90-5719-46c6-b8b8-32b21443d5ef	69b23ca9-34e3-481b-b562-9cef1619b010	active	\N	2014-07-03 01:01:41.727578	9999-12-31 00:00:00	t
e1ac4df3-3b35-47d7-a8cb-a4a45084c2d3	7002bf38-6f74-4b6f-a01a-620dd065511a	Update Frequency	As Required	2cda89d4-6d06-412c-8eba-0c2e11a70820	e1ac4df3-3b35-47d7-a8cb-a4a45084c2d3	active	\N	2014-07-03 01:02:46.396329	9999-12-31 00:00:00	t
3703aa95-a129-49cf-85eb-038ce066a646	d1e69047-cc62-4208-8bb8-b3a00facefc8	Update Frequency	As Required	1524a068-8109-4367-b30b-7da06333a7e3	3703aa95-a129-49cf-85eb-038ce066a646	active	\N	2014-07-03 01:05:00.437242	9999-12-31 00:00:00	t
4864133f-516e-4f5c-b5f3-a887382c9f7f	edb5fe99-63da-425c-a5db-f8f54d156f9f	Update Frequency	As Required	2ac406fa-2498-4459-9e9e-d37e6c29f712	4864133f-516e-4f5c-b5f3-a887382c9f7f	active	\N	2014-07-03 01:07:33.242094	9999-12-31 00:00:00	t
fb9604ab-58f8-4481-87e4-88d92dd4eca4	edb5fe99-63da-425c-a5db-f8f54d156f9f	Geospatial Coverage	South Australia	2ac406fa-2498-4459-9e9e-d37e6c29f712	fb9604ab-58f8-4481-87e4-88d92dd4eca4	active	\N	2014-07-03 01:07:33.242094	9999-12-31 00:00:00	t
a13d0c12-5aae-4229-bf83-13b133896c5b	edb5fe99-63da-425c-a5db-f8f54d156f9f	Data Status	Active	2ac406fa-2498-4459-9e9e-d37e6c29f712	a13d0c12-5aae-4229-bf83-13b133896c5b	active	\N	2014-07-03 01:07:33.242094	9999-12-31 00:00:00	t
c0bee2a1-e5ed-4598-89e2-32918bf2aad0	edb5fe99-63da-425c-a5db-f8f54d156f9f	Data Granularity	N/A	2ac406fa-2498-4459-9e9e-d37e6c29f712	c0bee2a1-e5ed-4598-89e2-32918bf2aad0	active	\N	2014-07-03 01:07:33.242094	9999-12-31 00:00:00	t
966b0104-055c-46ab-9022-ce016f14a7d5	edb5fe99-63da-425c-a5db-f8f54d156f9f	Data Location	Linked	2ac406fa-2498-4459-9e9e-d37e6c29f712	966b0104-055c-46ab-9022-ce016f14a7d5	active	\N	2014-07-03 01:07:33.242094	9999-12-31 00:00:00	t
f663b39f-e5c7-43dc-a0ae-edbe3a7057c3	edb5fe99-63da-425c-a5db-f8f54d156f9f	Temporal Coverage	Current	2ac406fa-2498-4459-9e9e-d37e6c29f712	f663b39f-e5c7-43dc-a0ae-edbe3a7057c3	active	\N	2014-07-03 01:07:33.242094	9999-12-31 00:00:00	t
49ce95a6-d25b-4047-8978-b76c7af51e43	d002ac71-239c-491a-97c8-6150d10dbdae	Update Frequency	Daily	ded2300b-bca3-4557-a8ab-bf636d086cd5	49ce95a6-d25b-4047-8978-b76c7af51e43	active	\N	2014-07-03 04:01:20.765092	9999-12-31 00:00:00	t
bef53659-f6bb-4c72-81ff-8918f4a68b23	d2633f93-d2e9-4d32-acb8-2c3883db8651	Data Location	Hosted	d332eb33-1f7c-4a69-8d3f-4005c8f4cdd7	bef53659-f6bb-4c72-81ff-8918f4a68b23	active	\N	2014-07-03 01:09:44.069091	9999-12-31 00:00:00	t
72becb20-cf07-4afd-ab65-459fdba22d8b	d2633f93-d2e9-4d32-acb8-2c3883db8651	Data Status	Active	d332eb33-1f7c-4a69-8d3f-4005c8f4cdd7	72becb20-cf07-4afd-ab65-459fdba22d8b	active	\N	2014-07-03 01:09:44.069091	9999-12-31 00:00:00	t
723d6827-05ee-4690-9596-85e800e4f76e	d002ac71-239c-491a-97c8-6150d10dbdae	Data update	Daily	ded2300b-bca3-4557-a8ab-bf636d086cd5	723d6827-05ee-4690-9596-85e800e4f76e	deleted	\N	2014-07-03 04:01:20.765092	9999-12-31 00:00:00	t
723d6827-05ee-4690-9596-85e800e4f76e	d002ac71-239c-491a-97c8-6150d10dbdae	Data update	Daily	c7fd4a7c-5d27-4bbe-bd09-22b9c5f5e86d	723d6827-05ee-4690-9596-85e800e4f76e	active	ded2300b-bca3-4557-a8ab-bf636d086cd5	2013-09-06 01:19:48.630434	2014-07-03 04:01:20.765092	f
a1cd0fcb-54fe-4f69-a409-98720a3364b7	d002ac71-239c-491a-97c8-6150d10dbdae	Temporal Coverage	Current	ded2300b-bca3-4557-a8ab-bf636d086cd5	a1cd0fcb-54fe-4f69-a409-98720a3364b7	active	\N	2014-07-03 04:01:20.765092	9999-12-31 00:00:00	t
ad558c95-f933-43d2-b47b-b2a0d36121b7	d002ac71-239c-491a-97c8-6150d10dbdae	Data Granularity	N/A	ded2300b-bca3-4557-a8ab-bf636d086cd5	ad558c95-f933-43d2-b47b-b2a0d36121b7	active	\N	2014-07-03 04:01:20.765092	9999-12-31 00:00:00	t
14e7c689-f561-4615-9e6b-a91b1bad745e	8c25f717-eda8-4ebc-838f-777d151ebf35	Data Location	Linked	a484f1a9-5304-4702-b420-41225eb3b660	14e7c689-f561-4615-9e6b-a91b1bad745e	active	\N	2014-07-03 01:10:21.698348	9999-12-31 00:00:00	t
187eb496-bb18-4a11-b41a-324653d1b091	8c25f717-eda8-4ebc-838f-777d151ebf35	Data Status	Inactive	a484f1a9-5304-4702-b420-41225eb3b660	187eb496-bb18-4a11-b41a-324653d1b091	active	\N	2014-07-03 01:10:21.698348	9999-12-31 00:00:00	t
edaaebb8-0af1-4bfb-b1bd-5d399ec95588	8c25f717-eda8-4ebc-838f-777d151ebf35	Temporal Coverage	July 2003	a484f1a9-5304-4702-b420-41225eb3b660	edaaebb8-0af1-4bfb-b1bd-5d399ec95588	active	\N	2014-07-03 01:10:21.698348	9999-12-31 00:00:00	t
9f5352d8-03e1-47e1-a468-dfb19c7919a3	8c25f717-eda8-4ebc-838f-777d151ebf35	Data Granularity	N/A	a484f1a9-5304-4702-b420-41225eb3b660	9f5352d8-03e1-47e1-a468-dfb19c7919a3	active	\N	2014-07-03 01:10:21.698348	9999-12-31 00:00:00	t
34850d38-58ce-4e7c-a19b-b8e3ca8f34c7	8c25f717-eda8-4ebc-838f-777d151ebf35	Geospatial Coverage	Mount Lofty Ranges	a484f1a9-5304-4702-b420-41225eb3b660	34850d38-58ce-4e7c-a19b-b8e3ca8f34c7	active	\N	2014-07-03 01:10:21.698348	9999-12-31 00:00:00	t
dec7350d-5e28-4fcd-87d2-78f5b167fc4c	8c25f717-eda8-4ebc-838f-777d151ebf35	Update Frequency	Not Required	a484f1a9-5304-4702-b420-41225eb3b660	dec7350d-5e28-4fcd-87d2-78f5b167fc4c	active	\N	2014-07-03 01:10:21.698348	9999-12-31 00:00:00	t
2fce0d2d-7f5c-46e4-8c00-31ebbafa11bf	e059ea9f-5ef6-4771-ae28-88759e0e30c6	Data Status	Active	9b4011a3-62f3-4770-a3f0-edb93f122e72	2fce0d2d-7f5c-46e4-8c00-31ebbafa11bf	active	\N	2014-07-03 01:12:31.068975	9999-12-31 00:00:00	t
1cbc3321-62d8-4fd2-ae75-9354c7c8f3b3	e059ea9f-5ef6-4771-ae28-88759e0e30c6	Geospatial Coverage	South Australia	9b4011a3-62f3-4770-a3f0-edb93f122e72	1cbc3321-62d8-4fd2-ae75-9354c7c8f3b3	active	\N	2014-07-03 01:12:31.068975	9999-12-31 00:00:00	t
61a53cf7-1409-4a27-aa4d-4cc1d0ed7cc1	e059ea9f-5ef6-4771-ae28-88759e0e30c6	Data Location	Linked	9b4011a3-62f3-4770-a3f0-edb93f122e72	61a53cf7-1409-4a27-aa4d-4cc1d0ed7cc1	active	\N	2014-07-03 01:12:31.068975	9999-12-31 00:00:00	t
5ecd2542-c4fa-4881-8f03-46f1ce347e86	e059ea9f-5ef6-4771-ae28-88759e0e30c6	Temporal Coverage	October 2012	9b4011a3-62f3-4770-a3f0-edb93f122e72	5ecd2542-c4fa-4881-8f03-46f1ce347e86	active	\N	2014-07-03 01:12:31.068975	9999-12-31 00:00:00	t
0ead6b25-2f3e-4282-b1e2-b32057d460ca	e059ea9f-5ef6-4771-ae28-88759e0e30c6	Data Granularity	N/A	9b4011a3-62f3-4770-a3f0-edb93f122e72	0ead6b25-2f3e-4282-b1e2-b32057d460ca	active	\N	2014-07-03 01:12:31.068975	9999-12-31 00:00:00	t
1d7fa6d6-2858-4804-9c02-aeac8a0d0719	e059ea9f-5ef6-4771-ae28-88759e0e30c6	Update Frequency	As Required	9b4011a3-62f3-4770-a3f0-edb93f122e72	1d7fa6d6-2858-4804-9c02-aeac8a0d0719	active	\N	2014-07-03 01:12:31.068975	9999-12-31 00:00:00	t
3620aafd-4834-4f91-9fe9-9f27a83e7017	f0122aba-c8a8-4303-bb80-c99d7f42d914	Data Status	Inactive	a0a72c6d-c2ca-4a32-a3b3-5ed75677001d	3620aafd-4834-4f91-9fe9-9f27a83e7017	active	\N	2014-07-03 01:14:25.912969	9999-12-31 00:00:00	t
a4f241cf-1926-4e17-ae8b-0a5577d4c3bf	f0122aba-c8a8-4303-bb80-c99d7f42d914	Data Location	Linked	a0a72c6d-c2ca-4a32-a3b3-5ed75677001d	a4f241cf-1926-4e17-ae8b-0a5577d4c3bf	active	\N	2014-07-03 01:14:25.912969	9999-12-31 00:00:00	t
b0712393-3891-45d4-a15d-f782b5542dc9	f0122aba-c8a8-4303-bb80-c99d7f42d914	Update Frequency	Not Required	a0a72c6d-c2ca-4a32-a3b3-5ed75677001d	b0712393-3891-45d4-a15d-f782b5542dc9	active	\N	2014-07-03 01:14:25.912969	9999-12-31 00:00:00	t
e0c22460-50ec-45e1-aa77-703df408e68e	f0122aba-c8a8-4303-bb80-c99d7f42d914	Geospatial Coverage	South Australia	a0a72c6d-c2ca-4a32-a3b3-5ed75677001d	e0c22460-50ec-45e1-aa77-703df408e68e	active	\N	2014-07-03 01:14:25.912969	9999-12-31 00:00:00	t
fa72bef3-3cad-4590-bbc7-f1deed53bd29	f0122aba-c8a8-4303-bb80-c99d7f42d914	Data Granularity	N/A	a0a72c6d-c2ca-4a32-a3b3-5ed75677001d	fa72bef3-3cad-4590-bbc7-f1deed53bd29	active	\N	2014-07-03 01:14:25.912969	9999-12-31 00:00:00	t
32ec1c5d-0a47-4b66-bba4-ef4238d1b659	f0122aba-c8a8-4303-bb80-c99d7f42d914	Temporal Coverage	Current	a0a72c6d-c2ca-4a32-a3b3-5ed75677001d	32ec1c5d-0a47-4b66-bba4-ef4238d1b659	active	\N	2014-07-03 01:14:25.912969	9999-12-31 00:00:00	t
ecb638c0-0559-4145-84d0-941ac70a2213	9dc7a10f-dc1c-46ec-ade5-f25cd630f727	Data Status	Inactive	6fd0dfd6-6f56-4f1f-a4b5-6d2e3043f406	ecb638c0-0559-4145-84d0-941ac70a2213	active	\N	2014-07-03 01:20:41.116683	9999-12-31 00:00:00	t
45cf220e-406e-4303-a110-1abbf966d3fd	9dc7a10f-dc1c-46ec-ade5-f25cd630f727	Data Location	Linked	6fd0dfd6-6f56-4f1f-a4b5-6d2e3043f406	45cf220e-406e-4303-a110-1abbf966d3fd	active	\N	2014-07-03 01:20:41.116683	9999-12-31 00:00:00	t
12e2a799-c170-4bbb-83a9-9f2fadb15337	9dc7a10f-dc1c-46ec-ade5-f25cd630f727	Update Frequency	As Required	6fd0dfd6-6f56-4f1f-a4b5-6d2e3043f406	12e2a799-c170-4bbb-83a9-9f2fadb15337	active	\N	2014-07-03 01:20:41.116683	9999-12-31 00:00:00	t
fe74756e-8d6c-4700-8480-0adb2936c5ab	9dc7a10f-dc1c-46ec-ade5-f25cd630f727	Temporal Coverage	1997	6fd0dfd6-6f56-4f1f-a4b5-6d2e3043f406	fe74756e-8d6c-4700-8480-0adb2936c5ab	active	\N	2014-07-03 01:20:41.116683	9999-12-31 00:00:00	t
cb05c3bd-cd7f-4140-913c-7c2eaa86f9f6	9dc7a10f-dc1c-46ec-ade5-f25cd630f727	Data Granularity	N/A	6fd0dfd6-6f56-4f1f-a4b5-6d2e3043f406	cb05c3bd-cd7f-4140-913c-7c2eaa86f9f6	active	\N	2014-07-03 01:20:41.116683	9999-12-31 00:00:00	t
81073298-516c-4e7c-b64c-1d92a967eaa8	9dc7a10f-dc1c-46ec-ade5-f25cd630f727	Geospatial Coverage	South Australia	6fd0dfd6-6f56-4f1f-a4b5-6d2e3043f406	81073298-516c-4e7c-b64c-1d92a967eaa8	active	\N	2014-07-03 01:20:41.116683	9999-12-31 00:00:00	t
80f3e33a-6180-4d42-a6e5-9f7fcc6a064f	b6fed61f-d91f-485e-aa8f-0748fda8265b	Data Status	Inactive	54b5f6d7-9102-4b0e-88f9-cd1ec805e356	80f3e33a-6180-4d42-a6e5-9f7fcc6a064f	active	\N	2014-07-03 01:16:10.005144	9999-12-31 00:00:00	t
65e7254c-adc4-4e7f-8125-071d7f1d43ef	b6fed61f-d91f-485e-aa8f-0748fda8265b	Update Frequency	Not Required	54b5f6d7-9102-4b0e-88f9-cd1ec805e356	65e7254c-adc4-4e7f-8125-071d7f1d43ef	active	\N	2014-07-03 01:16:10.005144	9999-12-31 00:00:00	t
34a2fd10-af26-44bf-baac-4dfa8d884153	b6fed61f-d91f-485e-aa8f-0748fda8265b	Geospatial Coverage	South Australia	54b5f6d7-9102-4b0e-88f9-cd1ec805e356	34a2fd10-af26-44bf-baac-4dfa8d884153	active	\N	2014-07-03 01:16:10.005144	9999-12-31 00:00:00	t
caaac3fc-ae3a-4ef5-afa9-2625e8f18d8f	b6fed61f-d91f-485e-aa8f-0748fda8265b	Data Granularity	N/A	54b5f6d7-9102-4b0e-88f9-cd1ec805e356	caaac3fc-ae3a-4ef5-afa9-2625e8f18d8f	active	\N	2014-07-03 01:16:10.005144	9999-12-31 00:00:00	t
3bbbb94a-64ee-444f-890a-07d4d3cbfa68	b6fed61f-d91f-485e-aa8f-0748fda8265b	Data Location	Linked	54b5f6d7-9102-4b0e-88f9-cd1ec805e356	3bbbb94a-64ee-444f-890a-07d4d3cbfa68	active	\N	2014-07-03 01:16:10.005144	9999-12-31 00:00:00	t
9207635d-3b4e-43f1-bfe4-d683a9747ac2	b6fed61f-d91f-485e-aa8f-0748fda8265b	Temporal Coverage	Current	54b5f6d7-9102-4b0e-88f9-cd1ec805e356	9207635d-3b4e-43f1-bfe4-d683a9747ac2	active	\N	2014-07-03 01:16:10.005144	9999-12-31 00:00:00	t
c416542e-f073-40eb-a55e-ed1baf0a41b8	d002ac71-239c-491a-97c8-6150d10dbdae	Geospatial Coverage	South Australia	ded2300b-bca3-4557-a8ab-bf636d086cd5	c416542e-f073-40eb-a55e-ed1baf0a41b8	active	\N	2014-07-03 04:01:20.765092	9999-12-31 00:00:00	t
ce2959ab-1dd7-4a70-848f-94e635e51c21	d002ac71-239c-491a-97c8-6150d10dbdae	Data Status	Active	ded2300b-bca3-4557-a8ab-bf636d086cd5	ce2959ab-1dd7-4a70-848f-94e635e51c21	active	\N	2014-07-03 04:01:20.765092	9999-12-31 00:00:00	t
e730c13b-835b-4255-a2ac-1bacfd19911e	b9bb9820-50ae-4dc1-8567-db873b9d6f77	Geospatial Coverage	South Australia-Victoria Border	277435cc-e58f-4506-b0b0-027d5204461a	e730c13b-835b-4255-a2ac-1bacfd19911e	active	\N	2014-07-03 01:18:56.111469	9999-12-31 00:00:00	t
04cf169d-fb2a-4918-b539-76d89713f8e5	b9bb9820-50ae-4dc1-8567-db873b9d6f77	Data Status	Inactive	277435cc-e58f-4506-b0b0-027d5204461a	04cf169d-fb2a-4918-b539-76d89713f8e5	active	\N	2014-07-03 01:18:56.111469	9999-12-31 00:00:00	t
01b85d19-6560-4a34-b8f5-9de6894f89f1	b9bb9820-50ae-4dc1-8567-db873b9d6f77	Temporal Coverage	June 1998	277435cc-e58f-4506-b0b0-027d5204461a	01b85d19-6560-4a34-b8f5-9de6894f89f1	active	\N	2014-07-03 01:18:56.111469	9999-12-31 00:00:00	t
9947307b-89cb-4884-abfe-20353b3d5665	b9bb9820-50ae-4dc1-8567-db873b9d6f77	Update Frequency	As Required	277435cc-e58f-4506-b0b0-027d5204461a	9947307b-89cb-4884-abfe-20353b3d5665	active	\N	2014-07-03 01:18:56.111469	9999-12-31 00:00:00	t
f508ace2-7f49-412a-857d-1b7a3f0fa5de	b9bb9820-50ae-4dc1-8567-db873b9d6f77	Data Granularity	N/A	277435cc-e58f-4506-b0b0-027d5204461a	f508ace2-7f49-412a-857d-1b7a3f0fa5de	active	\N	2014-07-03 01:18:56.111469	9999-12-31 00:00:00	t
81feac75-1f43-4c68-a1a0-7c2ca72b8ae6	b9bb9820-50ae-4dc1-8567-db873b9d6f77	Data Location	Linked	277435cc-e58f-4506-b0b0-027d5204461a	81feac75-1f43-4c68-a1a0-7c2ca72b8ae6	active	\N	2014-07-03 01:18:56.111469	9999-12-31 00:00:00	t
9258167e-cfe6-41d5-9cbf-4edb52d3dbed	e0e7fe1d-a42e-4492-be62-4064bde37b18	Geospatial Coverage	South Australia, River Murray	34a51e35-144e-454f-b9db-512fc27304c9	9258167e-cfe6-41d5-9cbf-4edb52d3dbed	active	\N	2014-07-03 04:02:37.455257	9999-12-31 00:00:00	t
d7c1a28d-96d9-47ff-b0de-5362f64acd19	e0e7fe1d-a42e-4492-be62-4064bde37b18	Data Granularity	N/A	34a51e35-144e-454f-b9db-512fc27304c9	d7c1a28d-96d9-47ff-b0de-5362f64acd19	active	\N	2014-07-03 04:02:37.455257	9999-12-31 00:00:00	t
dde4fb1e-1a42-4e0b-8f16-5f0683667424	e0e7fe1d-a42e-4492-be62-4064bde37b18	Data Location	Linked	34a51e35-144e-454f-b9db-512fc27304c9	dde4fb1e-1a42-4e0b-8f16-5f0683667424	active	\N	2014-07-03 04:02:37.455257	9999-12-31 00:00:00	t
5f1e6c74-ced3-48e0-a836-2465f2d23b95	e0e7fe1d-a42e-4492-be62-4064bde37b18	Data Status	Inactive	34a51e35-144e-454f-b9db-512fc27304c9	5f1e6c74-ced3-48e0-a836-2465f2d23b95	active	\N	2014-07-03 04:02:37.455257	9999-12-31 00:00:00	t
83e72501-d544-4779-8d4a-6204f85f18eb	cb33ac03-4a17-42cb-af5e-b7b35998f30b	Update Frequency	As Required	d6a936bf-ba83-4420-857e-aec56327e650	83e72501-d544-4779-8d4a-6204f85f18eb	active	\N	2014-07-03 01:23:08.490905	9999-12-31 00:00:00	t
d6e98282-6d11-4d09-8398-35b1940faf73	cb33ac03-4a17-42cb-af5e-b7b35998f30b	Data Location	Linked	d6a936bf-ba83-4420-857e-aec56327e650	d6e98282-6d11-4d09-8398-35b1940faf73	active	\N	2014-07-03 01:23:08.490905	9999-12-31 00:00:00	t
6f71ed13-b561-4fe8-9fbb-337439ac63f3	cb33ac03-4a17-42cb-af5e-b7b35998f30b	Temporal Coverage	January 1990	d6a936bf-ba83-4420-857e-aec56327e650	6f71ed13-b561-4fe8-9fbb-337439ac63f3	active	\N	2014-07-03 01:23:08.490905	9999-12-31 00:00:00	t
4c2c9bed-555f-4981-a48e-777f259dec5f	cb33ac03-4a17-42cb-af5e-b7b35998f30b	Data Status	Inactive	d6a936bf-ba83-4420-857e-aec56327e650	4c2c9bed-555f-4981-a48e-777f259dec5f	active	\N	2014-07-03 01:23:08.490905	9999-12-31 00:00:00	t
05ebb6a6-6f34-4ec4-9b65-40b0c4ed01e5	cb33ac03-4a17-42cb-af5e-b7b35998f30b	Geospatial Coverage	South Australia	d6a936bf-ba83-4420-857e-aec56327e650	05ebb6a6-6f34-4ec4-9b65-40b0c4ed01e5	active	\N	2014-07-03 01:23:08.490905	9999-12-31 00:00:00	t
cf343070-2492-4841-91cf-86a2384736fb	cb33ac03-4a17-42cb-af5e-b7b35998f30b	Data Granularity	N/A	d6a936bf-ba83-4420-857e-aec56327e650	cf343070-2492-4841-91cf-86a2384736fb	active	\N	2014-07-03 01:23:08.490905	9999-12-31 00:00:00	t
dc832ce1-e88f-4e8f-a466-714d74a7246b	e0e7fe1d-a42e-4492-be62-4064bde37b18	Update Frequency	As Required	34a51e35-144e-454f-b9db-512fc27304c9	dc832ce1-e88f-4e8f-a466-714d74a7246b	active	\N	2014-07-03 04:02:37.455257	9999-12-31 00:00:00	t
540c7098-12a6-4bdd-8e2b-49fbd8f68962	e0e7fe1d-a42e-4492-be62-4064bde37b18	Temporal Coverage	February 2003	34a51e35-144e-454f-b9db-512fc27304c9	540c7098-12a6-4bdd-8e2b-49fbd8f68962	active	\N	2014-07-03 04:02:37.455257	9999-12-31 00:00:00	t
b0b85d1b-ee7b-4c72-8bd9-3fe3b8a2fbf2	18548efb-c403-4b03-8e97-78d862a4c86b	Temporal Coverage	December 2012	bb1311e4-d166-440b-9642-874bd661ea75	b0b85d1b-ee7b-4c72-8bd9-3fe3b8a2fbf2	active	\N	2014-07-03 04:07:45.260472	9999-12-31 00:00:00	t
da9b8738-f66c-4b1e-9cd3-84fbfa31f4ee	4a8f52e9-7247-4a75-8fe6-283fc6210a0b	Data Location	Linked	67fdaf92-80ab-48e9-a640-c3d16a0745fa	da9b8738-f66c-4b1e-9cd3-84fbfa31f4ee	active	\N	2014-07-03 04:18:24.51719	9999-12-31 00:00:00	t
86508127-524e-4be7-b4de-50f65fe5d036	4a8f52e9-7247-4a75-8fe6-283fc6210a0b	Temporal Coverage	May 2014	67fdaf92-80ab-48e9-a640-c3d16a0745fa	86508127-524e-4be7-b4de-50f65fe5d036	active	\N	2014-07-03 04:18:24.51719	9999-12-31 00:00:00	t
15fd433c-44dc-46ff-8280-299993797cba	9be27502-7448-469b-b251-ac8b14c69ebb	Data Status	N/A	a2450cbf-3865-45c1-a5c9-492929580938	15fd433c-44dc-46ff-8280-299993797cba	active	\N	2014-07-03 04:19:36.402946	9999-12-31 00:00:00	t
c4bafb1c-7b03-4862-821c-bfb79179720b	9be27502-7448-469b-b251-ac8b14c69ebb	Geospatial Coverage	South Australia	a2450cbf-3865-45c1-a5c9-492929580938	c4bafb1c-7b03-4862-821c-bfb79179720b	active	\N	2014-07-03 04:19:36.402946	9999-12-31 00:00:00	t
d8b807eb-b5f5-481f-a653-7e8d8514b152	9be27502-7448-469b-b251-ac8b14c69ebb	Data Granularity	N/A	a2450cbf-3865-45c1-a5c9-492929580938	d8b807eb-b5f5-481f-a653-7e8d8514b152	active	\N	2014-07-03 04:19:36.402946	9999-12-31 00:00:00	t
986f42cb-015a-42d2-b36f-7e80e6d15ef8	9be27502-7448-469b-b251-ac8b14c69ebb	Data Location	Linked	a2450cbf-3865-45c1-a5c9-492929580938	986f42cb-015a-42d2-b36f-7e80e6d15ef8	active	\N	2014-07-03 04:19:36.402946	9999-12-31 00:00:00	t
725c9355-1c5f-4d27-9c36-e21c4e5b0750	9be27502-7448-469b-b251-ac8b14c69ebb	Temporal Coverage	December 2006	a2450cbf-3865-45c1-a5c9-492929580938	725c9355-1c5f-4d27-9c36-e21c4e5b0750	active	\N	2014-07-03 04:19:36.402946	9999-12-31 00:00:00	t
f9280859-89be-4f53-b851-5b806a30aba5	9be27502-7448-469b-b251-ac8b14c69ebb	Update Frequency	As Required	a2450cbf-3865-45c1-a5c9-492929580938	f9280859-89be-4f53-b851-5b806a30aba5	active	\N	2014-07-03 04:19:36.402946	9999-12-31 00:00:00	t
16b1b81c-698e-4bb3-9a25-40ae63f12667	77c4731e-59a3-4bce-aaa3-6141ab0ab738	Update Frequency	As Required	27362229-5786-42c2-b19a-9408181f0001	16b1b81c-698e-4bb3-9a25-40ae63f12667	active	\N	2014-07-03 04:20:59.96537	9999-12-31 00:00:00	t
4af5a72b-2520-416d-b9ae-bd7e90fe48c3	77c4731e-59a3-4bce-aaa3-6141ab0ab738	Geospatial Coverage	Mount Lofty Ranges	27362229-5786-42c2-b19a-9408181f0001	4af5a72b-2520-416d-b9ae-bd7e90fe48c3	active	\N	2014-07-03 04:20:59.96537	9999-12-31 00:00:00	t
2e5b5e93-fb0b-4453-91a3-8a800734c5a4	77c4731e-59a3-4bce-aaa3-6141ab0ab738	Temporal Coverage	July 2004	27362229-5786-42c2-b19a-9408181f0001	2e5b5e93-fb0b-4453-91a3-8a800734c5a4	active	\N	2014-07-03 04:20:59.96537	9999-12-31 00:00:00	t
42b3dc45-2377-49c2-a733-ac2e3cb16221	77c4731e-59a3-4bce-aaa3-6141ab0ab738	Data Status	Inactive	27362229-5786-42c2-b19a-9408181f0001	42b3dc45-2377-49c2-a733-ac2e3cb16221	active	\N	2014-07-03 04:20:59.96537	9999-12-31 00:00:00	t
ace0044a-a656-414b-a7f9-4f8d31674157	77c4731e-59a3-4bce-aaa3-6141ab0ab738	Data Granularity	N/A	27362229-5786-42c2-b19a-9408181f0001	ace0044a-a656-414b-a7f9-4f8d31674157	active	\N	2014-07-03 04:20:59.96537	9999-12-31 00:00:00	t
1ec89486-77da-424a-8f3f-27ff700a96e5	77c4731e-59a3-4bce-aaa3-6141ab0ab738	Data Location	Linked	27362229-5786-42c2-b19a-9408181f0001	1ec89486-77da-424a-8f3f-27ff700a96e5	active	\N	2014-07-03 04:20:59.96537	9999-12-31 00:00:00	t
fde46664-df94-4a77-9626-7cf1f2cdfc31	ed440a90-e96f-49d2-914d-c15ea8a96f89	Status	Redundant	3e6ba8d6-fa97-482d-8062-b179718135f5	fde46664-df94-4a77-9626-7cf1f2cdfc31	active	\N	2014-07-03 06:07:16.330166	9999-12-31 00:00:00	t
be107106-3cab-4700-b94d-ced9580338a2	90f97270-56ed-4ce8-ab7a-4f34c938a63c	Status	Redundant	ccaefb65-d1af-4831-8f1b-1a7623613072	be107106-3cab-4700-b94d-ced9580338a2	active	\N	2014-07-03 06:07:56.784149	9999-12-31 00:00:00	t
12205d27-40fc-4ead-ab3d-002dc6c9b7ee	d03c34e0-ddc4-4677-98dd-3a5960b6631d	Status	Redundant	111ed80d-97f0-46db-846a-384f24eea287	12205d27-40fc-4ead-ab3d-002dc6c9b7ee	active	\N	2014-07-03 06:08:47.27986	9999-12-31 00:00:00	t
749cd91d-a9e2-4a3b-9a6f-c935f97152f9	3753bdf8-6c4d-4810-8b7f-c17452b9811b	Status	Redundant	cbfb8da9-e564-4f79-a62a-fb22c7bf1689	749cd91d-a9e2-4a3b-9a6f-c935f97152f9	active	\N	2014-07-03 06:09:36.408457	9999-12-31 00:00:00	t
09fee36c-c903-4a3f-9e51-0597bd8b5782	847dfdea-cf54-4597-831f-0e95e59f3fc3	Status	Redundant	f003035c-540a-41e8-9c66-ef597b0ce5bb	09fee36c-c903-4a3f-9e51-0597bd8b5782	active	\N	2014-07-03 06:10:30.432556	9999-12-31 00:00:00	t
22a1e3cf-3e09-4c29-878f-528421d5a8ad	21cb4b70-c088-4e34-b3ea-b0a4ca7cc455	Status	Redundant	6ca63e16-f4f3-4002-a1e7-e357dae6178e	22a1e3cf-3e09-4c29-878f-528421d5a8ad	active	\N	2014-07-03 06:11:10.143636	9999-12-31 00:00:00	t
c525d64f-916b-4bb9-a8b3-c0bcdd536cd0	e4da9ce6-c82d-42bc-a487-88169d0fc6f6	Status	Redundant	6e010fdc-f535-479f-9409-68b543378f37	c525d64f-916b-4bb9-a8b3-c0bcdd536cd0	active	\N	2014-07-03 06:11:51.641955	9999-12-31 00:00:00	t
7b5554a7-18e0-4367-b881-a6039833a9d4	19d0992f-8554-41e7-90f2-5390b1ff720c	Status	Redundant	c1e24add-35d1-47c6-a4c0-39288bfe38b8	7b5554a7-18e0-4367-b881-a6039833a9d4	active	\N	2014-07-03 06:12:34.0987	9999-12-31 00:00:00	t
d65ba24e-363e-4043-9c60-48b936d78797	ecadbc4d-0738-43fa-a72b-4f77729451d7	Status	Redundant	6a8e483a-7165-46f5-8f2f-24c604ffe591	d65ba24e-363e-4043-9c60-48b936d78797	active	\N	2014-07-03 06:13:37.382834	9999-12-31 00:00:00	t
ca1f2810-1641-4b14-a519-ba4070b49514	e5d6588a-f163-4f6a-bc57-25e95c87b5bd	Update Frequency	Weekly, Saturday.	2a1802ad-0a07-4d9d-b21d-44dca19ee901	ca1f2810-1641-4b14-a519-ba4070b49514	active	\N	2014-07-04 04:34:36.113129	9999-12-31 00:00:00	t
18147658-01bc-42a6-85d5-340bb0c756e5	ded7c11d-2cd3-4bff-8d6f-dd850250a486	Update Frequency	Weekly, Saturday.	b9894d86-6dd2-43ec-ae4e-fc1e6b0a8d49	18147658-01bc-42a6-85d5-340bb0c756e5	active	\N	2014-07-04 04:41:15.71102	9999-12-31 00:00:00	t
526cad4c-8bc2-4553-9195-739651c49478	c507f056-f5c9-4b03-8494-0665d5bea583	Update Frequency	Weekly, Saturday.	d4ff7de9-9392-48ab-ac71-810248800934	526cad4c-8bc2-4553-9195-739651c49478	active	\N	2014-07-04 04:46:39.611822	9999-12-31 00:00:00	t
bb0fb254-c332-4196-b4e8-2af58a568ed8	5703f651-4731-4c5d-834d-2de139c3495d	Update Frequency	Weekly, Saturday.	c1b8fba2-1b2f-4e36-b367-9a60563bba1d	bb0fb254-c332-4196-b4e8-2af58a568ed8	active	\N	2014-07-04 04:52:52.387086	9999-12-31 00:00:00	t
bb334474-c363-443a-a3ea-3ece35ce7221	e4e7b7bf-232a-4193-b220-026d64dd829b	Update Frequency	Weekly, Saturday.	c8b58a56-8170-4e74-a6a7-30aab41fd5b5	bb334474-c363-443a-a3ea-3ece35ce7221	active	\N	2014-07-04 05:04:09.048262	9999-12-31 00:00:00	t
0a777b3e-cada-4d65-b640-25bc9dcc4683	c338fbca-f933-4fcd-839c-e2e7db006ea3	Temporal Coverage	From January 2013	d0ff90a7-47a9-4401-99a6-baaac4a216c9	0a777b3e-cada-4d65-b640-25bc9dcc4683	active	\N	2014-07-04 05:24:04.579475	9999-12-31 00:00:00	t
a91411ee-af76-4a1a-a734-4676f8ea4fe3	c338fbca-f933-4fcd-839c-e2e7db006ea3	Update Frequency	Weekly, Saturday.	d0ff90a7-47a9-4401-99a6-baaac4a216c9	a91411ee-af76-4a1a-a734-4676f8ea4fe3	active	\N	2014-07-04 05:24:04.579475	9999-12-31 00:00:00	t
60dfbfbc-7b70-417e-8067-6feefa79a4f1	c338fbca-f933-4fcd-839c-e2e7db006ea3	Data Granularity	Weekly by Route, Trip, and Stop	d0ff90a7-47a9-4401-99a6-baaac4a216c9	60dfbfbc-7b70-417e-8067-6feefa79a4f1	active	\N	2014-07-04 05:24:04.579475	9999-12-31 00:00:00	t
07509a59-05f5-44e0-9ff5-28b5fbce25eb	c338fbca-f933-4fcd-839c-e2e7db006ea3	Geospatial Coverage	Adelaide Metropolitan Area [Lat: -34.3862 to -35.3655, Lon: 138.4126 to 139.1089]	d0ff90a7-47a9-4401-99a6-baaac4a216c9	07509a59-05f5-44e0-9ff5-28b5fbce25eb	active	\N	2014-07-04 05:24:04.579475	9999-12-31 00:00:00	t
75cbd6b1-a552-4618-b8b7-d2aa70461fd5	2d972378-33e0-4be3-a412-c65a02fccb25	Update Frequency	Weekly, Saturday.	2a484a47-252e-40ba-977f-efc2504ba638	75cbd6b1-a552-4618-b8b7-d2aa70461fd5	active	\N	2014-07-04 05:27:55.983238	9999-12-31 00:00:00	t
5d5ff745-58ea-4c9d-a030-673ca7cdc2f4	8c04fe5a-a624-467b-b5b8-61337c1870ec	Update Frequency	Weekly, Saturday.	3fe23bc1-79a9-41cc-b8f4-ccec61793dc5	5d5ff745-58ea-4c9d-a030-673ca7cdc2f4	active	\N	2014-07-04 05:54:22.334433	9999-12-31 00:00:00	t
87bfc8b1-3dad-44f5-9b5c-ced6dbe9a9f1	0384a465-903c-4b2b-93ec-826acbe2c66b	Temporal Coverage	1914-1916	1d677883-3501-4731-8364-91f45344802a	87bfc8b1-3dad-44f5-9b5c-ced6dbe9a9f1	active	\N	2014-07-07 03:42:50.214516	9999-12-31 00:00:00	t
e5e8df4f-0c42-4304-97be-c70fe05499c2	0384a465-903c-4b2b-93ec-826acbe2c66b	Update Frequency	Created 2013, not updated	1d677883-3501-4731-8364-91f45344802a	e5e8df4f-0c42-4304-97be-c70fe05499c2	active	\N	2014-07-07 03:42:50.214516	9999-12-31 00:00:00	t
fd0526a8-11ef-46a0-bcce-e7d52c91a86d	0384a465-903c-4b2b-93ec-826acbe2c66b	Geospatial Coverage	Adelaide	1d677883-3501-4731-8364-91f45344802a	fd0526a8-11ef-46a0-bcce-e7d52c91a86d	active	\N	2014-07-07 03:42:50.214516	9999-12-31 00:00:00	t
4accb028-565c-4428-a01b-b0c4a17fd636	fc9ff9ba-015f-45a0-8503-9355c1fb9c5c	Update Frequency	As Required	f3cc4a6f-32b8-4123-9960-151087eb5f2a	4accb028-565c-4428-a01b-b0c4a17fd636	active	\N	2014-07-07 04:31:54.181034	9999-12-31 00:00:00	t
749bbff8-a28f-4a67-984e-d7450cc0300b	fc9ff9ba-015f-45a0-8503-9355c1fb9c5c	Geospatial Coverage	South Australian	f3cc4a6f-32b8-4123-9960-151087eb5f2a	749bbff8-a28f-4a67-984e-d7450cc0300b	active	\N	2014-07-07 04:31:54.181034	9999-12-31 00:00:00	t
ed5b483e-bc49-4db4-87bb-d00a872df9f6	fc9ff9ba-015f-45a0-8503-9355c1fb9c5c	Temporal Coverage	2011 - Current	f3cc4a6f-32b8-4123-9960-151087eb5f2a	ed5b483e-bc49-4db4-87bb-d00a872df9f6	active	\N	2014-07-07 04:31:54.181034	9999-12-31 00:00:00	t
301513d3-9d05-48ad-84d3-75640341c4d9	77afe596-b5bb-4a7a-a8f3-f56848b975a8	Status	Redundant	9c9fa55c-b211-4773-96ae-871e906d61e4	301513d3-9d05-48ad-84d3-75640341c4d9	active	\N	2014-07-08 01:33:17.186411	9999-12-31 00:00:00	t
26086115-4ab1-4631-aa2e-667eed5dcb07	5a0381b3-1923-4ad3-b76b-c90e19fa2762	Status	Redundant	74b7342c-96cd-4d99-899a-4c357c1bad86	26086115-4ab1-4631-aa2e-667eed5dcb07	active	\N	2014-07-08 01:34:03.782698	9999-12-31 00:00:00	t
aa45e0f8-b63d-4ee3-a151-06c486e5f896	68ce0023-5542-425c-a35a-870854781259	Geographical Coverage	Metropolitan Adelaide	8c7fcca4-6431-40f3-ba97-a0d886ced158	aa45e0f8-b63d-4ee3-a151-06c486e5f896	active	\N	2014-07-08 02:36:49.872989	9999-12-31 00:00:00	t
445ecffa-bae4-4464-a660-fe36507cbdc1	68ce0023-5542-425c-a35a-870854781259	Update Frequency	Refreshed weekly but dataset updated on an "as required basis".	8c7fcca4-6431-40f3-ba97-a0d886ced158	445ecffa-bae4-4464-a660-fe36507cbdc1	active	\N	2014-07-08 02:36:49.872989	9999-12-31 00:00:00	t
f938f059-a621-49dd-8161-c232e836682b	68ce0023-5542-425c-a35a-870854781259	Temporal Coverage	Current	8c7fcca4-6431-40f3-ba97-a0d886ced158	f938f059-a621-49dd-8161-c232e836682b	active	\N	2014-07-08 02:36:49.872989	9999-12-31 00:00:00	t
c9174829-bdaf-45ba-b6a1-6650b5425aec	35052751-5f7a-4c7d-a517-716ea5a3e865	Update Frequency	Refreshed on a weekly basis however the data as such is only updated on an “as required” basis.	0e70d7e6-0137-40ba-9004-ffe93989ab5e	c9174829-bdaf-45ba-b6a1-6650b5425aec	active	\N	2014-07-08 02:37:53.883903	9999-12-31 00:00:00	t
deb40ae0-77d7-4cb7-bb89-f356d584c78c	35052751-5f7a-4c7d-a517-716ea5a3e865	Temporal Coverage	Current	0e70d7e6-0137-40ba-9004-ffe93989ab5e	deb40ae0-77d7-4cb7-bb89-f356d584c78c	active	\N	2014-07-08 02:37:53.883903	9999-12-31 00:00:00	t
60b396fc-c466-4aed-8f38-93ca8e2339bf	c5e11fec-50a5-483f-a5fa-9087985c3cfb	Geospatial Coverage	Adelaide Metropolitan area and part of the Adelaide Hills up through Clare and towards the Flinders ranges to Blinman.	fd4a026b-8635-4b59-ac27-60c9345c5d5f	60b396fc-c466-4aed-8f38-93ca8e2339bf	active	\N	2014-07-08 02:39:09.220242	9999-12-31 00:00:00	t
8d7ad463-8a69-49bf-b918-e65a0882fc69	c5e11fec-50a5-483f-a5fa-9087985c3cfb	Temporal Coverage	Current	fd4a026b-8635-4b59-ac27-60c9345c5d5f	8d7ad463-8a69-49bf-b918-e65a0882fc69	active	\N	2014-07-08 02:39:09.220242	9999-12-31 00:00:00	t
c6578661-c047-40cf-95e2-de1f28edb73d	c5e11fec-50a5-483f-a5fa-9087985c3cfb	Update Frequency	Refreshed on a weekly basis however the data as such is only updated on an “as required” basis.	fd4a026b-8635-4b59-ac27-60c9345c5d5f	c6578661-c047-40cf-95e2-de1f28edb73d	active	\N	2014-07-08 02:39:09.220242	9999-12-31 00:00:00	t
2db07461-f25b-4d4d-a6c5-ee8998971898	35052751-5f7a-4c7d-a517-716ea5a3e865	Geospatial Coverage	Statewide	75e01c3a-2c7e-4641-810b-f7d4b6c1329d	2db07461-f25b-4d4d-a6c5-ee8998971898	active	\N	2014-07-08 02:40:07.670925	9999-12-31 00:00:00	t
e801d962-4d76-4cbf-80b9-a8be47b4eea0	35052751-5f7a-4c7d-a517-716ea5a3e865	Geographical Coverage	Statewide	75e01c3a-2c7e-4641-810b-f7d4b6c1329d	e801d962-4d76-4cbf-80b9-a8be47b4eea0	deleted	\N	2014-07-08 02:40:07.670925	9999-12-31 00:00:00	t
e801d962-4d76-4cbf-80b9-a8be47b4eea0	35052751-5f7a-4c7d-a517-716ea5a3e865	Geographical Coverage	Statewide	0e70d7e6-0137-40ba-9004-ffe93989ab5e	e801d962-4d76-4cbf-80b9-a8be47b4eea0	active	75e01c3a-2c7e-4641-810b-f7d4b6c1329d	2014-07-08 02:37:53.883903	2014-07-08 02:40:07.670925	f
084d9bbf-d216-4af7-b7a5-e4fc940a055a	6f1f602b-1e1f-4158-8445-56dd34d2914e	Geospatial Coverage	Statewide	5e444307-59e5-4b85-82dc-882e628a3915	084d9bbf-d216-4af7-b7a5-e4fc940a055a	active	\N	2014-07-08 02:41:51.95091	9999-12-31 00:00:00	t
b1da3572-aaa1-4773-9966-658fcd9166cb	6f1f602b-1e1f-4158-8445-56dd34d2914e	Temporal Coverage	Current	5e444307-59e5-4b85-82dc-882e628a3915	b1da3572-aaa1-4773-9966-658fcd9166cb	active	\N	2014-07-08 02:41:51.95091	9999-12-31 00:00:00	t
57fdd667-f968-4f7b-9589-4aab58cd67ee	6f1f602b-1e1f-4158-8445-56dd34d2914e	Update Frequency	Every 4 years	8d8dda8f-160c-44cc-8e8a-26222e270aaa	57fdd667-f968-4f7b-9589-4aab58cd67ee	active	\N	2014-07-08 02:48:30.105056	9999-12-31 00:00:00	t
57fdd667-f968-4f7b-9589-4aab58cd67ee	6f1f602b-1e1f-4158-8445-56dd34d2914e	Update Frequency	Refreshed on a weekly basis however the data as such is only updated on an “as required” basis	5e444307-59e5-4b85-82dc-882e628a3915	57fdd667-f968-4f7b-9589-4aab58cd67ee	active	8d8dda8f-160c-44cc-8e8a-26222e270aaa	2014-07-08 02:41:51.95091	2014-07-08 02:48:30.105056	f
bed8e3a5-5fac-44f7-8b22-f8a5d00ac5a7	a48c54cf-f276-409b-b934-faeba4a85278	Geospatial Coverage	South Australia	c934d346-d00f-4177-b1f2-3a01f6398650	bed8e3a5-5fac-44f7-8b22-f8a5d00ac5a7	active	\N	2014-07-08 04:53:49.63632	9999-12-31 00:00:00	t
fba9f431-a575-4cf3-94bd-cfaf7254dbfb	a48c54cf-f276-409b-b934-faeba4a85278	Data Granularity	Individual Hospital	c934d346-d00f-4177-b1f2-3a01f6398650	fba9f431-a575-4cf3-94bd-cfaf7254dbfb	active	\N	2014-07-08 04:53:49.63632	9999-12-31 00:00:00	t
9a193636-a98e-425d-80e1-6296470d4c5a	a48c54cf-f276-409b-b934-faeba4a85278	Temporal Coverage	2013	c934d346-d00f-4177-b1f2-3a01f6398650	9a193636-a98e-425d-80e1-6296470d4c5a	active	\N	2014-07-08 04:53:49.63632	9999-12-31 00:00:00	t
12888a25-01cf-450f-bfd3-487d8376cdba	a48c54cf-f276-409b-b934-faeba4a85278	Update Frequency	Annually	c934d346-d00f-4177-b1f2-3a01f6398650	12888a25-01cf-450f-bfd3-487d8376cdba	active	\N	2014-07-08 04:53:49.63632	9999-12-31 00:00:00	t
0fb86969-f314-484d-86ab-0fee887caf6b	5c54b043-3788-4ecb-bb74-7a46110266ad	Update Frequency	Annually	67ccf2da-d97f-40e5-88ae-6d5ac451c49d	0fb86969-f314-484d-86ab-0fee887caf6b	active	\N	2014-07-08 05:16:44.443743	9999-12-31 00:00:00	t
69806f06-6426-48d9-af5a-a82ce0f49111	5c54b043-3788-4ecb-bb74-7a46110266ad	Temporal Coverage	2013	67ccf2da-d97f-40e5-88ae-6d5ac451c49d	69806f06-6426-48d9-af5a-a82ce0f49111	active	\N	2014-07-08 05:16:44.443743	9999-12-31 00:00:00	t
cbe4f87d-b782-49fd-82ff-5bc519cd57ba	5c54b043-3788-4ecb-bb74-7a46110266ad	Data Granularity	Individual Hospital	67ccf2da-d97f-40e5-88ae-6d5ac451c49d	cbe4f87d-b782-49fd-82ff-5bc519cd57ba	active	\N	2014-07-08 05:16:44.443743	9999-12-31 00:00:00	t
41bf31a1-c8a7-40f2-945e-1432716ef697	fdc08250-d282-4812-8c4e-29d225b8cf7d	Temporal Coverage	Active	ca0c7c3e-28f0-4a02-a8b9-af2b4d7f0c84	41bf31a1-c8a7-40f2-945e-1432716ef697	active	\N	2014-07-09 07:18:32.471395	9999-12-31 00:00:00	t
679452bc-3b00-49c4-a71e-356c698b2840	fdc08250-d282-4812-8c4e-29d225b8cf7d	Update Frequency	Hourly at half past the hour.	ca0c7c3e-28f0-4a02-a8b9-af2b4d7f0c84	679452bc-3b00-49c4-a71e-356c698b2840	active	\N	2014-07-09 07:18:32.471395	9999-12-31 00:00:00	t
ab746cfd-062d-44e7-b9ee-1bfc155b6180	fdc08250-d282-4812-8c4e-29d225b8cf7d	Geospatial Coverage	South Australia	ca0c7c3e-28f0-4a02-a8b9-af2b4d7f0c84	ab746cfd-062d-44e7-b9ee-1bfc155b6180	active	\N	2014-07-09 07:18:32.471395	9999-12-31 00:00:00	t
181eb67b-cbf4-454c-9198-a0a198ef0be5	fdc08250-d282-4812-8c4e-29d225b8cf7d	Data Granularity	1 hour averaged data for Ozone, Nitrogen dioxide and Sulfur dioxide, 8 hour averaged data for Carbon monoxide and 24 hour averaged data for PM10 and PM2.5.	ca0c7c3e-28f0-4a02-a8b9-af2b4d7f0c84	181eb67b-cbf4-454c-9198-a0a198ef0be5	active	\N	2014-07-09 07:18:32.471395	9999-12-31 00:00:00	t
b3eb87c4-d958-4a03-ab58-a363e096df26	f0bad1bc-2e94-4957-a52a-e2c58e3ebc79	Temporal Coverage	Current	ac99f7a6-7ef3-4113-9253-55d6e77f27c6	b3eb87c4-d958-4a03-ab58-a363e096df26	active	\N	2014-07-09 07:27:36.440664	9999-12-31 00:00:00	t
151c1ccd-ea00-4ffa-b6ce-96b98098dd9b	f0bad1bc-2e94-4957-a52a-e2c58e3ebc79	Geospatial Coverage	South Australia	ac99f7a6-7ef3-4113-9253-55d6e77f27c6	151c1ccd-ea00-4ffa-b6ce-96b98098dd9b	active	\N	2014-07-09 07:27:36.440664	9999-12-31 00:00:00	t
feabcb24-afbd-47db-8d13-66493dc07d01	f0bad1bc-2e94-4957-a52a-e2c58e3ebc79	Update Frequency	Refreshed on a weekly basis, data content is updated when required	ac99f7a6-7ef3-4113-9253-55d6e77f27c6	feabcb24-afbd-47db-8d13-66493dc07d01	active	\N	2014-07-09 07:27:36.440664	9999-12-31 00:00:00	t
55b4b4be-366d-428a-b703-d8b684e451b8	6a3284d3-d2a2-4cb6-bddf-5a31d622f4d8	Update Frequency	Students and Course and the Student Outcomes Survey are updated annually; Apprentices and Trainees is updated quarterly.	9a032322-5a53-4164-9084-4ba9cbe8d59c	55b4b4be-366d-428a-b703-d8b684e451b8	active	\N	2014-07-10 02:33:21.981326	9999-12-31 00:00:00	t
63e395f7-0214-450c-9d9e-177d968e8a05	6a3284d3-d2a2-4cb6-bddf-5a31d622f4d8	Temporal Coverage	Up to 10 years time series is available from the website.	9a032322-5a53-4164-9084-4ba9cbe8d59c	63e395f7-0214-450c-9d9e-177d968e8a05	active	\N	2014-07-10 02:33:21.981326	9999-12-31 00:00:00	t
55f596be-ecd1-4527-ac43-b5fb5840aebb	6a3284d3-d2a2-4cb6-bddf-5a31d622f4d8	Geospatial Coverage	Australia, State and Territories	9a032322-5a53-4164-9084-4ba9cbe8d59c	55f596be-ecd1-4527-ac43-b5fb5840aebb	active	\N	2014-07-10 02:33:21.981326	9999-12-31 00:00:00	t
7b7ed747-9f87-465d-851a-6528b97bcec9	f8647df4-617b-439c-8de2-6aadfc84826a	Update Frequency	Quarterly	ca8f9c74-0d1d-494f-a5da-c2a665f6db9e	7b7ed747-9f87-465d-851a-6528b97bcec9	active	\N	2014-07-10 06:07:01.607508	9999-12-31 00:00:00	t
5c229775-0a8f-4f57-9921-4f49b31ddbc0	f8647df4-617b-439c-8de2-6aadfc84826a	Geospatial Coverage	South Australia	ca8f9c74-0d1d-494f-a5da-c2a665f6db9e	5c229775-0a8f-4f57-9921-4f49b31ddbc0	active	\N	2014-07-10 06:07:01.607508	9999-12-31 00:00:00	t
9140c6f5-9c1e-436a-a76a-0fb66a143176	f8647df4-617b-439c-8de2-6aadfc84826a	Temporal Coverage	1/7/2013 – 30/6/2014	ca8f9c74-0d1d-494f-a5da-c2a665f6db9e	9140c6f5-9c1e-436a-a76a-0fb66a143176	active	\N	2014-07-10 06:07:01.607508	9999-12-31 00:00:00	t
a752d226-c1d9-47fe-a949-92d67a175c16	d1e68d18-e819-4408-a4e2-808137a24459	Data Status	Inactive	568a454f-af40-418b-8638-ec01e58b7e82	a752d226-c1d9-47fe-a949-92d67a175c16	active	\N	2014-09-15 01:19:17.608747	9999-12-31 00:00:00	t
08d50b34-b842-4661-92e0-35bb9b3fa0a4	8c101ee9-db55-435a-99d1-defe180c0363	Update Frequency	5 years	1bb667dc-cc6b-4108-8821-0159ead5989a	08d50b34-b842-4661-92e0-35bb9b3fa0a4	active	\N	2014-09-17 01:38:10.831772	9999-12-31 00:00:00	t
85c6fdef-298e-40dd-acda-966eb0152207	cc2dafe2-e319-4a33-a394-7b6ffceadca5	Update Frequency	5 years	cdf4db35-8df1-46a6-aeb1-4f9ae8ba9f6b	85c6fdef-298e-40dd-acda-966eb0152207	active	\N	2014-09-17 01:39:05.308175	9999-12-31 00:00:00	t
a19805e3-80a7-4eba-bb34-a72377fdc2d8	2c238c6a-f6fe-45b5-87be-29d0db657b67	Update Frequency	5 years	0fc618c8-e283-44a6-b9b5-d12ce2ffb3b1	a19805e3-80a7-4eba-bb34-a72377fdc2d8	active	\N	2014-09-17 01:39:31.954376	9999-12-31 00:00:00	t
c2529895-2091-4647-871c-65333e9dfe97	6ed90b78-50c8-4951-9612-b118277f34e2	Update Frequency	5 years	127f98fc-1088-4991-b312-15a124a72fbc	c2529895-2091-4647-871c-65333e9dfe97	active	\N	2014-09-17 01:40:27.136978	9999-12-31 00:00:00	t
6b8207bf-8c8f-455b-8480-6db64beae231	caf25c84-f573-4ed6-9a59-5e011f97f885	Update Frequency	5 years	dfc3f63b-cc4b-46af-817d-1dbba2767ad1	6b8207bf-8c8f-455b-8480-6db64beae231	active	\N	2014-09-17 01:41:06.311288	9999-12-31 00:00:00	t
a7d06226-f0f8-4987-9594-2824679866f9	6a6e67cd-9ade-41d1-8f40-27d0f44f1f5f	Update Frequency	5 years	045b009c-2d9c-471c-b794-1c97b03803a9	a7d06226-f0f8-4987-9594-2824679866f9	active	\N	2014-09-17 01:41:36.868135	9999-12-31 00:00:00	t
db515af6-e259-4d9e-891d-23e18043b61e	4b364e51-cf83-45cc-8909-e0968b6ca0ed	Update Frequency	5 years	bf42a6a5-1fd9-45c0-8afd-428323fc67a6	db515af6-e259-4d9e-891d-23e18043b61e	active	\N	2014-09-17 01:42:01.744434	9999-12-31 00:00:00	t
da3dd0c3-70ef-4fea-9942-885e0f6e623e	fd503e5e-c3c3-402e-8afa-549354c2355c	Update Frequency	5 years	5a8732c1-3884-4b0b-843c-41859d8bd5f8	da3dd0c3-70ef-4fea-9942-885e0f6e623e	active	\N	2014-09-17 01:42:39.459012	9999-12-31 00:00:00	t
5a078a2d-c0bb-46ca-9a8b-28417a02882d	5e761b85-9dd8-4a4e-a3f8-820997b86233	Update Frequency	5 years	3fd31ae5-40ad-47b8-ab4a-c50ec1ee0576	5a078a2d-c0bb-46ca-9a8b-28417a02882d	active	\N	2014-09-17 01:43:15.354785	9999-12-31 00:00:00	t
71a7632d-480d-42e1-8a87-3dc39a8c4e34	49569a77-7c73-4466-a067-24080703c327	Update Frequency	5 years	52eecc30-7c8d-4110-81cd-70cc90ccb7bc	71a7632d-480d-42e1-8a87-3dc39a8c4e34	active	\N	2014-09-17 01:43:42.489716	9999-12-31 00:00:00	t
dcd1ad98-5c35-41cb-9f01-7bb339859b7f	778b9f71-5e1b-4e1c-86a2-6360ab9b0662	Update Frequency	5 years	95eb1a11-0907-4c3f-b47f-d073866c36f5	dcd1ad98-5c35-41cb-9f01-7bb339859b7f	active	\N	2014-09-17 01:44:14.771456	9999-12-31 00:00:00	t
3c027725-ef86-49a9-9e18-97d7cec906d9	8ca998f8-9d6d-4655-af14-51f2e3b33b95	Update Frequency	5 years	00dd4a47-4957-46f5-83ee-bb1cd5a1e799	3c027725-ef86-49a9-9e18-97d7cec906d9	active	\N	2014-09-17 01:44:42.934994	9999-12-31 00:00:00	t
c55afefb-fae2-4727-bcdc-30860f0a1bee	932545a4-49d6-44d1-a44f-893aaa2264e2	Update Frequency	5 years	44ccffd2-2afd-4201-8fd0-eff159d5c531	c55afefb-fae2-4727-bcdc-30860f0a1bee	active	\N	2014-09-17 01:45:35.488942	9999-12-31 00:00:00	t
df184012-c0e2-4ae0-971f-e044fedd593c	fe77c7df-52f9-415e-b0be-df0f8813c924	Update Frequency	5 years	8dc424e9-19d2-456c-9ef6-0ce9d327158c	df184012-c0e2-4ae0-971f-e044fedd593c	active	\N	2014-09-17 01:46:01.997467	9999-12-31 00:00:00	t
b0d16a95-f8e7-4dbe-b35b-68e3b17a3608	4e191c1e-b971-441f-83f7-45e266c41b99	Update frequency	As required	85740ec3-4126-4064-beb8-89c9a56bfaf5	b0d16a95-f8e7-4dbe-b35b-68e3b17a3608	active	\N	2014-09-17 02:59:14.225553	9999-12-31 00:00:00	t
00a28c1f-33b6-45a7-9603-7a0caa8a5d15	4e191c1e-b971-441f-83f7-45e266c41b99	Data updated	Dynamic	85740ec3-4126-4064-beb8-89c9a56bfaf5	00a28c1f-33b6-45a7-9603-7a0caa8a5d15	active	\N	2014-09-17 02:59:14.225553	9999-12-31 00:00:00	t
00a28c1f-33b6-45a7-9603-7a0caa8a5d15	4e191c1e-b971-441f-83f7-45e266c41b99	Data updated		0acd6637-7ab9-4dbb-8792-eec19d80c236	00a28c1f-33b6-45a7-9603-7a0caa8a5d15	active	85740ec3-4126-4064-beb8-89c9a56bfaf5	2013-09-03 00:59:25.473654	2014-09-17 02:59:14.225553	f
4bc80ef6-8af1-445a-ba12-a707f2e42f7e	ae85c76c-1267-4856-89de-1074e16e1908	Update Frequency	Monthly	bc8383f8-d586-45b1-9796-d44523b77e90	4bc80ef6-8af1-445a-ba12-a707f2e42f7e	active	\N	2014-11-03 23:11:59.827373	9999-12-31 00:00:00	t
f54363e4-7e64-44ed-857e-4cdc5aadada3	ae85c76c-1267-4856-89de-1074e16e1908	Temporal Coverage	Current	bc8383f8-d586-45b1-9796-d44523b77e90	f54363e4-7e64-44ed-857e-4cdc5aadada3	active	\N	2014-11-03 23:11:59.827373	9999-12-31 00:00:00	t
cadd6f8e-bf49-4d10-b186-b2e0487b7e2e	b95caeb1-9390-4228-9a93-69a04d25291a	Temporal Coverage		712bea56-e170-4ae2-b928-8d6bc3ca3fd0	cadd6f8e-bf49-4d10-b186-b2e0487b7e2e	active	\N	2014-11-04 00:50:33.539703	9999-12-31 00:00:00	t
1ca0ca56-4ff9-4344-9267-65a610a1ce42	b95caeb1-9390-4228-9a93-69a04d25291a	Update Frequency		712bea56-e170-4ae2-b928-8d6bc3ca3fd0	1ca0ca56-4ff9-4344-9267-65a610a1ce42	active	\N	2014-11-04 00:50:33.539703	9999-12-31 00:00:00	t
d71716f5-e25e-444e-8276-daf7a2b5e8c1	afb79702-215f-4d35-85bf-47f5e57f6cc9	Update Frequency	Annual	8d99cdee-5488-4d43-9e52-d72e7f0f01db	d71716f5-e25e-444e-8276-daf7a2b5e8c1	active	\N	2014-11-04 05:40:47.02473	9999-12-31 00:00:00	t
6ad56eec-2990-4e30-82fd-bfab3960cda4	2769db93-ebed-418e-9647-db24ef6bf066	Update Frequency	test	a5dd4a33-8383-4132-990c-22aa02ec81ed	6ad56eec-2990-4e30-82fd-bfab3960cda4	active	\N	2014-11-04 05:46:00.907644	9999-12-31 00:00:00	t
99266998-3eb4-4b87-9553-b3aeb57a2842	759fc12c-0a5d-41c4-8cb1-fdcd2e5f3523	Update Frequency	Annual	a383b7ab-4744-4a0d-a9b9-16ccffc3b8bb	99266998-3eb4-4b87-9553-b3aeb57a2842	active	\N	2014-11-04 06:47:09.866218	9999-12-31 00:00:00	t
efdd557f-e923-4ad0-bd87-a8371b87fe59	41134274-fd8c-4667-a5ea-096ffc010ab4	Update Frequency	Annual	60cfe119-0a7a-491d-96d7-4d850b067a33	efdd557f-e923-4ad0-bd87-a8371b87fe59	active	\N	2014-11-04 23:20:20.479829	9999-12-31 00:00:00	t
c6b8c35c-6a61-4ca8-b8cb-afd30da2b149	9ef49326-a879-4f67-b258-5505b290c95d	Update Frequency	Monthly	116746a2-66b6-4921-80b7-661e23a84277	c6b8c35c-6a61-4ca8-b8cb-afd30da2b149	active	\N	2014-11-10 05:28:24.895461	9999-12-31 00:00:00	t
8ace66aa-156e-4a1f-a512-a7b4ee880e2e	e4d36977-02fe-4f6f-98db-44cc57821523	Geographical Coverage	Statewide	4031b5bd-1130-45a9-89a3-375406aeecf7	8ace66aa-156e-4a1f-a512-a7b4ee880e2e	active	\N	2014-11-11 00:02:59.735979	9999-12-31 00:00:00	t
65f5f109-9786-4e60-bcf2-919d088d4257	b667a56a-8959-41bc-a7cc-68e5bc858841	temporal_coverage_from		3671f47a-230d-4eab-859d-e4d1ffdc17e3	65f5f109-9786-4e60-bcf2-919d088d4257	active	\N	2014-11-24 00:26:26.360657	9999-12-31 00:00:00	t
bc6c8771-5621-4908-85e7-7738d2794eda	b667a56a-8959-41bc-a7cc-68e5bc858841	temporal_coverage_to		3671f47a-230d-4eab-859d-e4d1ffdc17e3	bc6c8771-5621-4908-85e7-7738d2794eda	active	\N	2014-11-24 00:26:26.360657	9999-12-31 00:00:00	t
ae2f8ead-3ede-4838-a84b-6721332a791e	b667a56a-8959-41bc-a7cc-68e5bc858841	spatial		3671f47a-230d-4eab-859d-e4d1ffdc17e3	ae2f8ead-3ede-4838-a84b-6721332a791e	active	\N	2014-11-24 00:26:26.360657	9999-12-31 00:00:00	t
8cd18464-b8aa-4c92-9acd-5395dc2751e0	b667a56a-8959-41bc-a7cc-68e5bc858841	jurisdiction	South Australia	3671f47a-230d-4eab-859d-e4d1ffdc17e3	8cd18464-b8aa-4c92-9acd-5395dc2751e0	active	\N	2014-11-24 00:26:26.360657	9999-12-31 00:00:00	t
41a52c3c-c2e0-4a31-9954-5ebc97ab7789	b667a56a-8959-41bc-a7cc-68e5bc858841	language	English	3671f47a-230d-4eab-859d-e4d1ffdc17e3	41a52c3c-c2e0-4a31-9954-5ebc97ab7789	active	\N	2014-11-24 00:26:26.360657	9999-12-31 00:00:00	t
488f1942-1980-47b5-be54-fa2ae390819c	b667a56a-8959-41bc-a7cc-68e5bc858841	update_freq	never	bc942929-3a7f-46a7-b023-ca34c703e88e	488f1942-1980-47b5-be54-fa2ae390819c	active	\N	2014-11-24 03:43:30.873418	9999-12-31 00:00:00	t
488f1942-1980-47b5-be54-fa2ae390819c	b667a56a-8959-41bc-a7cc-68e5bc858841	update_freq	daily	3671f47a-230d-4eab-859d-e4d1ffdc17e3	488f1942-1980-47b5-be54-fa2ae390819c	active	bc942929-3a7f-46a7-b023-ca34c703e88e	2014-11-24 00:26:26.360657	2014-11-24 03:43:30.873418	f
34d137d9-b72d-47fc-8c1f-cd612861be1c	b667a56a-8959-41bc-a7cc-68e5bc858841	spatial_coverage		bc942929-3a7f-46a7-b023-ca34c703e88e	34d137d9-b72d-47fc-8c1f-cd612861be1c	active	\N	2014-11-24 03:43:30.873418	9999-12-31 00:00:00	t
34d137d9-b72d-47fc-8c1f-cd612861be1c	b667a56a-8959-41bc-a7cc-68e5bc858841	spatial_coverage	South Australia	3671f47a-230d-4eab-859d-e4d1ffdc17e3	34d137d9-b72d-47fc-8c1f-cd612861be1c	active	bc942929-3a7f-46a7-b023-ca34c703e88e	2014-11-24 00:26:26.360657	2014-11-24 03:43:30.873418	f
178355bc-d849-4342-9d08-99da6e3d580e	c8f6e5e0-d7e5-462f-a5f2-0e28ba909473	language	English	52a01fb7-cfd8-45d0-95eb-a383844dd816	178355bc-d849-4342-9d08-99da6e3d580e	active	\N	2014-11-24 04:36:10.671992	9999-12-31 00:00:00	t
faf4f55a-c6d7-4dcf-ac83-edc3468dbe11	c8f6e5e0-d7e5-462f-a5f2-0e28ba909473	spatial_coverage	South Australia	52a01fb7-cfd8-45d0-95eb-a383844dd816	faf4f55a-c6d7-4dcf-ac83-edc3468dbe11	active	\N	2014-11-24 04:36:10.671992	9999-12-31 00:00:00	t
0294efa1-0b3b-4178-ae44-8f4c94c19bf1	c8f6e5e0-d7e5-462f-a5f2-0e28ba909473	temporal_coverage_to		52a01fb7-cfd8-45d0-95eb-a383844dd816	0294efa1-0b3b-4178-ae44-8f4c94c19bf1	active	\N	2014-11-24 04:36:10.671992	9999-12-31 00:00:00	t
190a4f9f-5935-4182-bee7-2b6b512f05af	c8f6e5e0-d7e5-462f-a5f2-0e28ba909473	contact_point	datasa@sa.gov.au	52a01fb7-cfd8-45d0-95eb-a383844dd816	190a4f9f-5935-4182-bee7-2b6b512f05af	active	\N	2014-11-24 04:36:10.671992	9999-12-31 00:00:00	t
48c453b0-b3a4-4151-8091-358634726940	c8f6e5e0-d7e5-462f-a5f2-0e28ba909473	temporal_coverage_from		52a01fb7-cfd8-45d0-95eb-a383844dd816	48c453b0-b3a4-4151-8091-358634726940	active	\N	2014-11-24 04:36:10.671992	9999-12-31 00:00:00	t
3854b480-4b18-4887-8515-66d528ead6dc	c8f6e5e0-d7e5-462f-a5f2-0e28ba909473	jurisdiction	South Australia	52a01fb7-cfd8-45d0-95eb-a383844dd816	3854b480-4b18-4887-8515-66d528ead6dc	active	\N	2014-11-24 04:36:10.671992	9999-12-31 00:00:00	t
f17d6543-6925-4ea6-b47d-fc71933c600a	c8f6e5e0-d7e5-462f-a5f2-0e28ba909473	update_freq	annually	52a01fb7-cfd8-45d0-95eb-a383844dd816	f17d6543-6925-4ea6-b47d-fc71933c600a	active	\N	2014-11-24 04:36:10.671992	9999-12-31 00:00:00	t
665a3660-2265-4f7c-a80c-7999cfc801d9	c8f6e5e0-d7e5-462f-a5f2-0e28ba909473	data_state	active	52a01fb7-cfd8-45d0-95eb-a383844dd816	665a3660-2265-4f7c-a80c-7999cfc801d9	active	\N	2014-11-24 04:36:10.671992	9999-12-31 00:00:00	t
1adbd45b-f090-4f06-8740-549929c11278	c8f6e5e0-d7e5-462f-a5f2-0e28ba909473	spatial		52a01fb7-cfd8-45d0-95eb-a383844dd816	1adbd45b-f090-4f06-8740-549929c11278	active	\N	2014-11-24 04:36:10.671992	9999-12-31 00:00:00	t
f478a4c9-61f0-451d-b83a-14e378cce9f3	6416437a-727a-4b89-a280-1b92712c045a	temporal_coverage_to		3ed7edb1-aa42-48e0-8e1d-b5a8267d8f49	f478a4c9-61f0-451d-b83a-14e378cce9f3	active	\N	2014-11-24 05:00:49.067335	9999-12-31 00:00:00	t
e533db56-6759-4b6c-80ee-e031c8c647a1	6416437a-727a-4b89-a280-1b92712c045a	data_state	active	3ed7edb1-aa42-48e0-8e1d-b5a8267d8f49	e533db56-6759-4b6c-80ee-e031c8c647a1	active	\N	2014-11-24 05:00:49.067335	9999-12-31 00:00:00	t
30583439-525d-43b9-8583-7c06c27fd1df	6416437a-727a-4b89-a280-1b92712c045a	jurisdiction	South Australia	3ed7edb1-aa42-48e0-8e1d-b5a8267d8f49	30583439-525d-43b9-8583-7c06c27fd1df	active	\N	2014-11-24 05:00:49.067335	9999-12-31 00:00:00	t
7f707342-cf6e-4b8b-94d8-6bc58048c889	6416437a-727a-4b89-a280-1b92712c045a	spatial_coverage	South Australia	3ed7edb1-aa42-48e0-8e1d-b5a8267d8f49	7f707342-cf6e-4b8b-94d8-6bc58048c889	active	\N	2014-11-24 05:00:49.067335	9999-12-31 00:00:00	t
7e8f6df6-e101-4eaf-8563-df153bd4a7b7	6416437a-727a-4b89-a280-1b92712c045a	language	English	3ed7edb1-aa42-48e0-8e1d-b5a8267d8f49	7e8f6df6-e101-4eaf-8563-df153bd4a7b7	active	\N	2014-11-24 05:00:49.067335	9999-12-31 00:00:00	t
95fe28e0-07ad-4980-bb5b-1e4de9bac439	6416437a-727a-4b89-a280-1b92712c045a	spatial		3ed7edb1-aa42-48e0-8e1d-b5a8267d8f49	95fe28e0-07ad-4980-bb5b-1e4de9bac439	active	\N	2014-11-24 05:00:49.067335	9999-12-31 00:00:00	t
6ed3fa03-23ab-4c0b-926b-dd7da27ad413	6416437a-727a-4b89-a280-1b92712c045a	contact_point	datasa@sa.gov.au	3ed7edb1-aa42-48e0-8e1d-b5a8267d8f49	6ed3fa03-23ab-4c0b-926b-dd7da27ad413	active	\N	2014-11-24 05:00:49.067335	9999-12-31 00:00:00	t
286c2827-9160-437d-907d-5745efe34cb5	6416437a-727a-4b89-a280-1b92712c045a	temporal_coverage_from	2014-11-24	3ed7edb1-aa42-48e0-8e1d-b5a8267d8f49	286c2827-9160-437d-907d-5745efe34cb5	active	\N	2014-11-24 05:00:49.067335	9999-12-31 00:00:00	t
5b774089-7078-4c9b-87c3-dd8120fd5f79	6416437a-727a-4b89-a280-1b92712c045a	update_freq	other	3ed7edb1-aa42-48e0-8e1d-b5a8267d8f49	5b774089-7078-4c9b-87c3-dd8120fd5f79	active	\N	2014-11-24 05:00:49.067335	9999-12-31 00:00:00	t
e22585ca-2e10-4e24-b0af-802a332b8e53	2801e4b9-75f5-41fa-be05-e45ed1455078	temporal_coverage_to		7b11e9e7-82b3-4f09-8f3e-da472472bde7	e22585ca-2e10-4e24-b0af-802a332b8e53	active	\N	2014-11-24 05:21:33.047858	9999-12-31 00:00:00	t
b977dc1f-64e2-45f2-8b53-175715b987bd	2801e4b9-75f5-41fa-be05-e45ed1455078	contact_point	datasa@sa.gov.au	7b11e9e7-82b3-4f09-8f3e-da472472bde7	b977dc1f-64e2-45f2-8b53-175715b987bd	active	\N	2014-11-24 05:21:33.047858	9999-12-31 00:00:00	t
63fed570-2d57-4248-8f09-10bc96113c76	2801e4b9-75f5-41fa-be05-e45ed1455078	update_freq	daily	7b11e9e7-82b3-4f09-8f3e-da472472bde7	63fed570-2d57-4248-8f09-10bc96113c76	active	\N	2014-11-24 05:21:33.047858	9999-12-31 00:00:00	t
6a277ab1-3019-43f9-9c90-2ef167a9e2cc	2801e4b9-75f5-41fa-be05-e45ed1455078	temporal_coverage_from		7b11e9e7-82b3-4f09-8f3e-da472472bde7	6a277ab1-3019-43f9-9c90-2ef167a9e2cc	active	\N	2014-11-24 05:21:33.047858	9999-12-31 00:00:00	t
1d2ba46d-e1ff-4600-b4e7-8fb2686fffcf	2801e4b9-75f5-41fa-be05-e45ed1455078	jurisdiction	South Australia	7b11e9e7-82b3-4f09-8f3e-da472472bde7	1d2ba46d-e1ff-4600-b4e7-8fb2686fffcf	active	\N	2014-11-24 05:21:33.047858	9999-12-31 00:00:00	t
7be14f2d-37b2-4c68-931a-7b0934035b7a	2801e4b9-75f5-41fa-be05-e45ed1455078	spatial		7b11e9e7-82b3-4f09-8f3e-da472472bde7	7be14f2d-37b2-4c68-931a-7b0934035b7a	active	\N	2014-11-24 05:21:33.047858	9999-12-31 00:00:00	t
16b274ea-eaba-47d3-83cf-3ad66e2c73e4	2801e4b9-75f5-41fa-be05-e45ed1455078	language	English	7b11e9e7-82b3-4f09-8f3e-da472472bde7	16b274ea-eaba-47d3-83cf-3ad66e2c73e4	active	\N	2014-11-24 05:21:33.047858	9999-12-31 00:00:00	t
808a67f6-6513-41f8-96d6-9dd9b2d6dddf	6f6886f3-ccb3-41cb-91db-d3dcc0cd0cfa	temporal_coverage_from		91e7b5f9-c211-438e-8a32-985833514a92	808a67f6-6513-41f8-96d6-9dd9b2d6dddf	active	\N	2014-11-26 04:26:54.33998	9999-12-31 00:00:00	t
bdf01ad2-fa9c-4bf1-ad7c-2d2e8abacf13	6f6886f3-ccb3-41cb-91db-d3dcc0cd0cfa	spatial_coverage	South Australia	91e7b5f9-c211-438e-8a32-985833514a92	bdf01ad2-fa9c-4bf1-ad7c-2d2e8abacf13	active	9068d7af-7732-4b0f-95cf-71c9ec13a2a9	2014-11-26 04:26:54.33998	2014-11-26 04:53:52.249891	f
b10b9e81-25e5-4f33-b87a-24d505e1cfe4	2801e4b9-75f5-41fa-be05-e45ed1455078	spatial_coverage	South Australia	7b11e9e7-82b3-4f09-8f3e-da472472bde7	b10b9e81-25e5-4f33-b87a-24d505e1cfe4	active	\N	2014-11-24 05:21:33.047858	9999-12-31 00:00:00	t
d824bd66-d398-4326-8d58-3c5449f558e4	2801e4b9-75f5-41fa-be05-e45ed1455078	data_state	active	7b11e9e7-82b3-4f09-8f3e-da472472bde7	d824bd66-d398-4326-8d58-3c5449f558e4	active	\N	2014-11-24 05:21:33.047858	9999-12-31 00:00:00	t
c53ac283-bbe3-41d5-a3a7-c756103c01d7	6f6886f3-ccb3-41cb-91db-d3dcc0cd0cfa	update_freq	annually	91e7b5f9-c211-438e-8a32-985833514a92	c53ac283-bbe3-41d5-a3a7-c756103c01d7	active	\N	2014-11-26 04:26:54.33998	9999-12-31 00:00:00	t
3da211e9-529e-470b-ab2b-e44bcf791ba6	6f6886f3-ccb3-41cb-91db-d3dcc0cd0cfa	temporal_coverage_to		91e7b5f9-c211-438e-8a32-985833514a92	3da211e9-529e-470b-ab2b-e44bcf791ba6	active	\N	2014-11-26 04:26:54.33998	9999-12-31 00:00:00	t
1d8adc91-8544-4c91-b016-527ef3c44731	6f6886f3-ccb3-41cb-91db-d3dcc0cd0cfa	language	English	91e7b5f9-c211-438e-8a32-985833514a92	1d8adc91-8544-4c91-b016-527ef3c44731	active	\N	2014-11-26 04:26:54.33998	9999-12-31 00:00:00	t
121560f1-4ac3-4e37-ae84-012432844916	6f6886f3-ccb3-41cb-91db-d3dcc0cd0cfa	spatial		91e7b5f9-c211-438e-8a32-985833514a92	121560f1-4ac3-4e37-ae84-012432844916	active	\N	2014-11-26 04:26:54.33998	9999-12-31 00:00:00	t
bdf01ad2-fa9c-4bf1-ad7c-2d2e8abacf13	6f6886f3-ccb3-41cb-91db-d3dcc0cd0cfa	spatial_coverage	South Australia, City of Salisbury	9068d7af-7732-4b0f-95cf-71c9ec13a2a9	bdf01ad2-fa9c-4bf1-ad7c-2d2e8abacf13	active	\N	2014-11-26 04:53:52.249891	9999-12-31 00:00:00	t
1e2566bd-a9ea-4013-9def-d126053525d2	fcc91952-372f-400a-a09d-2db4ec0fc7f2	source_type	ckan	ec9e5f13-f0f4-44c8-b36c-83dc54585005	1e2566bd-a9ea-4013-9def-d126053525d2	active	\N	2014-12-05 05:48:06.027534	9999-12-31 00:00:00	t
12f537dc-a421-426c-adda-09da48b6acb2	fcc91952-372f-400a-a09d-2db4ec0fc7f2	frequency	WEEKLY	ec9e5f13-f0f4-44c8-b36c-83dc54585005	12f537dc-a421-426c-adda-09da48b6acb2	active	\N	2014-12-05 05:48:06.027534	9999-12-31 00:00:00	t
66caee8d-8018-4ecb-84cc-81c9cdb78dac	fcc91952-372f-400a-a09d-2db4ec0fc7f2	config	{"read_only": true, "default_extras": {"harvest_url": "{harvest_source_url}/dataset/{dataset_id}"}, "harvested_dataset_whitelist": ["Geoscience Australia CSW"], "user": "custodian"}	ec9e5f13-f0f4-44c8-b36c-83dc54585005	66caee8d-8018-4ecb-84cc-81c9cdb78dac	active	\N	2014-12-05 05:48:06.027534	9999-12-31 00:00:00	t
\.


--
-- Name: package_extra_pkey; Type: CONSTRAINT; Schema: public; Owner: sa; Tablespace: 
--

ALTER TABLE ONLY package_extra
    ADD CONSTRAINT package_extra_pkey PRIMARY KEY (id);


--
-- Name: package_extra_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: sa; Tablespace: 
--

ALTER TABLE ONLY package_extra_revision
    ADD CONSTRAINT package_extra_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: idx_extra_id_pkg_id; Type: INDEX; Schema: public; Owner: sa; Tablespace: 
--

CREATE INDEX idx_extra_id_pkg_id ON package_extra USING btree (id, package_id);


--
-- Name: idx_extra_pkg_id; Type: INDEX; Schema: public; Owner: sa; Tablespace: 
--

CREATE INDEX idx_extra_pkg_id ON package_extra USING btree (package_id);


--
-- Name: idx_package_extra_current; Type: INDEX; Schema: public; Owner: sa; Tablespace: 
--

CREATE INDEX idx_package_extra_current ON package_extra_revision USING btree (current);


--
-- Name: idx_package_extra_package_id; Type: INDEX; Schema: public; Owner: sa; Tablespace: 
--

CREATE INDEX idx_package_extra_package_id ON package_extra_revision USING btree (package_id, current);


--
-- Name: idx_package_extra_period; Type: INDEX; Schema: public; Owner: sa; Tablespace: 
--

CREATE INDEX idx_package_extra_period ON package_extra_revision USING btree (revision_timestamp, expired_timestamp, id);


--
-- Name: idx_package_extra_period_package; Type: INDEX; Schema: public; Owner: sa; Tablespace: 
--

CREATE INDEX idx_package_extra_period_package ON package_extra_revision USING btree (revision_timestamp, expired_timestamp, package_id);


--
-- Name: idx_package_extra_rev_id; Type: INDEX; Schema: public; Owner: sa; Tablespace: 
--

CREATE INDEX idx_package_extra_rev_id ON package_extra_revision USING btree (revision_id);


--
-- Name: package_extra_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sa
--

ALTER TABLE ONLY package_extra
    ADD CONSTRAINT package_extra_package_id_fkey FOREIGN KEY (package_id) REFERENCES package(id);


--
-- Name: package_extra_revision_continuity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sa
--

ALTER TABLE ONLY package_extra_revision
    ADD CONSTRAINT package_extra_revision_continuity_id_fkey FOREIGN KEY (continuity_id) REFERENCES package_extra(id);


--
-- Name: package_extra_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sa
--

ALTER TABLE ONLY package_extra
    ADD CONSTRAINT package_extra_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES revision(id);


--
-- Name: package_extra_revision_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sa
--

ALTER TABLE ONLY package_extra_revision
    ADD CONSTRAINT package_extra_revision_package_id_fkey FOREIGN KEY (package_id) REFERENCES package(id);


--
-- Name: package_extra_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sa
--

ALTER TABLE ONLY package_extra_revision
    ADD CONSTRAINT package_extra_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES revision(id);


--
-- PostgreSQL database dump complete
--

